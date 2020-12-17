# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-g3-kpe
pkgver=0.2
pkgrel=0
pkgdesc="Customizable privacy conscious web browser with better integration with KDE and primary support for webextensions"
arch=('x86_64')
license=('MPL')
url="https://www.waterfox.net/"
depends=('gtk3' 'gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'nss' 'nspr' 'ttf-font' 'hicolor-icon-theme' 'glibc' 'kwaterfoxhelper')
makedepends=('unzip' 'zip' 'diffutils' 'python' 'yasm' 'mesa' 'imake' 'inetutils' 'xorg-server-xvfb'
             'autoconf2.13' 'rust' 'clang' 'llvm' 'libpulse' 'alsa-lib' 'jack' 'cbindgen' 'nasm' 'python-setuptools'
             'nodejs' 'python-psutil' 'binutils' 'git')
options=('!emptydirs' '!makeflags' 'zipman')
_filesrev=08445afa27c6aa0d4d8356b3808a0d25df0be834
_filesurl=https://raw.githubusercontent.com/hawkeye116477/waterfox-deb-rpm-arch-AppImage/$_filesrev/waterfox-g3-kpe
_commit=11befa20d8c009ee5eaeb44bb3b586de9390bfcd
#"git+https://github.com/MrAlex94/Waterfox.git#commit=$_commit"
source=("git+https://github.com/MrAlex94/Waterfox.git#tag=G3.$pkgver"
        "$_filesurl/waterfox-g3.desktop"
        "$_filesurl/distribution.ini"
        "$_filesurl/vendor.js"
        "$_filesurl/waterfox-g3.1"
        "$_filesurl/syspref.js"
        "$_filesurl/patches/g3-kde.patch"
        "$_filesurl/patches/mozilla-nongnome-proxies.patch"
        "$_filesurl/patches/mozilla-ntlm-full-path.patch"
        "$_filesurl/patches/Use-remoting-name-for-GDK-application-names.patch"
        "$_filesurl/patches/sandbox-fips.patch"
        "$_filesurl/patches/rust_1.48.patch"
        "$_filesurl/patches/remoting-name.patch"
        )
sha256sums=('SKIP'
            '2677c0b45a2238efa01578475118a2f2abf19454231d0fa68bb83c818db1c3d8'
            'bf06887c00bbc7176f452a3d18092e1b222731218e461782b2877cba938aaa26'
            'b9458af82a1e67497f1a42b69cb69b7a86a87727c35004a4089d207d10c7c2b4'
            'e48f932041ac826be48567d090a246bd897744262acca4dc07915abdc9a3e6b9'
            '0120e01edb0bf3d42f4e0280345f2c44372b097739cd2ddb85fa69bb2233ebab'
            '929865788394227c8202bd705b7171e8da3aedbcab1fa18d3d563811735a0ba3'
            'd8c2c30217b5bc9fbef8f6ca7540a4d8fdacc128c1c0a62226c8f4c287688597'
            '25846888b48208606ff88c04dc8b9cb5b1a9c433adfd2d72ce13b6b9edc73a87'
            '71386c2e269bd021c3b8c86b457101bdb730f76db3f2bbb91bf617109564a09c'
            '809c7dea066cb2ba70fb1c16c1b3dcd69c7e7715f354daf2f1c67af757e6d47b'
            '755e3e851ff550feaf279d8b3922a03c8d7e1ec78484eec1495b07fc243a3107'
            'ac5199b397d1fef75d952eedbedcf3806b12f86b64ea29e5b34b541b0cfbe761')

prepare() {

  cd Waterfox

  # Add patches
  patch -Np1 -i ../g3-kde.patch
  patch -Np1 -i ../mozilla-nongnome-proxies.patch
  patch -Np1 -i ../mozilla-ntlm-full-path.patch
  patch -Np1 -i ../Use-remoting-name-for-GDK-application-names.patch
  patch -Np1 -i ../sandbox-fips.patch
  patch -Np1 -i ../rust_1.48.patch
  patch -Np1 -i ../remoting-name.patch

  cat >../mozconfig <<END
export CC=clang
export CXX=clang++
export AR=llvm-ar
export NM=llvm-nm
export RANLIB=llvm-ranlib
export LLVM_PROFDATA=llvm-profdata

ac_add_options --enable-optimize="-O2 -march=nocona -mtune=nocona -w"
ac_add_options --target=x86_64-pc-linux-gnu

ac_add_options --enable-alsa
ac_add_options --enable-pulseaudio
ac_add_options --enable-jack

#X=$(($(getconf _NPROCESSORS_ONLN 2>/dev/null || getconf NPROCESSORS_ONLN)*3/2))

#mk_add_options AUTOCLOBBER=1
#mk_add_options MOZ_MAKE_FLAGS=-j6

ac_add_options --prefix=/usr

ac_add_options --with-app-name=waterfox-g3
ac_add_options --with-app-basename=Waterfox
ac_add_options --with-branding=browser/branding/waterfox
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Disable unwanted features
ac_add_options --disable-crashreporter
ac_add_options --disable-debug
ac_add_options --disable-updater
ac_add_options --disable-verify-mar
ac_add_options --disable-profiling
ac_add_options --disable-dmd

# Enable wanted features
ac_add_options --enable-rust-simd
ac_add_options --enable-application=browser
ac_add_options --enable-hardening
ac_add_options --enable-linker=gold
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland
ac_add_options "MOZ_ALLOW_LEGACY_EXTENSIONS=1"
export MOZ_REQUIRE_SIGNING=0
export MOZ_INCLUDE_SOURCE_INFO=1
END
}

build() {
  cd Waterfox

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export LDFLAGS+=" -Wl,--no-keep-memory"

  # LTO needs more open files
  ulimit -n 4096

  # -fno-plt with cross-LTO causes obscure LLVM errors
  # LLVM ERROR: Function Import: link error
  CFLAGS="${CFLAGS/-fno-plt/}"
  CXXFLAGS="${CXXFLAGS/-fno-plt/}"

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  ./mach build

  echo "Profiling instrumented browser..."
  ./mach package
  LLVM_PROFDATA=llvm-profdata \
    JARLOG_FILE="$PWD/jarlog" \
    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
    ./mach python build/pgo/profileserver.py

  if [[ ! -s merged.profdata ]]; then
    echo "No profile data produced."
    return 1
  fi

  if [[ ! -s jarlog ]]; then
    echo "No jar log produced."
    return 1
  fi

  echo "Removing instrumented browser..."
  ./mach clobber

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build
}

package_waterfox-g3-kpe() {
  optdepends=('networkmanager: Location detection via available WiFi networks'
             'libnotify: Notification integration'
             'pulseaudio: Audio support'
             'alsa-lib: Audio support'
             'speech-dispatcher: Text-to-Speech'
             'hunspell-en_US: Spell checking, American English')
  provides=("waterfox-g3=${pkgver}")

  cd Waterfox

  DESTDIR="$pkgdir" ./mach install

  _spellcheck_js="$pkgdir/usr/lib/waterfox-g3/browser/defaults/preferences/spellcheck.js"
  install -Dm644 /dev/stdin "$_spellcheck_js" <<END
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END

  for i in 16 32 48 64 128; do
      install -d "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
      ln -Ts /usr/lib/waterfox-g3/browser/chrome/icons/default/default$i.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-g3.png"
  done
  install -Dm644 browser/branding/waterfox/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/waterfox-g3.png"
  install -Dm644 browser/branding/waterfox/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/waterfox-g3.png"

  install -Dm644 $srcdir/waterfox-g3.desktop \
    "$pkgdir/usr/share/applications/waterfox-g3.desktop"

  install -Dm644 $srcdir/waterfox-g3.1 \
    "$pkgdir/usr/share/man/man1/waterfox-g3.1"

  install -Dm644 $srcdir/distribution.ini \
    "$pkgdir/usr/lib/waterfox-g3/distribution/distribution.ini"


  install -Dm644 "$srcdir/vendor.js" "$pkgdir/usr/lib/waterfox-g3/browser/defaults/preferences/vendor.js"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/waterfox-g3" <<END
#!/bin/sh
exec /usr/lib/waterfox-g3/waterfox-g3 "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/waterfox-g3" \
    "$pkgdir/usr/lib/waterfox-g3/waterfox-g3-bin"

  # Add syspref.js for setting preferences for all users
  mkdir -p "$pkgdir/etc/waterfox-g3"
  cp "$srcdir/syspref.js" "$pkgdir/etc/waterfox-g3/"
  ln -Tsf /etc/waterfox-g3/syspref.js "$pkgdir/usr/lib/waterfox-g3/browser/defaults/preferences/syspref.js"
}

# vim: set ts=2 sw=2 et syn=sh ft=sh:
