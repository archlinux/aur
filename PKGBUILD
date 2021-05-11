# Maintainer: Eldeberen <eldeberen.aur@middleearth.fr>
pkgname=openlibm-casio
pkgver=0.7.2
pkgrel=1
pkgdesc='Fork of the OpenLibm math library with support for fx-9860G and fx-CG 50'
arch=('i686' 'x86_64')
url="https://gitea.planet-casio.com/Lephenixnoir/OpenLibm"
licence=('custom')
makedepends=('sh-elf-gcc-casio')
options=('!buildflags' '!strip')
source=("$pkgname-$pkgver.tar.gz::https://gitea.planet-casio.com/Lephenixnoir/OpenLibm/archive/v${pkgver}.tar.gz")
sha256sums=('d919ceda62ee32b7397ee521b8ad5f96e7f8c46645c6e554d51ce50fd9bf3f6f')

prepare() {
  cd "${srcdir}/openlibm"
  make clean
}

build() {
  cd "$srcdir/openlibm"
  _prefix=$(sh-elf-gcc --print-search-dirs | grep install | sed 's/install: //')
  make USEGCC=1 TOOLPREFIX=sh-elf- ARCH=sh3eb libdir="${_prefix}" includedir="${_prefix}/include" libopenlibm.a
}

package() {
  cd "$srcdir/openlibm"
  _prefix=$(sh-elf-gcc --print-search-dirs | grep install | sed 's/install: //')
  make USEGCC=1 TOOLPREFIX=sh-elf- ARCH=sh3eb libdir="${_prefix}" includedir="${_prefix}/include"  DESTDIR="$pkgdir" install-static install-headers

  # Install licence
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
