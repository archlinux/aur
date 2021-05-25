# Maintainer: Eldeberen <eldeberen.aur@middleearth.fr>
pkgname=openlibm-casio
pkgver=0.7.5
pkgrel=1
pkgdesc='Fork of the OpenLibm math library with support for fx-9860G and fx-CG 50'
arch=('i686' 'x86_64')
url="https://gitea.planet-casio.com/Lephenixnoir/OpenLibm"
licence=('custom')
makedepends=('sh-elf-gcc-casio')
options=('!buildflags' '!strip')
source=("$pkgname-$pkgver.tar.gz::https://gitea.planet-casio.com/Lephenixnoir/OpenLibm/archive/v${pkgver}.tar.gz")
sha256sums=('445e945750f8940f6c8ebd692f64f39f176353fea3671e6d39585f1f873a10a2')

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
