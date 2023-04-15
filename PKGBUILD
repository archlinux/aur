# Maintainer: Vladislav Nepogodin (vnepogodin) <vnepogodin@cachyos.org>
# Contributor: lsf
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=cachy-browser
_pkgname=Cachy
__pkgname=cachy
pkgver=112.0
pkgrel=2
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom."
arch=(x86_64 x86_64_v3)
license=(
  GPL
  LGPL
  MPL
)
depends=(
  dbus-glib
  ffmpeg
  gtk3
  icu
  libevent
  libjpeg
  libpulse
  libvpx
  libwebp
  libxt
  mime-types
  nss
  ttf-font
  zlib
)
makedepends=(
  cbindgen
  clang
  diffutils
  dump_syms
  imake
  inetutils
  jack
  lld
  llvm
  mesa
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
  zip
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
groups=('cachyos')
options=(
  !debug
  !emptydirs
  !lto
  !makeflags
  !strip
)
install=cachy-browser.install
backup=('usr/lib/cachy-browser/cachyos.cfg'
        'usr/lib/cachy-browser/distribution/policies.json')
source=(https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz{,.asc}
        $pkgname.desktop
        "git+https://github.com/cachyos/cachyos-browser-settings.git"
        "git+https://github.com/cachyos/cachyos-browser-common.git"
        "match.patch")
sha256sums=('eb19185f7bfa5c3b0c73edaa57160b44bf3bb2139db83539809607486b8075d9'
            'SKIP'
            'c0786df2fd28409da59d0999083914a65e2097cda055c9c6c2a65825f156e29f'
            'SKIP'
            'SKIP'
            '1fbb1971a1d0d4c875b1af0f9681601909cfbe4fe0cc2c2f42c523c84c934499')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla Software Releases <release@mozilla.com>

prepare() {
    mkdir -p mozbuild
    cd firefox-$pkgver

    local _patches_dir="${srcdir}/cachyos-browser-common/patches"

    cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=mold
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland

export AR=llvm-ar
export CC='clang'
export CXX='clang++'
export NM=llvm-nm
export RANLIB=llvm-ranlib

# Branding
ac_add_options --enable-update-channel=release
ac_add_options --with-app-name=${pkgname}
ac_add_options --with-app-basename=${_pkgname}
ac_add_options --with-branding=browser/branding/${__pkgname}
ac_add_options --with-distribution-id=cachyos.org
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZ_REQUIRE_SIGNING=1
export MOZ_ADDON_SIGNING=1
export MOZ_APP_REMOTINGNAME=${pkgname//-/}

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-libvpx
ac_add_options --with-system-webp
ac_add_options --with-system-libevent
ac_add_options --with-system-icu
ac_add_options --with-system-zlib
ac_add_options --with-system-jpeg

ac_add_options --enable-optimize=-O3
# Features
ac_add_options --enable-pulseaudio
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --disable-warnings-as-errors
ac_add_options --disable-crashreporter
ac_add_options --disable-tests
ac_add_options --disable-debug
ac_add_options --disable-updater
ac_add_options --enable-strip
ac_add_options --disable-gpsd
ac_add_options --disable-synth-speechd
ac_add_options --disable-debug-symbols
ac_add_options --disable-debug-js-modules
ac_add_options --disable-rust-tests
ac_add_options --disable-necko-wifi
ac_add_options --disable-webspeech
ac_add_options --disable-webspeechtestbackend

# Disables crash reporting, telemetry and other data gathering tools
mk_add_options MOZ_CRASHREPORTER=0
mk_add_options MOZ_DATA_REPORTING=0
mk_add_options MOZ_SERVICES_HEALTHREPORT=0
mk_add_options MOZ_TELEMETRY_REPORTING=0

END

    # Gentoo patches
    msg2 "---- Gentoo patches"

    for gentoo_patch in "${_patches_dir}/gentoo/"*; do
        local _patch_name="`basename "${gentoo_patch}"`"

        if [ ${_patch_name} != "0032-bmo-1773259-cbindgen-root_clip_chain-fix.patch" ]; then
            msg2 "Patching with ${_patch_name}.."
            patch -Np1 -i "${gentoo_patch}"
        fi
    done

    msg2 "---- Librewolf patches"
    msg2 "Remove some pre-installed addons that might be questionable"
    patch -Np1 -i ${_patches_dir}/librewolf/remove_addons.patch

    msg2  "Disabling Pocket"
    patch -Np1 -i ${_patches_dir}/sed-patches/disable-pocket.patch

    msg2 "remove mozilla vpn ads"
    patch -Np1 -i ${_patches_dir}/mozilla-vpn-ad2.patch

    msg2  "allow SearchEngines option in non-ESR builds"
    patch -Np1 -i ${_patches_dir}/sed-patches/allow-searchengines-non-esr.patch

    msg2 "Assorted patches"
    patch -Np1 -i ${_patches_dir}/librewolf/context-menu.patch
    patch -Np1 -i ${_patches_dir}/librewolf/urlbarprovider-interventions.patch
    patch -Np1 -i ${_patches_dir}/librewolf/native-messaging-registry-path.patch

    msg2 "fix an URL in 'about' dialog"
    patch -Np1 -i ${_patches_dir}/about-dialog.patch

    msg2 "change some hardcoded directory strings that could lead to unnecessarily created directories"
    patch -Np1 -i ${_patches_dir}/librewolf/mozilla_dirs.patch

    msg2 "allow uBlockOrigin to run in private mode by default, without user intervention."
    patch -Np1 -i ${_patches_dir}/librewolf/allow-ubo-private-mode.patch

    msg2 "add custom uBO assets (on first launch only)"
    patch -Np1 -i ${_patches_dir}/librewolf/custom-ubo-assets-bootstrap-location.patch

    patch -Np1 -i ${_patches_dir}/librewolf/faster-package-multi-locale.patch

    msg2 "remove references to firefox from the settings UI, change text in some of the links"
    patch -Np1 -i ${_patches_dir}/librewolf-ui/pref-naming.patch
    patch -Np1 -i ${_patches_dir}/librewolf-ui/hide-default-browser.patch
    patch -Np1 -i ${_patches_dir}/librewolf-ui/privacy-preferences.patch

    msg2 "remove firefox references in the urlbar, when suggesting opened tabs."
    patch -Np1 -i ${_patches_dir}/librewolf-ui/remove-branding-urlbar.patch

    msg2 "remove cfr UI elements, as they are disabled and locked already."
    patch -Np1 -i ${_patches_dir}/librewolf-ui/remove-cfrprefs.patch

    msg2 "do not display your browser is being managed by your organization in the settings."
    patch -Np1 -i ${_patches_dir}/librewolf-ui/remove-organization-policy-banner.patch

    msg2 "hide \"snippets\" section from the home page settings, as it was already locked."
    patch -Np1 -i ${_patches_dir}/librewolf-ui/remove-snippets-from-home.patch

    msg2 "add warning that sanitizing exceptions are bypassed by the options in History > Clear History when LibreWolf closes > Settings"
    patch -Np1 -i ${_patches_dir}/librewolf-ui/sanitizing-description.patch

    msg2 "website-appearance-ui-rfp.patch"
    patch -Np1 -i ${_patches_dir}/librewolf-ui/website-appearance-ui-rfp.patch

    msg2 "lw-logo-devtools.patch"
    patch -Np1 -i ${_patches_dir}/librewolf-ui/lw-logo-devtools-cachy.patch

    patch -Np1 -i ${_patches_dir}/librewolf-ui/handlers.patch
    msg2 "Firefox View"
    patch -Np1 -i ${_patches_dir}/librewolf-ui/firefox-view.patch
    msg2 "change bus/dbus/remoting names to org.cachyos"
    patch -Np1 -i ${_patches_dir}/librewolf/dbus_name.patch

    msg2 "customized pref panel"
    patch -Np1 -i ${_patches_dir}/librewolf/librewolf-pref-pane.patch
    msg2 "fix telemetry removal, see https://gitlab.com/librewolf-community/browser/linux/-/merge_requests/17, for example"
    patch -Np1 -i ${_patches_dir}/librewolf/disable-data-reporting-at-compile-time.patch

    msg2 "Patch Devtools to bypass devtool detection"
    patch -Np1 -i ${_patches_dir}/devtools-bypass.patch

    msg2 "KDE menu and unity menubar"
    patch -Np1 -i ${_patches_dir}/unity_kde/mozilla-kde.patch
    patch -Np1 -i ${_patches_dir}/unity_kde/firefox-kde.patch
    patch -Np1 -i ${_patches_dir}/unity_kde/unity-menubar.patch
    msg2 "mozilla-nongnome-proxies"
    patch -Np1 -i ${_patches_dir}/kde/mozilla-nongnome-proxies.patch
    msg2  "some undesired requests (https://gitlab.com/librewolf-community/browser/common/-/issues/10)"
    patch -Np1 -i ${_patches_dir}/sed-patches/stop-undesired-requests.patch

    # msg2 "Match to system libs"
    # patch -Np1 -i ../match.patch

    rm -f ${srcdir}/cachyos-browser-common/source_files/mozconfig
    cp -r ${srcdir}/cachyos-browser-common/source_files/browser ./
}


build() {
    cd firefox-$pkgver

    export MOZ_NOSPAM=1
    export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
    export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=system
    export PIP_NETWORK_INSTALL_RESTRICTED_VIRTUALENVS=mach

    # LTO needs more open files
    ulimit -n 4096

    # Do 3-tier PGO
    echo "Building instrumented browser..."

    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate
END

    ./mach build

    echo "Profiling instrumented browser..."
    ./mach package
    LLVM_PROFDATA=llvm-profdata \
        JARLOG_FILE="$PWD/jarlog" \
        xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
        ./mach python build/pgo/profileserver.py

    stat -c "Profile data found (%s bytes)" merged.profdata
    test -s merged.profdata

    stat -c "Jar log found (%s bytes)" jarlog
    test -s jarlog

    echo "Removing instrumented browser..."
    ./mach clobber

    echo "Building optimized browser..."

    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto
ac_add_options --enable-profile-use
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END

    ./mach build

    echo "Building symbol archive..."
    ./mach buildsymbols
}

package() {
    cd firefox-$pkgver
    DESTDIR="$pkgdir" ./mach install
    rm "$pkgdir"/usr/lib/${pkgname}/pingsender

    local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"

    install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Don't disable extensions in the application directory
// done in cachy.cfg
// pref("extensions.autoDisableScopes", 11);
END

    # cd ${srcdir}/settings
    # git checkout ${_settings_commit}
    cd ${srcdir}/firefox-$pkgver
    cp -r ${srcdir}/cachyos-browser-settings/* ${pkgdir}/usr/lib/${pkgname}/

    local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
    install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=cachyos.org
version=1.0
about=Cachy Browser for CachyOS

[Preferences]
app.distributor=cachyos
app.distributor.channel=$pkgname
app.partner.cachyos=cachyos
END

    for i in 16 32 48 64 128; do
        install -Dvm644 browser/branding/${__pkgname}/default$i.png \
            "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
    done
    install -Dvm644 browser/branding/${__pkgname}/content/about-logo.png \
        "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"

    # arch upstream provides a separate svg for this. we don't have that, so let's re-use 16.png
    install -Dvm644 browser/branding/${__pkgname}/default16.png \
        "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.png"

    install -Dvm644 ../$pkgname.desktop \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install a wrapper to avoid confusion about binary path
    install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/cachy-browser "\$@"
END

    # Replace duplicate binary with wrapper
    # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
    ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/cachy-browser-bin"
    # Use system certificates
    local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
    if [[ -e $nssckbi ]]; then
        ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
    fi
}
