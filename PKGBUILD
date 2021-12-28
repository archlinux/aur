# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=talosctl
pkgver=0.14.0
_commit=675dee0e73bb4b866d2a07b9b2f0a54fb7f3b575
pkgrel=3
pkgdesc='CLI for Talos - A modern OS for Kubernetes'
arch=('x86_64')
url='https://github.com/talos-systems/talos'
license=('MPL2')
makedepends=('go')
source=("git+https://github.com/talos-systems/talos.git#commit=$_commit?signed")
b2sums=('SKIP')
validpgpkeys=('DB997306E3102F11C4E8F5527B26396447AB6DFD') # "Andrey Smirnov <andrey.smirnov@talos-systems.com>"

pkgver() {
  cd talos/cmd/talosctl
  git describe | sed 's/^v//;s/-//;s/-/+/g'
}

build() {
  cd talos/cmd/talosctl
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags "-X github.com/talos-systems/talos/pkg/version.Tag=v${pkgver} \
              -X github.com/talos-systems/talos/pkg/version.SHA=${_commit} \
              -linkmode=external \
              -extldflags ${LDFLAGS}" \
    -mod=readonly \
    -modcacherw \
    .
  ./talosctl completion bash > bashcompletion
  ./talosctl completion fish > fishcompletion
  ./talosctl completion zsh > zshcompletion
}

package() {
  cd talos/cmd/talosctl
  install -Dm755 talosctl "${pkgdir}"/usr/bin/talosctl
  install -Dm644 bashcompletion "${pkgdir}"/usr/share/bash-completion/completions/talosctl
  install -Dm644 fishcompletion "${pkgdir}"/usr/share/fish/completions/talosctl.fish
  install -Dm644 zshcompletion "${pkgdir}"/usr/share/zsh/site-functions/_talosctl
}
