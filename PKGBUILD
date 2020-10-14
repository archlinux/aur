# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Maxim Baz <${pkgname} at maximbaz dot com>
# Contributor: Stefan Cocora <stefan dot cocora at gmail dot com>

pkgname=skaffold
pkgver=1.15.0
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
  "d16c91191d4d0ac0d8eb29f9fb02462b948faffefcf0d5b91fd6491a3157d8c2"
  "e90797011d2f79c79a6b184a5e9c35c4e5c582622d075b0022675b96fccefc46"
)
_commit="c4dce04b0d692dce61051d14cf4a2c04c8c688bd"

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
  export GOPATH="${srcdir}/gopath"
  export PATH="${PATH}:${GOPATH}/bin"
  export VERSION="v${pkgver}"
  export COMMIT="${_commit}"
  export TREE_STATE="clean"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw -x -v"
  make install

  # To avoid issues deleting directories next time
  go clean --modcache
}

package() {
  install -Dm755 "${srcdir}/gopath/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
