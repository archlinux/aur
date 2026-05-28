# Maintainer: Sadrach34 <https://github.com/Sadrach34>
pkgname=sdrx-pax-git
_pkgname=SDRX-pax
pkgver=r5.1a9a96a
pkgrel=1
pkgdesc="Interactive package picker for Arch Linux (pacman + AUR) using Rust and fzf"
arch=('x86_64' 'aarch64')
url="https://github.com/Sadrach34/SDRX-pax"
license=('MIT')
depends=('fzf' 'yay')
makedepends=('git' 'cargo')
provides=('sdrx-pax' 'pax')
conflicts=('sdrx-pax')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/pax" "${pkgdir}/usr/bin/pax"
  install -Dm755 "update.sh" "${pkgdir}/usr/share/sdrx-pax/update.sh"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
