# Maintainer: Gigas002 <gigas002@pm.me>

_pkgname=scanmem-rs
pkgname=scanmem-rs-git
pkgver=r49.ge3a3e39
pkgrel=1
pkgdesc='Rust rewrite of scanmem/GameConqueror: process memory scanner and editor'
arch=('x86_64' 'aarch64')
url='https://github.com/Gigas002/scanmem-rs'
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('scanmem' 'gameconqueror' 'libscanmem')
conflicts=('scanmem' 'gameconqueror' 'libscanmem')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --all-features --frozen --workspace
}

package() {
  cd "$_pkgname"

  install -Dm755 -t "$pkgdir/usr/bin/" target/release/scanmem target/release/gameconqueror
  install -Dm644 LICENSE-GPL-3.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE-GPL-3.0"
  install -Dm644 LICENSE-LGPL-3.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE-LGPL-3.0"
}
