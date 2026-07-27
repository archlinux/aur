pkgname=vgs-shell-git
pkgver=0.1.0.r0.g0000000
pkgrel=2
pkgdesc='VanillaGreen desktop shell for Hyprland and Niri (git)'
arch=('x86_64' 'aarch64')
url='https://github.com/vanillagreencom/vgs'
license=('MIT')
depends=('quickshell' 'jq' 'python' 'systemd')
makedepends=('git' 'go')
provides=('vgs-shell')
conflicts=('vgs-shell')
source=('git+https://github.com/vanillagreencom/vgs.git')
sha256sums=('SKIP')

pkgver() {
  cd vgs
  printf '%s.r%s.g%s' "$(cat VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/vgs"
  sed -i 's|^#!/bin/env bash$|#!/usr/bin/env bash|' config/vshell/nvim/colorschemes/tokyonight.nvim/scripts/{build,docs}
}

build() {
  cd "$srcdir/vgs/backend"
  go build -mod=vendor -buildvcs=false -trimpath -ldflags="-s -w -X vshell/backend/internal/registry.cliVersion=$(cat ../VERSION)" -o "$srcdir/vshell-backend" ./cmd/vshell-backend
}

package() {
  cd "$srcdir/vgs"
  DESTDIR="$pkgdir" VGS_BACKEND_BINARY="$srcdir/vshell-backend" packaging/install-system.sh
}