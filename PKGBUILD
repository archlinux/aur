# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=talosctl
pkgver=0.10.4
pkgrel=1
pkgdesc='CLI for Talos - A modern OS for Kubernetes'
arch=('x86_64')
url='https://github.com/talos-systems/talos'
license=('MPL2')
makedepends=('go')
source=("https://github.com/talos-systems/talos/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('85f207abd516149b8dae457f0b0d9ca8a9e47ca84a400879dbce31353b6cc2347c79feb218200e05f38593bc23a81daadd08c3a18805d847bf210f0f3030aeb4')

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
