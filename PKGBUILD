# Maintainer Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Maxim Baz <${reponame} at maximbaz dot com>
# Contributor: Stefan Cocora <stefan dot cocora at gmail dot com>
# Maintainer: Jerry Y. Chen <chen@jyny.dev>

pkgname=skaffold-git
reponame=skaffold
provides=('skaffold')
conflicts=('skaffold')
pkgver=2.10.1
pkgrel=1
pkgdesc="A command line tool that facilitates continuous development for Kubernetes applications"
arch=("x86_64")
url="https://github.com/GoogleContainerTools/${reponame}"
license=("Apache")
makedepends=("go")
optdepends=(
  "docker: One of tools for building images support by skaffold"
  "minikube: To use Minikube"
  "kubectl: One of tools for deploying applications support by skaffold"
  "bash-completion: Tab autocompletion"
)

source=(
  "${reponame}-${pkgver}.tar.gz::https://github.com/GoogleContainerTools/${reponame}/archive/v${pkgver}.tar.gz"
)
sha256sums=('f1a83938c9481a6de8cc454f7d065388873f785832a33849cefac36a38bb8050')
b2sums=('dedb11c756c6e4ac2314a9f5349e9a2342bfd6d2feecebe7f5ed166c9fc1905237f2d5d9e690bffa6ae95c23a9f6d481530e4a95ed49270b7bcba54ef1fff894')
_commit="df0264229733d654ae0f43466e760dae936b12e7"

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
  go install github.com/google/go-licenses@latest
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
