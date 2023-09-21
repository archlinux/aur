# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=jigdo
pkgver=0.8.2
pkgrel=1
pkgdesc="Distribute large images by sending and receiving the files that make them up"
arch=('x86_64')
url="https://www.einval.com/~steve/software/jigdo/"
license=('GPL2')
depends=('db4.8' 'wget')
makedepends=('docbook-utils' 'docbook-sgml' 'perl-sgmls')
source=("${url}download/jigdo-${pkgver}.tar.xz")
b2sums=('44b5c135b185f9cd7465993f2c61ed1770df889f9e0cb8240fd53ee017271857bbb161a88f116676ac4c54a670f31a9d616f1a5f3c5eb147506978405b572f0f')
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
