pkgname=whip-server
pkgver=5.01
_pkgsubver="-win64b"
pkgrel=4
pkgdesc="The InWorldz WHIP distributed asset server"
arch=('i686' 'x86_64')
url="https://github.com/HalcyonGrid/${pkgname}"
license=("Apache")
install=$pkgname.install
source=("${pkgname}-${pkgver}${_pkgsubver}::${url}/archive/v${pkgver}${_pkgsubver}.tar.gz"
  "${pkgname}.service")
makedepends=(cmake boost)
depends=(boost-libs)
options=(emptydirs)
sha512sums=('711e146da5ff338fbc3b703440407ef6e92f4df9a5817e1f5c2f9ede15ec37e70049d3db28183a37c1a77fa7555c7e165130eb3e984181c55bc94fe3f0f5c52d'
  '9ff461f553ee1496d054d9d21f3a0240a1923827106adf60338343870b87f5f31da858ed7f3bceced2cf97ea9dc34418d450a501cb6f6cb6615ca5fe7c25aab5')

build() {
  cmake \
    -S ${pkgname}-${pkgver}${_pkgsubver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  install -Dm644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm755 build-cmake/whip "${pkgdir}/srv/inworldz/whip"
  install -m644 ${pkgname}-${pkgver}${_pkgsubver}/whip.cfg.sample "${pkgdir}/srv/inworldz/"
  chmod 777 "${pkgdir}/srv/inworldz/"
  install -d 777 "${pkgdir}/srv/inworldz/assets"
  install -Dm644 ${pkgname}-${pkgver}${_pkgsubver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
