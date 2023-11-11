# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=talosctl
pkgver=1.5.5
pkgrel=1
pkgdesc='CLI for Talos - A modern OS for Kubernetes'
arch=('x86_64')
url='https://github.com/siderolabs/talos'
license=('MPL2')
makedepends=('git' 'go')
options=(!lto)
source=("git+https://github.com/siderolabs/talos.git#tag=v${pkgver}?signed")
b2sums=('SKIP')
validpgpkeys=('DB997306E3102F11C4E8F5527B26396447AB6DFD'  # "Andrey Smirnov <andrey.smirnov@talos-systems.com>"
              'CC51116A94490FA6FB3C18EB2401FCAE863A06CA'  # frezbo (Noel Georgi) <git@frezbo.dev>
              '15D5721F5F5BAF121495363EFE042E3D4085A811') # Andrey Smirnov <andrey.smirnov@siderolabs.com>

build() {
  cd talos
  export _PKGS=$(grep '^PKGS ?=.*' Makefile | cut -d' ' -f3)
  export _EXTRA=$(grep '^EXTRAS ?=.*' Makefile | cut -d' ' -f3)
  cd cmd/talosctl
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags "-X github.com/talos-systems/talos/pkg/version.Name=Talos \
              -X github.com/talos-systems/talos/pkg/version.SHA=$(git rev-parse HEAD) \
              -X github.com/talos-systems/talos/pkg/version.Tag=v${pkgver} \
              -X github.com/talos-systems/talos/pkg/version.PkgsVersion=${_PKGS:?_PKGS unset} \
              -X github.com/talos-systems/talos/pkg/version.ExtrasVersion=${_EXTRA:?_EXTRA unset} \
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
