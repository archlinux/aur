# Maintainer: CrimsonHawk
pkgname=ssd-flash-id-git
pkgver=0.2.2.r7.g6f2669e
pkgrel=1
pkgdesc="Identify NAND flash chips on NVMe and SATA SSDs via vendor-specific commands"
arch=('x86_64' 'aarch64')
url="https://github.com/pseudolabel/ssd-flash-id"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo' 'jq')
provides=('ssd-flash-id')
conflicts=('ssd-flash-id')
options=(!debug)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  local _ver=$(grep '^version =' Cargo.toml | head -n1 | cut -d '"' -f2)
  printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 "target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}