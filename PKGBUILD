#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=context-git
pkgver=0.2.0.r110.g25242a8
pkgrel=2
pkgdesc="Standalone CLI and MCP server for deterministic repository context (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/timmo001/context"
license=('Apache-2.0')
keywords=('mcp' 'cli' 'context' 'git' 'agent')
makedepends=('git' 'bun')
depends=('glibc')
provides=('context')
conflicts=('context' 'context-bin')
options=('!strip')
source=("$pkgname::git+https://github.com/timmo001/context.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local base_version
  base_version=$(bun -e 'const pkg = await Bun.file("package.json").json(); process.stdout.write(pkg.version)')
  printf "%s.r%s.g%s" "$base_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
