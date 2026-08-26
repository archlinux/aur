# Maintainer: Vaishnav-Sabari-Girish <vaishnav.sabari.girish@gmail.com>

pkgname=comchan-ratty
_pkgname=ComChan
pkgver=0.15.0
pkgrel=1
pkgdesc="A blazingly fast minimal serial monitor with plotter TUI and more (With 3D support)"
arch=(
  'x86_64'
  'aarch64'
  'riscv64'
)
url="https://github.com/Vaishnav-Sabari-Girish/ComChan"
license=('MIT')
depends=('gcc-libs' 'libudev.so' 'fontconfig')
makedepends=('cargo')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8ae6b457605bd24dd14961279cec3f38799f9c813b93ccb02af913764df2ddb6')

prepare() {
  cd "$_pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --features ratty --release --frozen --locked
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --all-targets --features ratty --frozen --locked
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/comchan" "$pkgdir/usr/bin/comchan"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
