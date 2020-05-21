# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Maxim Baz <${pkgname} at maximbaz dot com>
# Contributor: Stefan Cocora <stefan dot cocora at gmail dot com>

pkgname=skaffold
pkgver=1.10.1
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
  "576c68e2656b58090c597fa2b2179acd80ecc88b5e1ddc41b0d90026a0c62e7b"
  "9363c1f0dda736d3c055368844f36c6b17850a8f576e834737032ea54aabe780"
)
_commit="931a70a6334436735bfc4ff7633232dd5fc73cc1"

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/build_info.patch"

  rm -rf "${srcdir}/gopath"
  mkdir -p "${srcdir}/gopath/bin"
  mkdir -p "${srcdir}/gopath/src/github.com/GoogleContainerTools"
  ln -rTsf "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/gopath/src/github.com/GoogleContainerTools/${pkgname}"
}

build() {
  cd "${srcdir}/gopath/src/github.com/GoogleContainerTools/${pkgname}"
  GOPATH="${srcdir}/gopath" PATH="${PATH}:${GOPATH}/bin" VERSION="v${pkgver}" COMMIT="${_commit}" TREE_STATE="clean" make install

  # To avoid issues deleting directories next time
  GOPATH="${srcdir}" go clean --modcache
}

package() {
  install -Dm755 "${srcdir}/gopath/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
