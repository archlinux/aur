# Maintainer: Laythe <laythedev@gmail.com>
pkgname=blkar
pkgver=7.2.7
pkgrel=3
pkgdesc="Multithreaded archiver offering bit rot protection and sector level recoverability"
arch=('x86_64')
url="https://github.com/darrenldl/blockyarchive"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/darrenldl/blockyarchive/archive/v${pkgver}.tar.gz"
        'Cargo.lock')
sha256sums=('807d4ad9fca8afe13bbd7020ecf9102298d59d839b1a8fccd8693799a8edfc9b'
            '4a0dcf1639d932e59948d3c04914f04404a6be81afb821bb86983c7e65851cd4')

prepare() {
  cd "blockyarchive-$pkgver"
  cp ../Cargo.lock .
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "blockyarchive-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "blockyarchive-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --frozen
}

package() {
  cd "blockyarchive-$pkgver"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
