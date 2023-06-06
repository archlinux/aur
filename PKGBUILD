# Maintainer Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Maxim Baz <${reponame} at maximbaz dot com>
# Contributor: Stefan Cocora <stefan dot cocora at gmail dot com>
# Maintainer: Jerry Y. Chen <chen@jyny.dev>

pkgname=skaffold-git
reponame=skaffold
provides=('skaffold')
conflicts=('skaffold')
pkgver=2.5.0
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
sha256sums=('caeb91c6f9fd940e58d8eeef910820ca48c582919e2ba9b76fabf08d0d8ddf8c')
b2sums=('0f9df2377fc54f26d3e4e808f700742381e2d0adf648e7c801478b3017ace9c2f0c4af5a8c95d3c3eac51d0620c223231c04da4f7c2b2918d316486035535013')
_commit="8b817ab4bac398e2e935e838446700ca42a713b5"

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
