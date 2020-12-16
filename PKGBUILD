# Contributor: neeshy <neeshy@tfwno.gf>
# Contributor: Figue <ffigue@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>
pkgname=basilisk
pkgver=2020.11.25
pkgrel=1
pkgdesc="Standalone web browser forked from mozilla.org"
arch=('x86_64')
url="https://www.basilisk-browser.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'libxt' 'mime-types' 'alsa-lib' 'ffmpeg' 'ttf-font')
makedepends=('unzip' 'zip' 'python2' 'yasm' 'mesa' 'autoconf2.13')
options=('!emptydirs')
_UXP=20201124
source=("https://repo.palemoon.org/MoonchildProductions/Basilisk/archive/v${pkgver}.tar.gz"
        "https://repo.palemoon.org/MoonchildProductions/UXP/archive/RELBASE_${_UXP}.tar.gz"
        "https://repo.palemoon.org/MoonchildProductions/Pale-Moon/raw/commit/7046794388319744751208a8d0e98e27861f67ce/palemoon/branding/unofficial/browser.desktop")
sha256sums=('3cf4891247f28ae6b4077046c40162a38d007e58c329db10e8e6e985b4d17a1f'
            '9dc2564672a7d4b8f7b49d8e68389545860b616e56b3c4371d98bee9c9360dfa'
            '9ffbaa46c277e3c9addc2ce61b17e8eccffd3860706ca75d4fd70eeaa6f5e380')

prepare() {
  cd "$srcdir/$pkgname"

  mv -T "$srcdir/uxp" platform
  ln -s basilisk browser

  cat > .mozconfig << EOF
# Comment/uncomment build flags as needed

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
#ac_add_options --disable-safe-browsing
#ac_add_options --disable-sync
#ac_add_options --disable-webspeech
#ac_add_options --disable-webspeechtestbackend
#ac_add_options --disable-synth-speechd
#ac_add_options --disable-synth-pico
ac_add_options --disable-webrtc
ac_add_options --disable-gamepad
#ac_add_options --disable-b2g-camera
#ac_add_options --disable-b2g-ril
#ac_add_options --disable-b2g-bt
#ac_add_options --disable-mozril-geoloc
#ac_add_options --disable-nfc
#ac_add_options --disable-url-classifier
#ac_add_options --disable-userinfo

mk_add_options MOZ_MAKE_FLAGS="-j4"
mk_add_options PYTHON=/usr/bin/python2
EOF
}

build() {
  cd "$srcdir/$pkgname"

  make -f client.mk build
}

package() {
  cd "$srcdir/$pkgname"

  make -f client.mk DESTDIR="$pkgdir" install

  # Install icons and .desktop for menu entry
  local _i
  for _i in 16 22 24 32 64 48 256; do
    install -Dm644 "basilisk/branding/official/default${_i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/basilisk.png"
  done
  # The 128x128, 192x192, and 384x384 icons have different names
  install -Dm644 basilisk/branding/official/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/basilisk.png"
  install -Dm644 basilisk/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/basilisk.png"
  install -Dm644 basilisk/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/basilisk.png"

  install -Dm644 "$srcdir/browser.desktop" \
    "$pkgdir/usr/share/applications/basilisk.desktop"
  sed -i -e "s:Web Browser:Basilisk:" -e "s:palemoon:basilisk:" \
    -e "s@https://start.palemoon.org@about:newtab@" \
    -e "s:Name=Browser:Name=Basilisk:" \
    "$pkgdir/usr/share/applications/basilisk.desktop"

  # Replace duplicate binary with symlink
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf basilisk "$pkgdir/usr/lib/basilisk-$(< basilisk/config/version.txt)/basilisk-bin"
}
