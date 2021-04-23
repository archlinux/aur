# Maintainer: Jerry Y. Chen <jynych3n@gmail.com>
# Maintainer Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Maxim Baz <${reponame} at maximbaz dot com>
# Contributor: Stefan Cocora <stefan dot cocora at gmail dot com>

pkgname=skaffold-git
pkgver=1.22.0
pkgrel=2
pkgdesc="A command line tool that facilitates continuous development for Kubernetes applications"
arch=("x86_64")
reponame=skaffold
provides=('skaffold')
conflicts=('skaffold')
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
  "build_info.patch"
)
sha256sums=('d9cee2e079b32b289d0e8c2c64fe2b403822aa9a4127482339b88f3160805639'
            'c382f4c48e81d0a66cd679bc9d7e76942d1f07718f9ecf134a107bb355cdf193')
_commit="c48e97690d8daffd68141c2a68fcbe3df6f6936a"

prepare() {
  cd "${srcdir}/${reponame}-${pkgver}"
  patch -Np1 -i "${srcdir}/build_info.patch"

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
