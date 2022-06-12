# Maintainer Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Maxim Baz <${reponame} at maximbaz dot com>
# Contributor: Stefan Cocora <stefan dot cocora at gmail dot com>
# Maintainer: Jerry Y. Chen <chen@jyny.dev>

pkgname=skaffold-git
reponame=skaffold
provides=('skaffold')
conflicts=('skaffold')
pkgver=1.36.0
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
sha256sums=('0e6c3891e7d62d023094c7d985fe5aac86f07ed1e229817d0041d8646b3de833')
b2sums=('2729d812366330d32f6d9f484654fac9a5a9098781d553c03d98ca79450dcd9061d503b9a3cac8257dc50122bf54587c7503fc53daec417cfc470f5a4e8ee342')
_commit="189a55291c18ac850277134d2b8f3eaa2c4f7a1d"

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
