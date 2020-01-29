pkgname=basilisk
pkgver=2020.01.12
pkgrel=1
pkgdesc="Standalone web browser forked from mozilla.org, UXP version"
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.basilisk-browser.org"
depends=('gtk2' 'libxt' 'mime-types' 'alsa-lib' 'ffmpeg' 'ttf-font')
makedepends=('unzip' 'zip' 'python2' 'yasm' 'mesa' 'autoconf2.13')
options=('!emptydirs')
source=("https://github.com/MoonchildProductions/UXP/archive/v$pkgver.tar.gz")
sha256sums=('6133ea81ee929202b793b11d70403a2e3e5c25c8908915f6d689ce9467f9659d')

prepare() {
  cd "$srcdir/UXP-$pkgver"

  cat > .mozconfig << EOF
ac_add_options --enable-application=browser
ac_add_options --enable-release
ac_add_options --enable-official-branding
ac_add_options --enable-private-build
export MOZILLA_OFFICIAL=1
export MOZ_DATA_REPORTING=0
export MOZ_TELEMETRY_REPORTING=0
export MOZ_SERVICES_HEALTHREPORT=0

ac_add_options --disable-updater
ac_add_options --disable-maintenance-service
ac_add_options --disable-stylo
ac_add_options --disable-servo
ac_add_options --disable-webextensions

ac_add_options --prefix=/usr
ac_add_options --enable-strip
ac_add_options --enable-install-strip
ac_add_options --enable-gold
ac_add_options --enable-pie
ac_add_options --enable-jemalloc
ac_add_options --enable-replace-malloc
ac_add_options --with-pthreads
ac_add_options --enable-optimize="-O2 -msse -msse2 -msse3 -mmmx -mfpmath=sse"

ac_add_options --enable-default-toolkit=cairo-gtk2

ac_add_options --enable-alsa
ac_add_options --disable-pulseaudio
ac_add_options --disable-jack

ac_add_options --disable-dbus
ac_add_options --disable-gconf
ac_add_options --disable-gio
ac_add_options --disable-necko-wifi
ac_add_options --disable-startup-notification

ac_add_options --enable-devtools

ac_add_options --disable-debug
ac_add_options --disable-debug-symbols
ac_add_options --disable-tests

ac_add_options --disable-eme
ac_add_options --disable-crashreporter
ac_add_options --disable-parental-controls
ac_add_options --disable-accessibility
ac_add_options --disable-safe-browsing
ac_add_options --disable-sync
ac_add_options --disable-webspeech
ac_add_options --disable-webspeechtestbackend
ac_add_options --disable-synth-speechd
ac_add_options --disable-synth-pico
ac_add_options --disable-webrtc
ac_add_options --disable-gamepad
ac_add_options --disable-b2g-camera
ac_add_options --disable-b2g-ril
ac_add_options --disable-b2g-bt
ac_add_options --disable-mozril-geoloc
ac_add_options --disable-nfc
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

  # Install icons and .desktop for menu entry
  local _i
  for _i in 16 22 24 32 64 48 256; do
    install -Dm644 "application/basilisk/branding/official/default${_i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/basilisk.png"
  done
  # The 128x128, 192x192, and 384x384 icons have different names
  install -Dm644 application/basilisk/branding/official/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/basilisk.png"
  install -Dm644 application/basilisk/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/basilisk.png"
  install -Dm644 application/basilisk/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/basilisk.png"

  install -Dm644 "application/palemoon/branding/official/palemoon.desktop" \
    "$pkgdir/usr/share/applications/basilisk.desktop"
  sed -i -e "s:Pale Moon:Basilisk:" -e "s:palemoon:basilisk:" \
    -e "s@https://start.palemoon.org@about:newtab@" \
    "$pkgdir/usr/share/applications/basilisk.desktop"

  # Replace duplicate binary with symlink
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  local _mozhome="$pkgdir/usr/lib/basilisk-$(< application/basilisk/config/version.txt)"
  ln -sf basilisk "$_mozhome/basilisk-bin"
}
