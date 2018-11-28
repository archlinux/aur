# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qsopcast
pkgver=0.3.8.1
pkgrel=3
pkgdesc='Qt front-end for p2p TV sopcast'
arch=('x86_64')
url='https://code.google.com/archive/p/qsopcast/'
license=('GPL2')
depends=('qt4' 'sopcast')
makedepends=('gendesk' 'imagemagick')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/$pkgname/$pkgname-$pkgver-qt4.tar.bz2")
sha256sums=('59ebca822102e7c3af1d5a39368457a3bb659ceba74cdd9aa9034fb68a8af8fc')

prepare() {
  sed -i 's,/local,/,g' "$pkgname-$pkgver-qt4/src/"{qsopcast.pro,main.cpp}
  # set modify/create for reproducible builds
  convert +set date:create +set date:modify "$pkgname-$pkgver-qt4/src/icons/mozart.xpm" "$srcdir/qsopcast.png"
  gendesk -f -n --pkgname="$pkgname" --pkgdesc="$pkgdesc" --custom='GenericName=Online TV'
}

build() {
  cd "$pkgname-$pkgver-qt4/src"

  qmake-qt4
  make
}

package() {
  make -C "$pkgname-$pkgver-qt4/src" INSTALL_ROOT="$pkgdir" install

  install -Dm644 qsopcast.png "$pkgdir/usr/share/pixmaps/qsopcast.png"
  install -Dm644 qsopcast.desktop "$pkgdir/usr/share/applications/qsopcast.desktop"

  rm "$pkgdir/usr/bin/sp-sc"
}

# vim: ts=2 sw=2 et:
