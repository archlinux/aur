#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=context-git
pkgver=0.1.0.r14.g20e5870
pkgrel=1
pkgdesc="Standalone CLI and MCP server for deterministic repository context (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/timmo001/context"
license=('Apache-2.0')
keywords=('mcp' 'cli' 'context' 'git' 'agent')
makedepends=('git' 'bun')
depends=('glibc')
provides=('context')
conflicts=('context')
options=('!strip')
source=("$pkgname::git+https://github.com/timmo001/context.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  bun install --frozen-lockfile
  bun run build
  ./dist/context completions zsh >context.zsh
  ./dist/context completions bash >context.bash
  ./dist/context completions fish >context.fish
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 dist/context "$pkgdir/usr/bin/context"
  install -Dm644 context.zsh "$pkgdir/usr/share/zsh/site-functions/_context"
  install -Dm644 context.bash "$pkgdir/usr/share/bash-completion/completions/context"
  install -Dm644 context.fish "$pkgdir/usr/share/fish/vendor_completions.d/context.fish"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
