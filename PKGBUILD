# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=fltk-editor
_pkgname=fltk
pkgver=1.4.4
pkgrel=1
pkgdesc="Simple text editor application for FLTK"
arch=('i686' 'x86_64')
url="http://www.fltk.org/"
license=('LGPL')
depends=('fltk')
makedepends=('gendesk')
source=(https://github.com/fltk/fltk/releases/download/release-$pkgver/fltk-$pkgver-source.tar.gz)
md5sums=('83c567727e61c779f6681b0298226d05')

prepare() {
  cd $_pkgname-$pkgver
  sed -i -e 's/$(LINKFLTK)/$(LINKSHARED)/' \
         -e 's/$(LINKFLTKIMG)/$(LINKSHARED)/' test/Makefile
  gendesk -n -f --pkgname="fltk-editor" --pkgdesc="Simple text editor" --name "FLTK Editor" --exec="fltk-editor %f" --mimetypes="text/plain" --icon="accessories-text-editor" --categories="Utility;TextEditor"
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --enable-threads --enable-xft --enable-shared
  make
}

package() {
  cd $_pkgname-$pkgver
  install -Dm755 test/editor "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
