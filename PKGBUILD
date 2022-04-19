# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=talosctl
pkgver=1.0.3
_commit=689c6e54b913f66ec733e1033a92bae62aff378c
# https://github.com/siderolabs/talos/blob/master/Makefile#L16
_pkgs='v1.0.0-8-g76f8c5b'
_extras='v1.0.0-2-gc5d3ab0'
pkgrel=1
pkgdesc='CLI for Talos - A modern OS for Kubernetes'
arch=('x86_64')
url='https://github.com/siderolabs/talos'
license=('MPL2')
makedepends=('git' 'go')
options=(!lto)
source=("git+https://github.com/siderolabs/talos.git#commit=$_commit?signed")
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
    -ldflags "-X github.com/talos-systems/talos/pkg/version.Name=Talos \
              -X github.com/talos-systems/talos/pkg/version.SHA=${_commit} \
              -X github.com/talos-systems/talos/pkg/version.Tag=v${pkgver} \
              -X github.com/talos-systems/talos/pkg/version.PkgsVersion=${_pkgs} \
              -X github.com/talos-systems/talos/pkg/version.ExtrasVersion=${_extras} \
              -X github.com/talos-systems/talos/pkg/images.Username=talos-systems \
              -X github.com/talos-systems/talos/pkg/images.Registry=ghcr.io \
              -X ggithub.com/talos-systems/talos/cmd/talosctl/pkg/mgmt/helpers.ArtifactsPath=_out \
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
