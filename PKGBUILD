# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=git-statuses
pkgver=0.8.1
pkgrel=1
pkgdesc='A command-line tool to display the status of multiple Git repositories.'
arch=('x86_64')
options=(!lto)
url=https://github.com/bircni/git-statuses
license=('MIT')
depends=(glibc gcc-libs libgit2)
makedepends=(cargo)
conflicts=("$pkgname-bin")

source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('b0593212350025ea5bd4d3d08bf92cc9c692395b692558f7b7c3369cd9038852')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin $pkgname
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
