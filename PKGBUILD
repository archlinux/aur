#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=repo-notes-git
pkgver=20260729.0.r70.g27e97e3
pkgrel=1
pkgdesc="Standalone CLI and MCP server for repo-scoped Markdown notes (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/timmo001/notes"
license=('Apache-2.0')
keywords=('mcp' 'cli' 'notes' 'handoff' 'agent')
makedepends=('git' 'bun')
depends=('glibc' 'git')
provides=('repo-notes')
conflicts=('repo-notes' 'repo-notes-bin')
options=('!strip')
install=repo-notes.install
source=("$pkgname::git+https://github.com/timmo001/notes.git")
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
  ./dist/notes completions zsh >notes.zsh
  ./dist/notes completions bash >notes.bash
  ./dist/notes completions fish >notes.fish
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 dist/notes "$pkgdir/usr/bin/notes"
  ln -s notes "$pkgdir/usr/bin/note"
  ln -s notes "$pkgdir/usr/bin/handoffs"
  ln -s notes "$pkgdir/usr/bin/handoff"
  install -Dm644 notes.zsh "$pkgdir/usr/share/zsh/site-functions/_notes"
  install -Dm644 notes.bash "$pkgdir/usr/share/bash-completion/completions/notes"
  install -Dm644 notes.fish "$pkgdir/usr/share/fish/vendor_completions.d/notes.fish"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
