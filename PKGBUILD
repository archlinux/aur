pkgname=basilisk
pkgver=2019.03.27
pkgrel=1
pkgdesc="Standalone web browser forked from mozilla.org, UXP version"
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.basilisk-browser.org"
depends=('gtk2' 'libxt' 'mime-types' 'alsa-lib' 'ffmpeg' 'libvpx' 'libevent'
         'nspr' 'nss' 'hunspell' 'hyphen' 'sqlite' 'ttf-font' 'icu' 'libpng' 'libjpeg'
         'bzip2' 'zlib' 'libffi' 'cairo' 'pixman' 'sqlite')
makedepends=('unzip' 'zip' 'python2' 'yasm' 'mesa' 'gconf' 'autoconf2.13')
optdepends=('libnotify: Notification integration')
options=('!emptydirs')
source=("https://github.com/MoonchildProductions/UXP/archive/v$pkgver.tar.gz"
        "basilisk.desktop")
sha256sums=('d1d614fa5f3682ad6bd05f9a9ae2b9089de10df2bdd245528ed867d2fce563a4'
            '1fdc855349da4e3728b202f411ad1d1c3fdc01e616161603175ab1573df1e6a9')

prepare() {
  cat > "$srcdir/UXP-$pkgver/.mozconfig" << EOF
ac_add_options --enable-application=browser
ac_add_options --enable-official-branding
ac_add_options --enable-release
ac_add_options --enable-private-build
export MOZILLA_OFFICIAL=1
export MOZ_DATA_REPORTING=0
export MOZ_TELEMETRY_REPORTING=0
export MOZ_CRASHREPORTER=0
export MOZ_SERVICES_HEALTHREPORT=0
export MOZ_ADDON_SIGNING=1
export MOZ_REQUIRE_SIGNING=0

ac_add_options --prefix=/usr
ac_add_options --enable-gold
ac_add_options --enable-pie
ac_add_options --enable-strip
ac_add_options --enable-jemalloc
ac_add_options --enable-optimize="-O2 -msse -msse2 -msse3 -mmmx -mfpmath=sse"
ac_add_options --with-pthreads

ac_add_options --enable-default-toolkit=cairo-gtk2
ac_add_options --enable-alsa

ac_add_options --disable-pulseaudio
ac_add_options --disable-dbus
ac_add_options --disable-startup-notification

ac_add_options --with-system-ffi
ac_add_options --with-system-bz2
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-png
ac_add_options --with-system-zlib
ac_add_options --enable-system-ffi
ac_add_options --enable-system-hunspell
ac_add_options --enable-system-cairo
ac_add_options --enable-system-sqlite
ac_add_options --enable-system-pixman

ac_add_options --enable-devtools

ac_add_options --disable-updater
ac_add_options --disable-crashreporter
ac_add_options --disable-debug
ac_add_options --disable-debug-symbols

ac_add_options --disable-tests
ac_add_options --disable-maintenance-service
ac_add_options --disable-eme
ac_add_options --disable-parental-controls
ac_add_options --disable-accessibility
ac_add_options --disable-safe-browsing
ac_add_options --disable-webspeech
ac_add_options --disable-webspeechtestbackend
ac_add_options --disable-synth-speechd
ac_add_options --disable-webrtc
ac_add_options --disable-gamepad
ac_add_options --disable-necko-wifi
ac_add_options --disable-stylo
ac_add_options --disable-b2g-camera
ac_add_options --disable-b2g-ril
ac_add_options --disable-b2g-bt
ac_add_options --disable-mozril-geoloc
ac_add_options --disable-nfc
ac_add_options --disable-synth-pico
ac_add_options --disable-url-classifier
ac_add_options --disable-userinfo

mk_add_options MOZ_MAKE_FLAGS="-j4"
mk_add_options PYTHON=/usr/bin/python2
EOF
}

build() {
  cd "$srcdir/UXP-$pkgver"

  ./mach build
}

package() {
  cd "$srcdir/UXP-$pkgver"

  DESTDIR="$pkgdir" ./mach install

  local i
  for i in 16 22 24 32 64 48 256; do
    install -Dm644 "application/basilisk/branding/official/default${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/basilisk.png"
  done
  install -Dm644 application/basilisk/branding/official/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/basilisk.png"
  install -Dm644 application/basilisk/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/basilisk.png"
  install -Dm644 application/basilisk/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/basilisk.png"
  install -Dm644 "$srcdir/basilisk.desktop" \
    "$pkgdir/usr/share/applications/basilisk.desktop"

  local _ver="$(< application/basilisk/config/version.txt)"
  rm -rf "$pkgdir/usr/lib/basilisk-$_ver/"{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/basilisk-$_ver/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/basilisk-$_ver/hyphenation"

  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf basilisk "$pkgdir/usr/lib/basilisk-$_ver/basilisk-bin"
}
