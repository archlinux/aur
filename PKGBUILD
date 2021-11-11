# Maintainer: Kris Nóva <kris@nivenly.com>

pkgbase=falco
pkgname=(falco falco-dkms)
pkgver=0.30.0
pkgrel=1
pkgdesc="Cloud native runtime security"
arch=(x86_64)
url="https://falco.org/"
license=(Apache)
makedepends=(cmake git c-ares jq grpc yaml-cpp)
checkdepends=()
optdepends=()
backup=()
options=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/falcosecurity/falco/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9d90a86752a700dad2d1ea888b2cd33cdc808621faa2b6300bb0463d404744fb')

# Kris Nóva PGP Key
#validpgpkeys=('F5F9B56417B7F2CAC1DEC2E372BB115B4DDD8252')

prepare() {
  cd "${pkgname}-${pkgver}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package_falco() {
    install -d "${pkgdir}/etc/falco"
    cp -rv falco-${pkgver}-${arch}/etc/falco/* "${pkgdir}/etc/falco"

    install -d "${pkgdir}/usr/share/falco"
    cp -rv falco-${pkgver}/usr/share/falco/* "${pkgdir}"/usr/share/falco

  make DESTDIR="${pkgdir}" install
}

package_falco-dkms() {
  depends=(dkms linux-headers)
    install -d "${pkgdir}/usr/src/falco-${pkgver}"
    cp -rv falco-${pkgver}-${arch}/usr/src/falco-${_commit}/* "${pkgdir}/usr/src/falco-${pkgver}"
}
