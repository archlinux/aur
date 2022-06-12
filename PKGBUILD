# Maintainer Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Maxim Baz <${reponame} at maximbaz dot com>
# Contributor: Stefan Cocora <stefan dot cocora at gmail dot com>
# Maintainer: Jerry Y. Chen <chen@jyny.dev>

pkgname=skaffold-git
reponame=skaffold
provides=('skaffold')
conflicts=('skaffold')
pkgver=1.35.2
pkgrel=1
pkgdesc="A command line tool that facilitates continuous development for Kubernetes applications"
arch=("x86_64")
url="https://github.com/GoogleContainerTools/${reponame}"
license=("Apache")
depends=("docker")
makedepends=("go")
optdepends=(
  "minikube: To use Minikube"
  "kubectl: For Kubernetes support"
  "bash-completion: Tab autocompletion"
)
source=(
  "${reponame}-${pkgver}.tar.gz::https://github.com/GoogleContainerTools/${reponame}/archive/v${pkgver}.tar.gz"
)
sha256sums=('7b28b825ebe5bd3a91616b7d876582cf84e40dc5e9e0b2cdf439e587f2051c0c')
b2sums=('d635637a2987773d30594fa3bd21d145e6934398e5b7bbb175fa27350e7088d482fadd1c9534e9a680b6f7941116d3bfd469fa8a8ea42f03d0a7ffdd6ac3876d')
_commit="f8ae4e65bafdcfd39e4de67329b185432899c7ad"

prepare() {
  cd "${srcdir}/${reponame}-${pkgver}"

  rm -rf "${srcdir}/gopath"
  mkdir -p "${srcdir}/gopath/bin"
  mkdir -p "${srcdir}/gopath/src/github.com/GoogleContainerTools"
  ln -rTsf "${srcdir}/${reponame}-${pkgver}" "${srcdir}/gopath/src/github.com/GoogleContainerTools/${reponame}"
}

build() {
  cd "${srcdir}/gopath/src/github.com/GoogleContainerTools/${reponame}"
  export GOPATH="${srcdir}/gopath"
  export PATH="${PATH}:${GOPATH}/bin"
  export VERSION="v${pkgver}"
  export COMMIT="${_commit}"
  export TREE_STATE="clean"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw -x -v -ldflags=-linkmode=external"
  make install

  # To avoid issues deleting directories next time
  go clean --modcache

  # Create completion files
  "${srcdir}/gopath/bin/${reponame}" completion bash > "${srcdir}/${reponame}-completion.bash"
  "${srcdir}/gopath/bin/${reponame}" completion zsh > "${srcdir}/${reponame}-completion.zsh"
}

package() {
  install -Dm755 "${srcdir}/gopath/bin/${reponame}" "${pkgdir}/usr/bin/${reponame}"
  install -Dm644 "${srcdir}/${reponame}-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/${reponame}"
  install -Dm644 "${srcdir}/${reponame}-completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_skaffold"
}
