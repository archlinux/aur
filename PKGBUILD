# Maintainer: Vladislav Nepogodin (vnepogodin) <vnepogodin@cachyos.org>
# Contributor: lsf
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=cachy-browser
_pkgname=Cachy
__pkgname=cachy
pkgver=137.0.2
pkgrel=2
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
  libpulse
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
)
makedepends=(
  cbindgen
  clang
  diffutils
  imake
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
_settings_commit=e211177f342eae879f52baa7604370c6b51d771b
_common_commit=c10c6ba3b32e5bf901541b2b8d69ae7b1fc0c891
source=(
  "https://archive.mozilla.org/pub/firefox/releases/${pkgver}/source/firefox-${pkgver}.source.tar.xz"
  "https://archive.mozilla.org/pub/firefox/releases/${pkgver}/source/firefox-${pkgver}.source.tar.xz.asc"
  "$pkgname.desktop"
  "git+https://github.com/cachyos/cachyos-browser-settings.git#commit=${_settings_commit}"
  "git+https://github.com/cachyos/cachyos-browser-common.git#commit=${_common_commit}"
  "match.patch"
)
sha256sums=('06fc3abaa822148bfa5ee7b759428d74052493876c053c05379c3f6c302bcd07'
            'SKIP'
            'de5c0deb9b6a4ebfaa933103cc6a65f1f43c9a456296d356cc54c7ca042d144c'
            '4c69b1cf1185ebae0860804179ec5a131bf5f009444054c5ef11832d379e60cf'
            '9c9a63b606a5f6928a63f74bdfb75c4901e54ab5ff24d26d36e801e5499f9107'
            '1fbb1971a1d0d4c875b1af0f9681601909cfbe4fe0cc2c2f42c523c84c934499')

validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla Software Releases <release@mozilla.com>

prepare() {
  mkdir mozbuild
  cd firefox-$pkgver


    local _cachycommon_dir="${srcdir}/cachyos-browser-common"
    local _cachysettings_dir="${srcdir}/cachyos-browser-settings"
    local _patches_dir="${srcdir}/cachyos-browser-common/patches"

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-wasm-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-install-strip
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

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
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

ac_add_options --enable-optimize=-O3
ac_add_options OPT_LEVEL="3"
ac_add_options RUSTC_OPT_LEVEL="3"
# Features
ac_add_options --enable-jxl
ac_add_options --enable-av1
ac_add_options --enable-pulseaudio
ac_add_options --enable-alsa
# ac_add_options --enable-jack
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
# Enable replace malloc for hardened malloc usecase
ac_add_options --enable-replace-malloc

# Disable telemetry and data reporting
mk_add_options MOZ_CRASHREPORTER=0
mk_add_options MOZ_DATA_REPORTING=0
mk_add_options MOZ_SERVICES_HEALTHREPORT=0
mk_add_options MOZ_TELEMETRY_REPORTING=0

END

    # Apply patches
    msg2 "=+=+=+=+= Applying patches =+=+=+=+="
    ${_cachycommon_dir}/apply-patches.py "${srcdir}/firefox-$pkgver" ${_cachycommon_dir} ${_cachysettings_dir}

    sed -i 's/releases\/mozilla-release",/mozilla-central",\n        "integration\/autoland",/' python/mozbuild/mozbuild/artifacts.py

    rm -f ${srcdir}/cachyos-browser-common/source_files/mozconfig
}

build() {
    cd firefox-$pkgver

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

    # malloc_usable_size is used in various parts of the codebase
    CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
    CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

    # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
    CFLAGS="${CFLAGS/-fexceptions/}"
    CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # Increase open files limit for LTO
  ulimit -n 4096

  # Build instrumented browser for PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  ./mach build --priority normal

  echo "Profiling instrumented browser..."
  ./mach package
  LLVM_PROFDATA=llvm-profdata JARLOG_FILE="$PWD/jarlog" \
    dbus-run-session \
    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
    ./mach python build/pgo/profileserver.py

  # Verify profiling data
  stat -c "Profile data found (%s bytes)" merged.profdata
  test -s merged.profdata

  stat -c "Jar log found (%s bytes)" jarlog
  test -s jarlog

  # Clean instrumented build
  echo "Removing instrumented browser..."
  ./mach clobber objdir

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build --priority normal
}

package() {
    cd firefox-$pkgver
    DESTDIR="$pkgdir" ./mach install
    rm "$pkgdir"/usr/lib/${pkgname}/pingsender

  local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

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

  local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/$pkgname.search-provider.ini"
  install -Dvm644 /dev/stdin "$sprovider" <<END
[Shell Search Provider]
DesktopId=$pkgname.desktop
BusName=org.mozilla.${pkgname//-/_}.SearchProvider
ObjectPath=/org/mozilla/${pkgname//-/_}/SearchProvider
Version=2
END
}
