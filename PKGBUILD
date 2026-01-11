# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=ferrite
pkgver=0.2.1
pkgrel=2
pkgdesc='A fast, lightweight text editor for Markdown, JSON, YAML, and TOML files.'
arch=('x86_64' 'aarch64')
options=(!lto)
url=https://github.com/OlaProeis/Ferrite
license=('MIT')
depends=(glibc gcc-libs openssl zlib-ng-compat)
makedepends=(cargo)
conflicts=("$pkgname-bin")

source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('f89fffd1dbb5f3a2f4349ade44897a55560af94648fadbe7c5125db3928573ef')

prepare() {
  cd ${pkgname^}-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd ${pkgname^}-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin $pkgname
}

package() {
  cd ${pkgname^}-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
