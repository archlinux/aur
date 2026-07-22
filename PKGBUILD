# Contributor: katt <magunasu.b97@gmail.com>

pkgname=duckstation-git
_pkgname=duckstation
pkgver=0.1.r11607.g42bf523e8
pkgdesc='A Sony PlayStation (PSX) emulator, focusing on playability, speed, and long-term maintainability (git version)'
pkgrel=1
arch=(x86_64 aarch64)
url=https://github.com/stenzek/duckstation
license=(CC-BY-NC-ND-4.0)
depends=(
    sh
    glibc
    gcc-libs
    sdl3
    qt6-base
    libbacktrace.so
    libwebp.so
    libjpeg.so
    libxcb
    libx11
    freetype2 libfreetype.so
    harfbuzz
    sqlite
    libzstd.so
    libz.so
    libzip.so
    libcurl.so
    systemd-libs libudev.so
    cpuinfo
    spirv-cross
    soundtouch
    plutosvg
    discord-rpc
    hicolor-icon-theme
)
makedepends=(
    git
    cmake
    clang
    lld
    llvm
    extra-cmake-modules
    qt6-tools
    qt6-wayland
    libdrm
    libpulse
    alsa-lib
    sndio
    ninja
    jack
    python
    spirv-headers
    patchelf
    ffmpeg
)
optdepends=(
    'qt6-wayland: Wayland support'
    'libpulse: Pulseaudio support'
    'sndio: Small audio support'
    'alsa-lib: ALSA support'
    'jack: JACK support'
    'ffmpeg: Video capture support'
)
options=(lto)
provides=(duckstation)
conflicts=(duckstation)
source=(
    git+"$url".git
    shaderc::git+https://github.com/stenzek/shaderc.git#commit=d72697bfc353b547efc58421ad54ac0345441bf4
    https://downloads.sourceforge.net/project/libpng/libpng16/1.6.58/libpng-1.6.58.tar.gz
    libpng-apng.patch::https://raw.githubusercontent.com/stenzek/duckstation/19b618d44b08f8b2239de060bd022de374795252/scripts/deps/libpng-1.6.54-apng.patch
    https://github.com/duckstation/chtdb/releases/download/latest/cheats.zip
    https://github.com/duckstation/chtdb/releases/download/latest/patches.zip
    duckstation-qt.desktop
    duckstation-qt.sh
    DuckStationSystemDependencies.cmake)
sha256sums=('SKIP'
            '580a5fffc1a8469361efecccf4d67a809426f4a739e70dc6780a25317bf91b4a'
            '8c9b05b675ca7301a458df2c2e46f26e1d41ff36b8863f8c33530bc58c2e6225'
            '6eb79c8b12b1c9961c9f05a11b66a5fd020d66d5f540f27c11f91b542a97a7ca'
            'e14a1cbb0a0ece736b9df2da138f6e33653562a37a41a625ff4ade37a6056910'
            'c1d2b3565a42adaab60a9f56fc722aa98781ddb2b79793d5679568966d643f27'
            'ec2d7358f81598390a8ceca2d1974be3e5f7c45602b550c89a1e9323ab45474b'
            '3541462e5988551f1a618fb167c50054184871cd0c7a583a7f2388d195e1cd7e'
            'c8eb4a1d692b93a6ab283f8e03e842f1d02a191b5589c1812221a28c1250a6e3')
noextract=(
    cheats.zip
    patches.zip
)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    patch -d "$srcdir/libpng-1.6.58" -Np1 -i "$srcdir/libpng-apng.patch"

    # bundle additional resources
    cp "$srcdir/cheats.zip" "$srcdir/patches.zip" "$srcdir/duckstation/data/resources"

    # Use Arch libraries rather than upstream's prebuilt bundle, and let dlopen
    # resolve system-owned runtime libraries through their SONAMEs.
    cp "$srcdir/DuckStationSystemDependencies.cmake" \
        "$srcdir/duckstation/CMakeModules/DuckStationDependencies.cmake"

    # These libraries are loaded at runtime. Pass only their SONAME to dlopen()
    # instead of forcing a lookup beside the DuckStation executable.
    sed -i 's/bundle_libraries(${target} spirv-cross-c-shared Shaderc::shaderc_shared SQLite3::sqlite3-shared)/bundle_libraries(${target} Shaderc::shaderc_shared)/' \
        "$srcdir/duckstation/src/util/CMakeLists.txt"
    sed -i '/GetBundledLibraryPath("spirv-cross-c-shared", SPVC_C_API_VERSION_MAJOR)/s/GetBundledLibraryPath/GetVersionedFilename/' \
        "$srcdir/duckstation/src/util/gpu_device.cpp"
    sed -i '/GetBundledLibraryPath("sqlite3", lib_major_version)/s/GetBundledLibraryPath/GetVersionedFilename/' \
        "$srcdir/duckstation/src/util/sqlite_helpers.cpp"

    # DuckStation needs APNG support (animated memory-card icons), which Arch's
    # libpng lacks. Build libpng (with the APNG patch) as a static library and
    # link it into the executable; point util at the static target. build()
    # localizes its symbols (--exclude-libs) so the APNG-patched png_struct
    # can't clash with the stock system libpng pulled in by Qt/FreeType/plutosvg.
    sed -i 's/PNG::png_shared/PNG::png_static/' \
        "$srcdir/duckstation/src/util/CMakeLists.txt"

    # discord-rpc is provided by the system package instead of upstream's fork.
    # It's dlopen()'d at runtime: resolve it by SONAME (libdiscord-rpc.so) via
    # the system loader rather than looking for a copy beside the executable,
    # and drop the step that would bundle it into the package.
    sed -i 's/GetBundledLibraryPath("discord-rpc")/GetVersionedFilename("discord-rpc")/' \
        "$srcdir/duckstation/src/core/discord_presence.cpp"
    sed -i '/bundle_libraries(${target} DiscordRPC::discord-rpc)/d' \
        "$srcdir/duckstation/src/core/CMakeLists.txt"

    # Arch's soundtouch package builds only the C++ SoundTouch library, not the
    # SoundTouchDLL C wrapper DuckStation includes. Generate a header-only shim
    # that maps the soundtouch_* C API onto the C++ class; the replacement
    # dependency module above points SoundTouch::SoundTouchDLL at this directory.
    install -d "$srcdir/duckstation/dep/soundtouchdll/soundtouch"
    cat > "$srcdir/duckstation/dep/soundtouchdll/soundtouch/SoundTouchDLL.h" <<'EOF'
// Compatibility shim mapping the SoundTouchDLL C API onto the C++ SoundTouch
// class, so DuckStation can use the system soundtouch package (which does not
// build the SoundTouchDLL wrapper).
#pragma once

#include "soundtouch/SoundTouch.h"

static inline void* soundtouch_createInstance()
{
  return static_cast<void*>(new soundtouch::SoundTouch());
}
static inline void soundtouch_destroyInstance(void* h)
{
  delete static_cast<soundtouch::SoundTouch*>(h);
}
static inline void soundtouch_setSampleRate(void* h, unsigned int srate)
{
  static_cast<soundtouch::SoundTouch*>(h)->setSampleRate(srate);
}
static inline void soundtouch_setChannels(void* h, unsigned int numChannels)
{
  static_cast<soundtouch::SoundTouch*>(h)->setChannels(numChannels);
}
static inline void soundtouch_setTempo(void* h, float newTempo)
{
  static_cast<soundtouch::SoundTouch*>(h)->setTempo(newTempo);
}
static inline void soundtouch_setRate(void* h, float newRate)
{
  static_cast<soundtouch::SoundTouch*>(h)->setRate(newRate);
}
static inline void soundtouch_setSetting(void* h, int settingId, int value)
{
  static_cast<soundtouch::SoundTouch*>(h)->setSetting(settingId, value);
}
static inline void soundtouch_putSamples(void* h, const float* samples, unsigned int numSamples)
{
  static_cast<soundtouch::SoundTouch*>(h)->putSamples(samples, numSamples);
}
static inline unsigned int soundtouch_receiveSamples(void* h, float* outBuffer, unsigned int maxSamples)
{
  return static_cast<soundtouch::SoundTouch*>(h)->receiveSamples(outBuffer, maxSamples);
}
static inline void soundtouch_clear(void* h)
{
  static_cast<soundtouch::SoundTouch*>(h)->clear();
}
EOF

    # Upstream explicitly refuses Arch Linux build environments.
    sed -i 's/ID=arch/ID=unsupported-arch/g' \
        "$srcdir/duckstation/CMakeModules/DuckStationBuildSummary.cmake"

    # Don't force the xdg-desktop-portal Qt platform theme on KDE/GNOME: it
    # fails to register over D-Bus (and pops an empty warning dialog) unless
    # xdg-desktop-portal and a matching backend are installed and running,
    # which isn't guaranteed on Arch.
    sed -i '/setenv("QT_QPA_PLATFORMTHEME", "xdgdesktopportal", true);/d' \
        "$srcdir/duckstation/src/duckstation-qt/qthost.cpp"

    # Upstream aborts startup (returning false with no error message, which
    # surfaces as an empty "Process Startup Failed" dialog) when the AppRoot is
    # under /usr. That's exactly where a distro package belongs, so drop the
    # guard and let it run from /usr/lib/duckstation.
    sed -i 's#if (std::memcmp(EmuFolders::AppRoot.data(), "/usr/", 5) == 0)#if (false)#' \
        "$srcdir/duckstation/src/core/core.cpp"
}

build() {
    local common_cmake_options=(
        -G Ninja
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_C_COMPILER=clang
        -DCMAKE_CXX_COMPILER=clang++
        -DCMAKE_EXE_LINKER_FLAGS_INIT=-fuse-ld=lld
        -DCMAKE_MODULE_LINKER_FLAGS_INIT=-fuse-ld=lld
        -DCMAKE_SHARED_LINKER_FLAGS_INIT=-fuse-ld=lld
        -DCMAKE_LINK_DEPENDS_USE_LINKER=OFF
        -DCMAKE_INSTALL_PREFIX=/usr
        -DBUILD_SHARED_LIBS=ON
    )

    cmake -B build-libpng -S libpng-1.6.58 \
        "${common_cmake_options[@]}" \
        -DPNG_TESTS=OFF \
        -DPNG_STATIC=ON \
        -DPNG_SHARED=OFF \
        -DPNG_TOOLS=OFF \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    ninja -C build-libpng
    DESTDIR="$srcdir/deps" ninja -C build-libpng install

    cmake -B build-shaderc -S shaderc \
        "${common_cmake_options[@]}" \
        -DBUILD_SHARED_LIBS=OFF \
        -DSPIRV_TOOLS_BUILD_SHARED=ON \
        -DSHADERC_SKIP_TESTS=ON \
        -DSHADERC_SKIP_EXAMPLES=ON \
        -DSHADERC_SKIP_EXECUTABLES=ON \
        -DSHADERC_SKIP_COPYRIGHT_CHECK=ON
    ninja -C build-shaderc
    DESTDIR="$srcdir/deps" ninja -C build-shaderc install

    echo "Building duckstation..."

    cmake -B build -S duckstation \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_C_FLAGS="$CFLAGS -Wno-error=format-security" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-error=format-security" \
        -DCMAKE_EXE_LINKER_FLAGS_INIT="-fuse-ld=lld -Wl,--exclude-libs,libpng16.a" \
        -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
        -DCMAKE_PREFIX_PATH="$srcdir/deps/usr" \
        -Wno-dev
    ninja -C build
}

package() {
    # Install everything into /usr/lib/duckstation
    install -m 755 -d "${pkgdir}/usr/lib"
    cp -drv --no-preserve='ownership' build/bin "${pkgdir}/usr/lib/${_pkgname}"
    # Install bundled libraries
    find "${srcdir}/deps/usr/lib" -name '*.so*' -exec cp -dv --no-preserve='ownership' '{}' "${pkgdir}/usr/lib/${_pkgname}/" \;

    # patch rpath
    patchelf --force-rpath --set-rpath "/usr/lib/${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}/$_pkgname-qt"

    # Install additional license
    install -Dvm644 "${pkgdir}/usr/lib/${_pkgname}/resources/thirdparty.html" "${pkgdir}/usr/share/licenses/${pkgname}/thirdparty.html"

    install -Dvm755 "${srcdir}/duckstation-qt.sh" "${pkgdir}/usr/bin/duckstation-qt"
    install -Dvm644 "${srcdir}/duckstation-qt.desktop" "${pkgdir}/usr/share/applications/duckstation-qt.desktop"
    install -Dvm644 "${pkgdir}/usr/lib/${_pkgname}/resources/images/duck.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/duckstation-qt.png"
}
