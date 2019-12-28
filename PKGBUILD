# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Based on basilisk browser PKGBUILD

pkgname=serpent-browser
pkgver=2019.10.31
pkgrel=1
pkgdesc="Unbranded version of Basilisk web browser"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.basilisk-browser.org/"
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib ffmpeg
         libvpx libevent nss hunspell sqlite ttf-font icu)
makedepends=(unzip zip diffutils python2 yasm mesa imake gconf libpulse inetutils xorg-server-xvfb
             autoconf2.13 rust)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'speech-dispatcher: Text-to-Speech')
options=(!emptydirs !makeflags)
source=(https://github.com/MoonchildProductions/UXP/archive/v$pkgver.tar.gz
        serpent-browser.desktop)
sha256sums=('c9da24fb6daa5e8583dfbf39011d2acc0ba298831f231e41fe02b3905a259302'
            'f6c1f975ac3700adbb5e5ef6e0a2adc2fb9c4063a858f0d39765a2af9ccf996c')

prepare() {
  cd "$srcdir/UXP-$pkgver"

  cat >.mozconfig <<END
mk_add_options AUTOCLOBBER=1
ac_add_options --enable-application=basilisk
mk_add_options PYTHON=/usr/bin/python2
mk_add_options AUTOCONF=/usr/bin/autoconf-2.13
 
# Please see https://www.palemoon.org/redist.shtml for restrictions when using the official branding.
# Build options taken from official Basilisk binary from its about:buildconfig
 
ac_add_options --enable-default-toolkit=cairo-gtk3
ac_add_options --enable-jemalloc
ac_add_options --enable-strip
ac_add_options --with-pthreads
ac_add_options --enable-update-channel=release
ac_add_options --enable-av1
ac_add_options --enable-eme=widevine
ac_add_options --enable-official-vendor
ac_add_options --enable-optimize="-O2 -msse2 -mfpmath=sse"

ac_add_options --disable-debug-symbols 
ac_add_options --disable-tests
ac_add_options --prefix=/usr

mk_add_options MOZ_MAKE_FLAGS="-j$(nproc)"

END
}

build() {
  cd $srcdir/UXP-$pkgver
  ./mach build
}

package() {
  cd "$srcdir/UXP-$pkgver"
  DESTDIR="$pkgdir" ./mach install

  for i in 16 32 48; do
    install -Dm644 application/basilisk/branding/unofficial/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/basilisk.png"
  done
  install -Dm644 application/basilisk/branding/unofficial/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/basilisk.png"
  install -Dm644 application/basilisk/branding/unofficial/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/basilisk.png"
  install -Dm644 application/basilisk/branding/unofficial/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/basilisk.png"
  install -Dm644 application/basilisk/branding/unofficial/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/basilisk.png"
   install -Dm644 ../serpent-browser.desktop \
    "$pkgdir/usr/share/applications/serpent-browser.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/local/lib/basilisk/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/basilisk-52.9.0/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/basilisk-52.9.0/hyphenation"

  # Replace duplicate binary with symlink
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
msg2 'all the weird stuff about duplicates needs to be corrected'
  ln -srf "$pkgdir/usr/bin/basilisk" \
    "$pkgdir/usr/lib/basilisk-52.9.0/basilisk-bin"

}
