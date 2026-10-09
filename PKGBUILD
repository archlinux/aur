#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=momentum-git
pkgver=0.1.0.r83.g588aa23
pkgrel=1
pkgdesc="CLI for Sennheiser Momentum 4 headphones (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/timmo001/omarchy-momentumctl"
license=('Apache-2.0')
makedepends=('git' 'bun')
depends=('glibc' 'bluez-utils')
optdepends=('libpulse: show the Bluetooth codec and sample rate')
provides=('momentum')
conflicts=('momentum' 'momentum-bin')
options=('!strip')
source=("$pkgname::git+https://github.com/timmo001/omarchy-momentumctl.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local version
  version=$(git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
  if [ -n "$version" ]; then
    printf '%s' "$version"
  else
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "$pkgname"
  bun install --frozen-lockfile
  bun run build
  ./dist/momentum --completions zsh >momentum.zsh
  ./dist/momentum --completions bash >momentum.bash
  ./dist/momentum --completions fish >momentum.fish
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 dist/momentum "$pkgdir/usr/bin/momentum"
  install -Dm644 momentum.zsh "$pkgdir/usr/share/zsh/site-functions/_momentum"
  install -Dm644 momentum.bash "$pkgdir/usr/share/bash-completion/completions/momentum"
  install -Dm644 momentum.fish "$pkgdir/usr/share/fish/vendor_completions.d/momentum.fish"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
