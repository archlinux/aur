# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=talosctl
pkgver=0.12.2
pkgrel=1
pkgdesc='CLI for Talos - A modern OS for Kubernetes'
arch=('x86_64')
url='https://github.com/talos-systems/talos'
license=('MPL2')
makedepends=('go')
source=("https://github.com/talos-systems/talos/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('f02fee9334cf468faec157085205c7a64fab14666cebbc0514dd09a2ca8929871a6191dd3bda8ee6fabc7ff8df4665b092a7e6889c31abc186a49d3e876162c6')

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
