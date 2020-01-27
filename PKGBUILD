# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Maxim Baz <${pkgname} at maximbaz dot com>
# Contributor: Stefan Cocora <stefan dot cocora at gmail dot com>

pkgname=skaffold
pkgver=1.2.0
pkgrel=1
pkgdesc="A command line tool that facilitates continuous development for Kubernetes applications"
arch=("x86_64")
url="https://github.com/GoogleContainerTools/${pkgname}"
license=("Apache")
depends=("docker" "kubectl")
makedepends=("go")
optdepends=(
  "google-cloud-sdk: To use GKE"
  "minikube: To use Minikube"
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/GoogleContainerTools/${pkgname}/archive/v${pkgver}.tar.gz"
  "build_info.patch"
)
sha256sums=(
  "35b363a8c0084ad5a001f0b1681a680f9c1b37cfc826f9bfe0f6975383ba3745"
  "9363c1f0dda736d3c055368844f36c6b17850a8f576e834737032ea54aabe780"
)
_commit="80f82f42fe271aea1058f4a37776d52ab5a7c441"

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/build_info.patch"

  rm -rf "${srcdir}/gopath"
  mkdir -p "${srcdir}/gopath/src/github.com/GoogleContainerTools"
  ln -rTsf "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/gopath/src/github.com/GoogleContainerTools/${pkgname}"
}

build() {
  cd "${srcdir}/gopath/src/github.com/GoogleContainerTools/${pkgname}"
  GOPATH="${srcdir}/gopath" PATH="${PATH}:${GOPATH}/bin" VERSION="v${pkgver}" COMMIT="${_commit}" TREE_STATE="clean" make install
}

package() {
  install -Dm755 "${srcdir}/gopath/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
