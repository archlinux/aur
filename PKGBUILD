#!/bin/bash
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=float-app-git
pkgver=0.r0.local
pkgrel=1
pkgdesc="Persistently float selected Hyprland windows (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/timmo001/float-app"
license=('Apache-2.0')
depends=('glibc' 'slurp')
makedepends=('bun' 'git')
provides=('float-app')
conflicts=('float-app' 'float-app-bin')
options=('!strip')
source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  bun install --frozen-lockfile
  bun run build
  bun run completions
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 dist/float-app "$pkgdir/usr/bin/float-app"
  install -Dm644 .scripts/linux/completions/float-app.bash "$pkgdir/usr/share/bash-completion/completions/float-app"
  install -Dm644 .scripts/linux/completions/float-app.fish "$pkgdir/usr/share/fish/vendor_completions.d/float-app.fish"
  install -Dm644 .scripts/linux/completions/_float-app "$pkgdir/usr/share/zsh/site-functions/_float-app"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
