# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Maxim Baz <${pkgname} at maximbaz dot com>
# Contributor: Stefan Cocora <stefan dot cocora at gmail dot com>

pkgname=skaffold
pkgver=0.37.1
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
  "6331f5e38dd638a4e58fe47695aa365004ab918696a79abcf7108c41921869be"
  "20e7df04a74d24ec9056d3c64a822b1792c7544c5467dd56d7376691ff093ae7"
)
_commit="b58aa4ec019c7af0599e0c85ade91f438c341008"

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
