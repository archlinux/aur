# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Co-Maintainer: FGD

pkgname=firedragon
_pkgname=FireDragon
pkgver=11.9.0
_floorp_core_commit=cefaa9a0352456c45be6a917e6664f8ef054a68f
_floorp_l10n_commit=6915ae0005fdb1684f3b6b0731bdec1a0596f7e8
pkgrel=3
epoch=1
pkgdesc="Floorp fork build using custom branding & settings"
url='http://dr460nf1r3.org'
arch=('x86_64')
license=('MPL2')
depends=(dbus
    dbus-glib
    ffmpeg
    gtk3
    libevent
    libjpeg
    libpulse
    libvpx
    libwebp
    libxss
    libxt
    mime-types
    nss
    pipewire
    ttf-font
    zlib)
makedepends=(cbindgen
    clang
    diffutils
    dump_syms
    imagemagick
    imake
    inetutils
    git
    jack
    lld
    llvm
    mesa
    mold
    nasm
    nodejs
    python
    rust
    unzip
    wasi-compiler-rt
    wasi-libc
    wasi-libc++
    wasi-libc++abi
    xorg-server-xvfb
    yasm
    zip)
optdepends=('hunspell-dictionary: Spell checking'
    'libnotify: Notification integration'
    'networkmanager: Location detection via available WiFi networks'
    'profile-sync-daemon: Load the browser profile into RAM'
    'pulseaudio: Audio support'
    'searx: Searching the web using a locally running searX instance'
    'speech-dispatcher: Text-to-Speech'
    'whoogle: Searching the web using a locally running Whoogle instance'
    'xdg-desktop-portal: Screensharing with Wayland')
replaces=(firedragon-next)
options=(!debug
    !emptydirs
    !lto
    !makeflags
    !strip)
backup=("usr/lib/${pkgname}/${pkgname}.cfg"
    "usr/lib/${pkgname}/distribution/policies.json")
source=(https://github.com/Floorp-Projects/Floorp/archive/refs/tags/v"${pkgver}".tar.gz
    "floorp-core::git+https://github.com/Floorp-Projects/Floorp-core#commit=$_floorp_core_commit"
    "floorp-l10n-central::git+https://github.com/Floorp-Projects/Unified-l10n-central#commit=$_floorp_l10n_commit"
    "common::git+https://gitlab.com/garuda-linux/firedragon/common.git"
    "settings::git+https://gitlab.com/garuda-linux/firedragon/settings.git"
    "${pkgname}.desktop")
sha256sums=('11a7b2bfc2582220e0e0f0be90b9575249f52856fe21b55cbce9b72c516d654e'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '53d3e743f3750522318a786befa196237892c93f20571443fdf82a480e7f0560')
install="${pkgname}.install"

prepare() {
    # Floorp's shenanigan to make the build work without cloning the whole
    # git source (puts submodules' content in place)
    mv -f "${srcdir}"/floorp-core/* ./Floorp-"${pkgver}"/floorp
    mv -f "${srcdir}"/floorp-l10n-central/* ./Floorp-"${pkgver}"/floorp/browser/locales/l10n-central

    rm -rf "${srcdir}/mozbuild"
    mkdir "${srcdir}/mozbuild"

    cd Floorp-"${pkgver}" || exit
    cat >../mozconfig <<END
ac_add_options --with-app-basename=${_pkgname}
ac_add_options --with-app-name=${pkgname}
ac_add_options --with-branding=browser/branding/firedragon
ac_add_options --with-l10n-base=${PWD@Q}/floorp/browser/locales/l10n-central
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

# Build options
ac_add_options --disable-bootstrap
ac_add_options --disable-elf-hack
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland
ac_add_options --enable-hardening
ac_add_options --enable-linker=mold
ac_add_options --enable-lto=cross,full
ac_add_options --enable-optimize="-O3"
ac_add_options --enable-release
ac_add_options --enable-rust-simd
ac_add_options --enable-wasm-simd
ac_add_options --prefix=/usr
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
export MOZ_INCLUDE_SOURCE_INFO=1
export RUSTC_OPT_LEVEL=2

# Branding
ac_add_options --allow-addon-sideload
ac_add_options --enable-unverified-updates
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.garudalinux
ac_add_options --with-unsigned-addon-scopes=app,system
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=${pkgname}
export MOZ_CRASHREPORTER=
export MOZ_DATA_REPORTING=
export MOZ_REQUIRE_SIGNING=
export MOZ_SERVICES_HEALTHREPORT=
export MOZ_TELEMETRY_REPORTING=

# System libraries
ac_add_options --with-system-jpeg
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-webp
ac_add_options --with-system-zlib

# Features
ac_add_options --disable-crashreporter # (Minimize telemetry)
ac_add_options --disable-debug
ac_add_options --disable-debug-js-modules
ac_add_options --disable-debug-symbols
ac_add_options --disable-default-browser-agent
ac_add_options --disable-gpsd
ac_add_options --disable-necko-wifi
ac_add_options --disable-parental-controls # (Disable local/OS MTIM)
ac_add_options --disable-rust-tests
ac_add_options --disable-synth-speechd
ac_add_options --disable-tests
# ac_add_options --disable-update-agent # (Might have to wait for a more recent version of Firefox. The setting is not availabe on v115)
ac_add_options --disable-updater
ac_add_options --disable-warnings-as-errors
ac_add_options --disable-webspeech
ac_add_options --disable-webspeechtestbackend
ac_add_options --enable-alsa
ac_add_options --enable-bundled-fonts # (CSS system fonts are normalized, to hide any customization at the OS level, or the defaults that different locales might have)
ac_add_options --enable-jack
ac_add_options --enable-jxl
ac_add_options --enable-proxy-bypass-protection
ac_add_options --enable-strip

# Other
export AR=llvm-ar
export CC=clang
export CXX=clang++
export NM=llvm-nm
export RANLIB=llvm-ranlib
END

    local _patches_dir
    _patches_dir="${srcdir}/common/patches"

    local _floorp_patches_dir
    _floorp_patches_dir="${srcdir}/common/patches/floorp/"

    _patch() {
        printf 'Patching %s ...\n' "$1"
        patch -Np1 -i "$1"
    }

    # Remove some pre-installed addons that might be questionable
    _patch "${_floorp_patches_dir}"/remove_addons.patch

    # Stop some undesired requests (https://gitlab.com/librewolf-community/browser/common/-/issues/10)
    _patch "${_floorp_patches_dir}"/sed-patches/stop-undesired-requests.patch

    # Assorted patches
    _patch "${_floorp_patches_dir}"/urlbarprovider-interventions.patch

    # Allow uBlockOrigin to run in private mode by default, without user intervention.
    _patch "${_floorp_patches_dir}"/allow-ubo-private-mode.patch

    # Add custom uBO assets (on first launch only)
    _patch "${_floorp_patches_dir}"/custom-ubo-assets-bootstrap-location.patch

    # Allows hiding the password manager (from the lw pref pane) / via a pref
    _patch "${_floorp_patches_dir}"/hide-passwordmgr.patch

    # Add Firedragon Preferences Pane
    _patch "${_patches_dir}"/pref-pane/pref-pane-small.patch
    cp "${_patches_dir}/pref-pane/category-firedragon.svg" browser/themes/shared/preferences/category-firedragon.svg
    cp "${_patches_dir}/pref-pane/firedragon.css" browser/themes/shared/preferences/firedragon.css
    cp "${_patches_dir}/pref-pane/firedragon.inc.xhtml" browser/components/preferences/firedragon.inc.xhtml
    cp "${_patches_dir}/pref-pane/firedragon.js" browser/components/preferences/firedragon.js
    cat < "${_patches_dir}/pref-pane/preferences.ftl" >> browser/locales/en-US/browser/preferences/preferences.ftl

    # Update privacy preferences -- DISABLED to test UI changes and allow user to easily change the setting
    # _patch "${_patches_dir}"/custom/privacy-preferences.patch

    rm -f "${srcdir}"/common/source_files/mozconfig
    cp -r "${srcdir}"/common/source_files/* ./
}

build() {
    cd Floorp-"${pkgver}" || exit

    export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
    export MOZBUILD_STATE_PATH="${srcdir}/mozbuild"
    export MOZ_ENABLE_FULL_SYMBOLS=1
    export MOZ_NOSPAM=1
    export MOZ_PROFILER_STARTUP=1 # Starts the profiler is started as early as possible during startup.

    # Malloc_usable_size is used in various parts of the codebase
    CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
    CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

    # LTO needs more open files
    ulimit -n 4096

    # Do 3-tier PGO
    echo "Building instrumented browser..."
    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
    ./mach build

    echo "Profiling instrumented browser..."
    ./mach package
    LLVM_PROFDATA=llvm-profdata \
        JARLOG_FILE="${PWD}/jarlog" \
        xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
        ./mach python build/pgo/profileserver.py

    echo "Removing instrumented browser..."
    ./mach clobber

    echo "Building optimized browser..."
    cat >.mozconfig ../mozconfig

    if [[ -s merged.profdata ]]; then
        stat -c "Profile data found (%s bytes)" merged.profdata
        echo "ac_add_options --enable-profile-use=cross" >>.mozconfig
        echo "ac_add_options --with-pgo-profile-path='${PWD@Q}/merged.profdata'" >>.mozconfig
    else
        echo "Profile data not found."
    fi

    if [[ -s jarlog ]]; then
        stat -c "Jar log found (%s bytes)" jarlog
        echo "ac_add_options --with-pgo-jarlog='${PWD@Q}/jarlog'" >>.mozconfig
    else
        echo "Jar log not found."
    fi

    ./mach build

    echo "Building symbol archive..."
    ./mach buildsymbols
}

package() {
    cd Floorp-"${pkgver}" || exit

    DESTDIR="${pkgdir}" ./mach install

    rm "${pkgdir}/usr/lib/${pkgname}/pingsender"

    local vendorjs="${pkgdir}/usr/lib/${pkgname}/browser/defaults/preferences/vendor.js"
    install -Dvm644 /dev/stdin "${vendorjs}" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);

// Enable GNOME Shell search provider
pref("browser.gnome-search-provider.enabled", true);
END

    local distini="${pkgdir}/usr/lib/${pkgname}/distribution/distribution.ini"
    install -Dvm644 /dev/stdin "${distini}" <<END
[Global]
id=${pkgname}
version=${pkgver}-${pkgrel}
about=${pkgdesc}

[Preferences]
app.distributor=garudalinux
app.distributor.channel=${pkgname}
app.partner.garudalinux=garudalinux
END

    # Use system certificates
    local nssckbi="${pkgdir}/usr/lib/${pkgname}/libnssckbi.so"
    if [[ -e "${nssckbi}" ]]; then
        ln -srfv "${pkgdir}/usr/lib/libnssckbi.so" "${nssckbi}"
    fi

    # Make native messaging work
    ln -s "/usr/lib/mozilla/native-messaging-hosts" "${pkgdir}/usr/lib/${pkgname}/native-messaging-hosts"

    # GNOME search provider
    local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/$pkgname.search-provider.ini"
    install -Dvm644 /dev/stdin "$sprovider" <<END
[Shell Search Provider]
DesktopId=$pkgname.desktop
BusName=org.mozilla.${pkgname//-/}.SearchProvider
ObjectPath=/org/mozilla/${pkgname//-/}/SearchProvider
Version=2
END

    # Application icons
    for i in 16 32 48 64 128; do
        install -Dvm644 browser/branding/firedragon/default$i.png \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
    done
    install -Dvm644 browser/branding/firedragon/content/about-logo.png \
        "${pkgdir}/usr/share/icons/hicolor/192x192/apps/${pkgname}.png"

    # Replace duplicate binary with wrapper
    # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
    ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/${pkgname%-*}-bin"

    # All the needed configuration files
    install -Dvm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dvm644 "${srcdir}/settings/firedragon.cfg" "${pkgdir}/usr/lib/${pkgname}/firedragon.cfg"
    install -Dvm644 "${srcdir}/settings/firedragon.psd" "${pkgdir}/usr/share/psd/browsers/firedragon"
    install -Dvm644 "${srcdir}/settings/defaults/pref/local-settings.js" "${pkgdir}/usr/lib/${pkgname}/defaults/pref/local-settings.js"
    install -Dvm644 "${srcdir}/settings/distribution/policies.json" "${pkgdir}/usr/lib/${pkgname}/distribution/policies.json"
}
