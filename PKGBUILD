# Maintainer: Figue <ffigue@gmail.com>
# Contributor: neeshy <neeshy@tfwno.gf>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>
pkgname=basilisk
pkgver=2023.01.07
platform=RB_20221220
pkgrel=1
pkgdesc="A XUL-based web-browser demonstrating the Unified XUL Platform (UXP)"
arch=('x86_64')
url="https://www.basilisk-browser.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk3' 'gtk2' 'libxt' 'mime-types' 'alsa-lib' 'ffmpeg' 'ttf-font')
makedepends=('unzip' 'zip' 'python2' 'python2-dbus' 'yasm' 'mesa' 'autoconf2.13' 'gcc10')
options=('!emptydirs')
source=("https://repo.palemoon.org/Basilisk-Dev/Basilisk/archive/v${pkgver}.tar.gz"
        "https://repo.palemoon.org/MoonchildProductions/UXP/archive/${platform}.tar.gz"
        "https://repo.palemoon.org/mcp-graveyard/Pale-Moon/raw/commit/54aeb54828aba7ab47d6ec4a2ee432589efa2b4f/palemoon/branding/unofficial/browser.desktop")
sha256sums=('4bab798a1fa0a15a5368bcda61b203c122853fe6ac3bb33105fd2225287aebd3'
            'ce4a6281c087c4c22be297c390e2d577f677515fca082fd4e774fe660a0a89af'
            '9ffbaa46c277e3c9addc2ce61b17e8eccffd3860706ca75d4fd70eeaa6f5e380')

prepare() {
  cd "$srcdir/$pkgname"

  mv -T "$srcdir"/uxp platform/

  cat > .mozconfig << EOF
# Comment/uncomment build flags as needed

#ac_add_options --enable-release
#ac_add_options --enable-official-branding
#export MOZILLA_OFFICIAL=1
#export MOZ_DATA_REPORTING=0
#export MOZ_TELEMETRY_REPORTING=0
#export MOZ_SERVICES_HEALTHREPORT=0

ac_add_options --enable-application=basilisk
ac_add_options --enable-private-build
ac_add_options --prefix=/usr
ac_add_options --enable-strip
ac_add_options --enable-install-strip
ac_add_options --enable-gold
ac_add_options --enable-pie
ac_add_options --enable-jemalloc
#ac_add_options --enable-replace-malloc
ac_add_options --with-pthreads
ac_add_options --enable-optimize="-O2 -msse -msse2 -msse3 -mmmx -mfpmath=sse"
ac_add_options --enable-default-toolkit=cairo-gtk3

ac_add_options --enable-alsa
ac_add_options --enable-devtools
ac_add_options --enable-eme
ac_add_options --enable-webrtc
ac_add_options --enable-av1
ac_add_options --enable-gamepad

ac_add_options --disable-crashreporter
ac_add_options --disable-debug
ac_add_options --disable-debug-symbols
ac_add_options --disable-tests
ac_add_options --disable-dbus
ac_add_options --disable-gconf
ac_add_options --disable-gio
ac_add_options --disable-necko-wifi
ac_add_options --disable-startup-notification
ac_add_options --disable-updater
ac_add_options --disable-maintenance-service

#ac_add_options --disable-stylo
#ac_add_options --disable-servo
#ac_add_options --disable-webextensions
#ac_add_options --disable-parental-controls
#ac_add_options --disable-accessibility
#ac_add_options --disable-safe-browsing
#ac_add_options --disable-sync
#ac_add_options --disable-webspeech
#ac_add_options --disable-webspeechtestbackend
#ac_add_options --disable-synth-speechd
#ac_add_options --disable-synth-pico
#ac_add_options --disable-b2g-camera
#ac_add_options --disable-b2g-ril
#ac_add_options --disable-b2g-bt
#ac_add_options --disable-mozril-geoloc
#ac_add_options --disable-nfc
#ac_add_options --disable-url-classifier
#ac_add_options --disable-userinfo
#ac_add_options --disable-pulseaudio
#ac_add_options --disable-jack

#mk_add_options MOZ_MAKE_FLAGS="-j4"
#mk_add_options PYTHON=/usr/bin/python2
EOF
}

build() {
  cd "$srcdir/$pkgname"

  export CC=gcc-10
  ./mach build
}

package() {
  cd "$srcdir/$pkgname"

  export CC=gcc-10
  DESTDIR="$pkgdir" ./mach install

  # Install icons and .desktop for menu entry
  local _i
  for _i in 16 32 48; do
    install -Dm644 "basilisk/branding/unofficial/default${_i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/basilisk.png"
  done
  # The 128x128 icon have different name
  install -Dm644 basilisk/branding/unofficial/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/basilisk.png"

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
