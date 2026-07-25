#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=music-assistant-tui-git
pkgver=0.1.0.r5.g72879db
pkgrel=1
pkgdesc="Terminal UI for Music Assistant (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/timmo001/music-assistant-tui"
license=('Apache-2.0')
makedepends=('git' 'bun' 'nodejs')
depends=('glibc' 'icu')
provides=('music-assistant-tui')
conflicts=('music-assistant-tui')
options=('!strip' '!debug')
source=("$pkgname::git+https://github.com/timmo001/music-assistant-tui.git")
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
  bun build src/index.ts --compile --outfile music-assistant-tui
  ./music-assistant-tui completions bash > music-assistant-tui.bash
  ./music-assistant-tui completions fish > music-assistant-tui.fish
  ./music-assistant-tui completions zsh > _music-assistant-tui
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 music-assistant-tui "$pkgdir/usr/bin/music-assistant-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 music-assistant-tui.bash "$pkgdir/usr/share/bash-completion/completions/music-assistant-tui"
  install -Dm644 music-assistant-tui.fish "$pkgdir/usr/share/fish/vendor_completions.d/music-assistant-tui.fish"
  install -Dm644 _music-assistant-tui "$pkgdir/usr/share/zsh/site-functions/_music-assistant-tui"
}
