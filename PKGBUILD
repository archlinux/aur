

pkgname=uutils-sed
pkgver=0.1.1
pkgrel=1
pkgdesc="Rust implementation of sed"
arch=('x86_64')
url=https://github.com/uutils/sed
license=('MIT')
depends=(gcc-libs)
makedepends=(rust)
conflicts=(sed)
provides=(sed)
source=("https://github.com/uutils/sed/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('48356c208190ceb4e8bd98ffa98d4597111b000e471e4c8c284b0939f4bac3c1')

build(){
  cd sed-$pkgver
  export RUSTFLAGS="${RUSTFLAGS} -C force-unwind-tables=no"
  [ $RUSTC_BOOTSTRAP = 1 ] && export CARGOFLAGS='-Zbuild-std=std,panic_abort --config=profile.release.panic=\"immediate-abort\" -Zpanic-immediate-abort'
  cargo build --profile=release-fast
}

package() {
  cd sed-$pkgver
  install -Dm755 target/release-fast/sed -t "$pkgdir"/usr/bin
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
