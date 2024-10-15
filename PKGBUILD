# Maintainer: Vladislav Nepogodin (vnepogodin) <vnepogodin@cachyos.org>
# Contributor: lsf
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=cachy-browser
_pkgname=Cachy
__pkgname=cachy
pkgver=131.0.3
pkgrel=1
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom."
arch=(x86_64)
license=(MPL-2.0)
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  icu
  libevent
  libjpeg
  libpulse
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libvpx
  libwebp
  libxss
  libxt
  mime-types
  nspr
  nss
  ttf-font
  pango
  zlib
)
makedepends=(
  cbindgen
  #clang
  diffutils
  imake
  jack
  #lld
  #llvm
  mesa
  nasm
  nodejs
  python
  rustup
  #rust
  unzip
  #wasi-compiler-rt
  #wasi-libc
  #wasi-libc++
  #wasi-libc++abi
  xorg-server-xvfb
  yasm
  zip
  pciutils
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
groups=('cachyos')
options=(
  !emptydirs
  !lto
  !makeflags
)
install=cachy-browser.install
# TODO(vnepogodin): enable back on next firefox release
#backup=('usr/lib/cachy-browser/distribution/policies.json')

_settings_commit=541156d4b673e18a565a76904ad1f3b726d1ccee
_common_commit=2db24aacab615d4515298e134584498a24d5ff34
source=(https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz{,.asc}
        $pkgname.desktop
        "git+https://github.com/cachyos/cachyos-browser-settings.git#commit=${_settings_commit}"
        "git+https://github.com/cachyos/cachyos-browser-common.git#commit=${_common_commit}"
        "match.patch")
sha256sums=('7a7df3f97737453efaa243ca9dbaf95d0f0f833c5dc8afacb5704ee16ef060d0'
            'SKIP'
            'de5c0deb9b6a4ebfaa933103cc6a65f1f43c9a456296d356cc54c7ca042d144c'
            'af74351c70fa0121600889598ec8d10aeab65bde1b8cd0c79fac7c54e2058ae3'
            '35f1614cb5b0662f2a011b38db3ce5ee30e106de544f84cff4fc50894c7a5abc'
            '1fbb1971a1d0d4c875b1af0f9681601909cfbe4fe0cc2c2f42c523c84c934499')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla Software Releases <release@mozilla.com>

prepare() {
  # we need it for bootstap build to be able to build with Firefox toolchain,
  # for some reason it doesn't bootstrap rust compiler
  if ! rustc --version | grep stable  >/dev/null 2>&1; then
    echo "Installing rust compiler…"
    rustup toolchain install stable
    rustup default stable
  fi

    mkdir -p mozbuild
    cd firefox-$pkgver

    local _cachycommon_dir="${srcdir}/cachyos-browser-common"
    local _cachysettings_dir="${srcdir}/cachyos-browser-settings"
    local _patches_dir="${srcdir}/cachyos-browser-common/patches"

    cat >.mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-wasm-simd
ac_add_options --enable-linker=lld
ac_add_options --enable-lto=full
#ac_add_options --enable-linker=gold
ac_add_options --disable-install-strip
ac_add_options --disable-elf-hack
ac_add_options --enable-bootstrap
#ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
#ac_add_options --with-wasm-sandboxed-libraries
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland
ac_add_options MOZ_PGO=1
ac_add_options MOZ_LTO=full
ac_add_options MOZ_USING_WASM_SANDBOXING=1

#export AR=llvm-ar
#export CC='clang'
#export CXX='clang++'
#export NM=llvm-nm
#export RANLIB=llvm-ranlib

# Branding
ac_add_options --enable-update-channel=release
ac_add_options --with-app-name=${pkgname}
#ac_add_options --with-app-basename=${_pkgname}
ac_add_options --with-branding=browser/branding/${__pkgname}
ac_add_options --with-distribution-id=cachyos.org
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZ_REQUIRE_SIGNING=1
export MOZ_ADDON_SIGNING=1
export MOZ_APP_REMOTINGNAME=$pkgname

# System libraries
#ac_add_options --with-system-nspr
#ac_add_options --with-system-nss
#ac_add_options --with-system-libvpx
#ac_add_options --with-system-webp
#ac_add_options --with-system-libevent
#ac_add_options --with-system-icu
#ac_add_options --with-system-zlib
#ac_add_options --with-system-jpeg

ac_add_options --enable-optimize=-O3
ac_add_options OPT_LEVEL="3"
ac_add_options RUSTC_OPT_LEVEL="3"
# Features
ac_add_options --enable-jxl
ac_add_options --enable-av1
ac_add_options --enable-pulseaudio
ac_add_options --enable-alsa
#ac_add_options --enable-jack
ac_add_options --enable-proxy-bypass-protection
ac_add_options --disable-warnings-as-errors
ac_add_options --disable-crashreporter
ac_add_options --disable-tests
ac_add_options --disable-debug
ac_add_options --disable-updater
ac_add_options --enable-strip
ac_add_options --disable-synth-speechd
ac_add_options --disable-debug-symbols
ac_add_options --disable-debug-js-modules
ac_add_options --disable-rust-tests
ac_add_options --disable-necko-wifi
ac_add_options --disable-webspeech
ac_add_options --disable-webspeechtestbackend
ac_add_options --disable-default-browser-agent

# Disables crash reporting, telemetry and other data gathering tools
mk_add_options MOZ_CRASHREPORTER=0
mk_add_options MOZ_DATA_REPORTING=0
mk_add_options MOZ_SERVICES_HEALTHREPORT=0
mk_add_options MOZ_TELEMETRY_REPORTING=0

END

    # Apply patches
    msg2 "=+=+=+=+= Applying patches =+=+=+=+="
    ${_cachycommon_dir}/apply-patches.py "${srcdir}/firefox-$pkgver" ${_cachycommon_dir} ${_cachysettings_dir}

    # Applying additional patches
    msg2 "=+=+=+=+= Applying additional patches =+=+=+=+="

    msg2 "fix an URL in 'about' dialog"
    patch -Np1 -i ${_patches_dir}/about-dialog.patch

    # we keep that until we actually create locale for Firefox to replace strings with "Cachy"
    msg2 "add warning that sanitizing exceptions are bypassed by the options in History > Clear History when Cachy closes > Settings"
    patch -Np1 -i ${_patches_dir}/sanitizing-description.patch

    #msg2 "KDE menu and unity menubar"
    #patch -Np1 -i ${_patches_dir}/unity_kde/mozilla-kde.patch
    #patch -Np1 -i ${_patches_dir}/unity_kde/firefox-kde.patch
    #patch -Np1 -i ${_patches_dir}/unity_kde/unity-menubar.patch

    msg2 "mozilla-nongnome-proxies"
    patch -Np1 -i ${_patches_dir}/kde/mozilla-nongnome-proxies.patch
    # msg2 "Match to system libs"
    # patch -Np1 -i ../match.patch

    sed -i 's/releases\/mozilla-release",/mozilla-central",\n        "integration\/autoland",/' python/mozbuild/mozbuild/artifacts.py

    rm -f ${srcdir}/cachyos-browser-common/source_files/mozconfig
}


build() {
    cd firefox-$pkgver

    export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
    export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
    export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
    export MOZ_NOSPAM=1

    export LIBGL_ALWAYS_SOFTWARE=true

    # malloc_usable_size is used in various parts of the codebase
    CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
    CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

    # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
    CFLAGS="${CFLAGS/-fexceptions/}"
    CXXFLAGS="${CXXFLAGS/-fexceptions/}"

    # LTO needs more open files
    ulimit -n 4096

    echo "Building browser..."

    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" ./mach build --priority normal
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
