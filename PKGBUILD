# Maintainer: kanya-approve

pkgname=waydroid-apple-music
pkgver=1.0.0
pkgrel=1
pkgdesc="Bit-perfect Apple Music on Waydroid: patched audio HAL, container properties, and app settings. Works with any Waydroid image; ships neither the image nor the app."
arch=('x86_64')
url="https://github.com/kanya-approve/android_hardware_waydroid-hires"
license=('Apache-2.0')

depends=('waydroid')

# android-ndk is an AUR package, so plain `makepkg -s` cannot resolve it -
# build through an AUR helper or install it first.
makedepends=('android-ndk')

optdepends=('pipewire-audio: sample-rate switching for bit-perfect output')

install="${pkgname}.install"
options=('!strip' '!debug')


# Patched audio HAL. Upstream Waydroid forces every output stream to
# S16_LE/48000 and treats float as unrepresentable, so hi-res and even ordinary
# 44.1kHz content is resampled on the way out. Built from source here; drop
# this block and _build_hal once the fix lands in Waydroid proper.
_hal=407f9b6278d039352e730c696e784216a2fb6606
_libhardware=0eb202d7ebd7d2410eb2f62c908c0341964a4829     # lineage-20.0
_media=41c2d1ab132fd5388d39418507263e77483fe987           # lineage-20.0
_core=c0500ffe2cc283d61f1e3db1b2c979bfbd9beb8c            # lineage-20.0
_logging=373d54e772f303c441faf2e584a2edf3601b4181         # lineage-20.0
_alsa=8a1eff33a2430b29ea2fc11f32a0a349e90c1c93            # lineage-17.1, Waydroid's alsa fork
_halurl=https://github.com/kanya-approve/android_hardware_waydroid-hires
_ndkapi=33                                                # Android 13
_ndkarch=i686                                             # /vendor/lib/hw is 32-bit
_module=audio.primary.waydroid

source=('99-waydroid-hires.conf'
        "hal-${_hal}.tar.gz::${_halurl}/archive/${_hal}.tar.gz"
        "libhardware-${_libhardware}.tar.gz::https://github.com/LineageOS/android_hardware_libhardware/archive/${_libhardware}.tar.gz"
        "media-${_media}.tar.gz::https://github.com/LineageOS/android_system_media/archive/${_media}.tar.gz"
        "core-${_core}.tar.gz::https://github.com/LineageOS/android_system_core/archive/${_core}.tar.gz"
        "logging-${_logging}.tar.gz::https://github.com/LineageOS/android_system_logging/archive/${_logging}.tar.gz"
        "alsa-${_alsa}.tar.gz::https://github.com/WayDroid/android_external_alsa-lib/archive/${_alsa}.tar.gz")
sha256sums=('SKIP'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    # alsa-lib generates asoundlib.h and version.h during its own build - the
    # repo only carries asoundlib-head.h and -tail.h. Reproduce what its
    # Android.mk does so they exist before the HAL compiles against them.
    local a="${srcdir}/android_external_alsa-lib-${_alsa}"
    local g="${srcdir}/alsa-gen/alsa"
    install -dm755 "$g"

    local ver major minor sub
    ver=$(sed -n 's/^AC_INIT(alsa-lib, \([0-9.]*\))/\1/p' "$a/configure.ac" | head -1)
    [ -n "$ver" ] || { error "could not read the alsa version from configure.ac"; return 1; }
    IFS=. read -r major minor sub <<< "$ver"
    {
        echo "#define SND_LIB_MAJOR $major"
        echo "#define SND_LIB_MINOR $minor"
        echo "#define SND_LIB_SUBMINOR $sub"
        echo "#define SND_LIB_EXTRAVER 1000000"
        echo "#define SND_LIB_VER(maj, min, sub) (((maj)<<16)|((min)<<8)|(sub))"
        echo "#define SND_LIB_VERSION SND_LIB_VER(SND_LIB_MAJOR, SND_LIB_MINOR, SND_LIB_SUBMINOR)"
        echo "#define SND_LIB_VERSION_STR \"$ver\""
    } > "$g/version.h"
    cp "$g/version.h" "${srcdir}/alsa-gen/version.h"
    {
        cat "$a/include/asoundlib-head.h"
        sed -n 's/.*\(#include <[ae].*\.h>\).*/\1/p' "$a/configure.ac"
        cat "$a/include/asoundlib-tail.h"
    } > "$g/asoundlib.h"
    msg2 "generated alsa headers for ${ver}"
}

build() {
    local cc
    cc="$(find /opt/android-ndk/toolchains/llvm/prebuilt -maxdepth 1 -mindepth 1 -type d | head -1)/bin/clang"
    [ -x "$cc" ] || { error "no NDK clang under /opt/android-ndk"; return 1; }

    local inc=(
        -I"${srcdir}/android_hardware_libhardware-${_libhardware}/include"
        -I"${srcdir}/android_system_media-${_media}/audio/include"
        -I"${srcdir}/android_system_media-${_media}/audio_utils/include"
        -I"${srcdir}/android_system_media-${_media}/audio_effects/include"
        -I"${srcdir}/android_system_core-${_core}/libcutils/include"
        -I"${srcdir}/android_system_core-${_core}/libsystem/include"
        -I"${srcdir}/android_system_logging-${_logging}/liblog/include"
        -I"${srcdir}/alsa-gen"
        -I"${srcdir}/android_external_alsa-lib-${_alsa}/android"
        -I"${srcdir}/android_external_alsa-lib-${_alsa}/include"
    )
    local src="${srcdir}/android_hardware_waydroid-hires-${_hal}/audio/audio_hw.c"
    [ -f "$src" ] || { error "HAL source missing at $src"; return 1; }

    msg2 "pass 1: discovering undefined symbols"
    "$cc" --target="${_ndkarch}-linux-android${_ndkapi}" -shared -fPIC -O2 \
        -Wall -Wno-unused-parameter "${inc[@]}" -DHAVE_BIG_ENDIAN=0 \
        -o "${srcdir}/${_module}.so" "$src" -llog -Wl,--allow-shlib-undefined || return 1

    # Android's vendor linker namespace resolves symbols only from libraries
    # named in DT_NEEDED. libasound and libcutils are not in the NDK, so build
    # stubs carrying the right SONAMEs purely to satisfy the link; at runtime
    # the loader binds to the real ones inside the container. Without this the
    # HAL loads but no snd_pcm_* call resolves, every output fails to open, and
    # AudioFlinger reports getOutputForAttr() = -19 for every stream.
    install -dm755 "${srcdir}/stubs"
    readelf -W --dyn-syms "${srcdir}/${_module}.so" \
        | awk '$7=="UND"{print $8}' | sed 's/@.*//' | sort -u > "${srcdir}/stubs/und.txt"
    local lib re n sym
    for lib in libasound libcutils; do
        case "$lib" in
            libasound) re='^snd_' ;;
            libcutils) re='^(str_parms_|property_)' ;;
        esac
        : > "${srcdir}/stubs/${lib}.c"
        n=0
        while read -r sym; do
            printf 'void %s(void) {}\n' "$sym" >> "${srcdir}/stubs/${lib}.c"
            n=$((n+1))
        done < <(grep -E "$re" "${srcdir}/stubs/und.txt")
        [ "$n" -gt 0 ] || { error "no symbols matched for ${lib}"; return 1; }
        "$cc" --target="${_ndkarch}-linux-android${_ndkapi}" -shared -fPIC \
            -Wl,-soname,"${lib}.so" -o "${srcdir}/stubs/${lib}.so" \
            "${srcdir}/stubs/${lib}.c" || return 1
        msg2 "  stub ${lib}.so (${n} symbols)"
    done

    msg2 "pass 2: relinking against libasound and libcutils"
    "$cc" --target="${_ndkarch}-linux-android${_ndkapi}" -shared -fPIC -O2 \
        -Wall -Wno-unused-parameter "${inc[@]}" -DHAVE_BIG_ENDIAN=0 \
        -o "${srcdir}/${_module}.so" "$src" \
        -L"${srcdir}/stubs" -lasound -lcutils -llog || return 1
}

check() {
    local so="${srcdir}/${_module}.so"
    # Both of these fail silently at runtime: Android falls back to the stub
    # HAL and there is simply no sound, with nothing obvious in the log.
    file -b "$so" | grep -q 'ELF 32-bit.*[iI]386' \
        || { error "HAL is not 32-bit i386; /vendor/lib/hw will not load it"; return 1; }
    readelf -W --dyn-syms "$so" | grep -q ' HMI$' \
        || { error "HAL exports no HMI symbol; Android will not recognise it"; return 1; }
    local lib
    for lib in libasound.so libcutils.so; do
        readelf -d "$so" | grep -q "\[$lib\]" \
            || { error "$lib missing from DT_NEEDED; snd_pcm_* will not resolve"; return 1; }
    done
    msg2 "HAL: 32-bit i386, exports HMI, links libasound and libcutils"
}

package() {
    # Waydroid mounts this overlay over the container's /vendor. The HAL and
    # the policy must ship together: the policy advertises float profiles and
    # the stock HAL aborts on float.
    local _overlay="${pkgdir}/var/lib/waydroid/overlay"
    install -Dm644 "${srcdir}/${_module}.so" \
        "${_overlay}/vendor/lib/hw/${_module}.so"
    install -Dm644 "${srcdir}/android_hardware_waydroid-hires-${_hal}/audio/audio_policy_configuration.xml" \
        "${_overlay}/vendor/etc/audio_policy_configuration.xml"

    # Let PipeWire follow the source rate instead of resampling to a fixed one.
    # System-wide because a package must not write into a user's ~/.config.
    install -Dm644 "${srcdir}/99-waydroid-hires.conf" \
        "${pkgdir}/etc/pipewire/pipewire.conf.d/99-waydroid-hires.conf"
}
