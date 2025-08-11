# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: giacomogiorgianni@gmail.com

pkgname=boomaga
pkgver=3.0.0
pkgrel=3
pkgdesc="Virtual printer for viewing a document before printing it out using the physical printer"
arch=(x86_64 aarch64)
url="https://www.boomaga.org/"
license=(GPL2 LGPL2.1)
depends=(qt5-base poppler)
depends+=(libpoppler.so)
makedepends=(cmake qt5-tools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Boomaga/boomaga/archive/v${pkgver}.tar.gz"
		"boomaga-ghostscript-9.54.patch::https://github.com/Boomaga/boomaga/pull/108/commits/4eba2612773593e5d5d1c331ee1de9d2e614ded6.patch")
sha256sums=('74af10ec5a78008d335011eca0f63ed7ccd4bc2fdac2f4cffa73db7acc05e767'
            'cd8ae3cf1e4b34eb03a53697db543caf90c5b0f39526304c90438d955ff460d2')

prepare() {
  cd "boomaga-${pkgver}"
  patch -Np1 -i ../boomaga-ghostscript-9.54.patch
}

build() {
  cmake -B build -S "boomaga-${pkgver}" -Wno-dev \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  #install -D -m755 "$srcdir/$pkgname-$pkgver/scripts/installPrinter.sh" "${pkgdir}/usr/bin/"
}
