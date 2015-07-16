# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=piedock
pkgver=1.6.3
pkgrel=2
pkgdesc="A task bar and application launcher in shape of a circular pie menu."
arch=(i686 x86_64)
url="http://www.markusfisch.de/"
license=('custom:MIT')
depends=('libxft' 'libxmu')
optdepends=('gnome-icon-theme: default icons')
install="$pkgname.install"
source=("${url}downloads/$pkgname-$pkgver.tar.bz2"
        "$pkgname.desktop"
        "$pkgname-libpng16.patch")
sha256sums=('252e58bb36122e09aafbd9297b2d17054e60d548d21fb548e53317ca03180be9'
         '3b1b6e248eecf4591eb0502e914a79e2449e405655fe1f54c8f593b1b6cbcfe4'
         '9e86635ba37a77d0e1e1814b3cd6dd86be7c30a4b1f1888f50688d0eafadc370')

prepare() {
  cd $pkgname-$pkgver
  # libpng 1.6 support
  patch -p0 < ../piedock-libpng16.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install

  # configuration file
  install -Dm644 res/${pkgname}rc.sample \
    "$pkgdir/usr/share/$pkgname/${pkgname}rc.sample"

  # additional icons
  cp -a res/window-control \
    "$pkgdir/usr/share/$pkgname"

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
