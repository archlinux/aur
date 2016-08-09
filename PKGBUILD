# Maintainer: Xavier <sapphirus@azorium.net>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>
# Contributor: Xavier <sapphirus@azorium.net>
# Upstream URL: https://www.mozilla.org/firefox/

pkgname=firefox-unbranded
_pkgname=firefox
pkgver=48.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - Unbranded version (build from source)"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
provides=('firefox=48')
conflicts=('firefox')
depends=('gtk3' 'gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'ffmpeg' 'libvpx' 'libevent' 'nss' 'hunspell'
         'sqlite' 'ttf-font' 'icu')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake' 'gconf'
             'libpulse' 'inetutils' 'xorg-server-xvfb' 'autoconf2.13' 'rust')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'upower: Battery API')
options=('!emptydirs' '!makeflags')
source=(https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz
        mozconfig
        firefox.desktop
        firefox-install-dir.patch
        vendor.js
        firefox-symbolic.svg
        firefox-gtk3-20.patch
        no-libnotify.patch)
sha256sums=('f474113a1ee75a01d43e270bf438ba78b9f7f2e397a66652b43603235fa76e21'
	    '84efbf7d1495fd0c89f684d618abfe1eb190ee336c13aee51e9ab706c910127f'
            '9f39e9d891a48b49490df0823d67f01d8cf0b3e8c5910190739e94190f768e76'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
            '4b50e9aec03432e21b44d18c4c97b2630bace606b033f7d556c9d3e3eb0f4fa4'
            'a2474b32b9b2d7e0fb53a4c89715507ad1c194bef77713d798fa39d507def9e9'
            'c984c8bda3c173349d98f3fa71ec8ff8e8b74e6ca20a3f39f33596dbb4c4d1e8'
            'e4ebdd14096d177d264a7993dbd5df46463605ff45f783732c26d30b9caa53a7')
validpgpkeys=('2B90598A745E992F315E22C58AB132963A06537A')

prepare() {
  cd $_pkgname-$pkgver

  cp ../mozconfig .mozconfig
  patch -Np1 -i ../firefox-install-dir.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1234158
  patch -Np1 -i ../firefox-gtk3-20.patch

  # Notifications with libnotify are broken
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1236150
  patch -Np1 -i ../no-libnotify.patch

  mkdir "$srcdir/path"
  ln -s /usr/bin/python2 "$srcdir/path/python"
}

build() {
  cd $_pkgname-$pkgver

  # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  # GCC 6
  CXXFLAGS+=" -fno-delete-null-pointer-checks -fno-lifetime-dse -fno-schedule-insns2"

  export PATH="$srcdir/path:$PATH"

  # Do PGO
  #xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" \
  #  make -f client.mk build MOZ_PGO=1
  make -f client.mk build
}

package() {
  cd $_pkgname-$pkgver
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

  install -Dm644 ../vendor.js "$pkgdir/usr/lib/firefox/browser/defaults/preferences/vendor.js"

  for i in 16 22 24 32 48 256; do
      install -Dm644 browser/branding/official/default$i.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done
  install -Dm644 browser/branding/official/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/firefox.png"
  install -Dm644 browser/branding/official/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/firefox.png"
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/firefox.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/firefox.png"
  install -Dm644 ../firefox-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/firefox-symbolic.svg"

  install -Dm644 ../firefox-unbranded.desktop \
    "$pkgdir/usr/share/applications/firefox-unbranded.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/firefox/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/firefox/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/firefox/hyphenation"

  #Symbolic links
  rm -rf "$pkgdir"/usr/bin/firefox/
  ln -s "$pkgdir/usr/lib/firefox/firefox-bin" firefox
  ln -s "$pkgdir/usr/lib/firefox/firefox-bin" firefox-unbranded

}
