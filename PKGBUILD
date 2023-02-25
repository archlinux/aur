# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=jigdo
pkgver=0.8.1
pkgrel=2
pkgdesc="Distribute large images by sending and receiving the files that make them up"
arch=('x86_64')
url="https://www.einval.com/~steve/software/jigdo/"
license=('GPL2')
depends=('db4.8' 'wget')
makedepends=('docbook-utils' 'docbook-sgml' 'perl-sgmls')
source=("${url}download/jigdo-${pkgver}.tar.xz")
b2sums=('6619017716066d1ccea4812fcfd980be670979c086a42005fd585e78c761f2db2e4ede461ecedae8d60d04a60a348ce214fd64975b1712307972b56b1f899fae')
options=(!buildflags !makeflags)

prepare() {
  cd "$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
	break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgname-$pkgver"

  CPPFLAGS=-I/usr/include/db4.8 ./configure --prefix=/usr --without-gui --enable-nls

  # The compilation is stupid... seems to work just forcing it a few times
  make || true
  make || true
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  chmod -x "$pkgdir"/usr/share/man/man1/*
}
