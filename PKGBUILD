# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=talosctl
pkgver=0.8.0
pkgrel=1
pkgdesc='CLI for Talos - A modern OS for Kubernetes'
arch=('x86_64')
url='https://github.com/talos-systems/talos'
license=('MPL2')
makedepends=('go')
source=("https://github.com/talos-systems/talos/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('3f89776b9767aba1c9f6c62b33d8f30afce37f56820ffff0aefc0c71472d2a64db9aed64e23c8a35605ab72ddfb56d3399da13524a75622d5cfe39e0cfd381d6')

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
