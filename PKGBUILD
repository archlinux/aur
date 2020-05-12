# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=jigdo
pkgver=0.8.0
pkgrel=1
pkgdesc="Distribute large images by sending and receiving the files that make them up"
arch=('x86_64')
url="https://www.einval.com/~steve/software/jigdo/"
license=('GPL2')
depends=('db' 'wget')
makedepends=('docbook-utils' 'docbook-sgml' 'perl-sgmls')
source=("${url}download/jigdo-${pkgver}.tar.xz")
b2sums=('0d3ef3c50394174fb6d5c9b6f8e5cdbffe86d428b7c4c4552025678ffbdba88331aa58e4b6a7594e67866fcba6531fdcae20aa0feb1abd82f5264df585360567')

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

  ./configure --prefix=/usr --without-gui --enable-nls

  # The compilation is stupid... seems to work just forcing it a few times
  make -j1 || true
  make -j1 || true
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  chmod -x "$pkgdir"/usr/share/man/man1/*
}
