# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Figue <ffigue@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>
pkgname=basilisk
pkgver=2020.03.11
pkgrel=1
pkgdesc="Standalone web browser forked from mozilla.org"
arch=('x86_64')
url="https://www.basilisk-browser.org"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'libxt' 'mime-types' 'alsa-lib' 'ffmpeg' 'ttf-font')
makedepends=('unzip' 'zip' 'python2' 'yasm' 'mesa' 'autoconf2.13')
options=('!emptydirs')
_commit=88da01c294175f81091e1499374415404e27a57a
source=("https://github.com/MoonchildProductions/Basilisk/archive/v$pkgver.tar.gz"
        "https://github.com/MoonchildProductions/UXP/archive/$_commit.tar.gz"
        "https://raw.githubusercontent.com/MoonchildProductions/Pale-Moon/27.9.4_Release/browser/branding/official/palemoon.desktop")
sha256sums=('76fa7a6cd9fef9660ceb6a61822be9bd7400f1bf52a3642de8d8b039b72a80c9'
            '95e8d8db7f091f42829e314f4e6d46010e93976430ba08f72ed45fe118a0f8b3'
            '99fc56d62ff18d473aecc4d686abc1ae75b29b36d11b6810d56e78c956389886')

prepare() {
  cd "$srcdir/Basilisk-$pkgver"

  mv -T "$srcdir/UXP-$_commit" platform
  ln -s basilisk browser

  cat > .mozconfig << EOF
# Uncomment build flags as needed

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
  cd "$srcdir/Basilisk-$pkgver"

  make -f client.mk build
}

package() {
  cd "$srcdir/Basilisk-$pkgver"

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

  install -Dm644 "$srcdir/palemoon.desktop" \
    "$pkgdir/usr/share/applications/basilisk.desktop"
  sed -i -e "s:Pale Moon:Basilisk:" -e "s:palemoon:basilisk:" \
    -e "s@https://start.palemoon.org@about:newtab@" \
    "$pkgdir/usr/share/applications/basilisk.desktop"

  # Replace duplicate binary with symlink
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  local _mozhome="$pkgdir/usr/lib/basilisk-$(< basilisk/config/version.txt)"
  ln -sf basilisk "$_mozhome/basilisk-bin"
}
