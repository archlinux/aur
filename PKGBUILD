# Maintainer: Antoni Boucher <bouanto@zoho.com>

pkgname=ordex-git
pkgver=r458.21efe55
pkgrel=1
pkgdesc='A TUI text editor written in Rust with vim-style keybindings'
arch=('x86_64')
url='https://github.com/ordex-editor/ordex'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git' 'rust')
provides=('ordex')
conflicts=('ordex')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  local version
  version="$(git describe --long --tags --abbrev=7 2>/dev/null || true)"
  if [[ -n $version ]]; then
    version="${version#v}"
    version="${version//-/.}"
    printf '%s\n' "$version"
    return
  fi

  printf 'r%s.%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"

  cargo fetch --locked
}

build() {
  cd "$pkgname"

  cargo build --release --locked --offline
}

package() {
  cd "$pkgname"

  install -Dm755 target/release/ordex "$pkgdir/usr/bin/ordex"
}
