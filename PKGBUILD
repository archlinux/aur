# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=talosctl
pkgver=0.10.0
pkgrel=1
pkgdesc='CLI for Talos - A modern OS for Kubernetes'
arch=('x86_64')
url='https://github.com/talos-systems/talos'
license=('MPL2')
makedepends=('go')
source=("https://github.com/talos-systems/talos/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('0d67de045aaf2daf2f82b2e4ef783de50b918c62af03c5b8e6ba97bacd5a93b3d42ede77fdaabdd2c7d8aa9d6c6557f33457af1322c5fe8406dd7e983021a6e8')

build() {
  cd ${pkgname%ctl}-${pkgver}/cmd/talosctl
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
  ./talosctl completion bash > bashcompletion
  ./talosctl completion zsh > zshcompletion
}

package() {
  cd ${pkgname%ctl}-${pkgver}/cmd/talosctl
  install -Dm755 talosctl "${pkgdir}"/usr/bin/talosctl
  install -Dm644 bashcompletion "${pkgdir}"/usr/share/bash-completion/completions/talosctl
  install -Dm644 zshcompletion "${pkgdir}"/usr/share/zsh/site-functions/_talosctl
}
