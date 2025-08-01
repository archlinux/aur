# Maintainer: PhantomShift <phantomsmhift at proton dot me>

pkgname=lxcomm
pkgver=0.3.1
pkgrel=1
pkgdesc="Mod browser, downloader and manager made for XCOM2(WOTC) on Linux"
url="https://github.com/PhantomShift/lxcomm"
license=('MIT OR Apache-2.0')
arch=('x86_64' 'aarch64')
provides=('lxcomm')
depends=('steamcmd')
makedepends=('git' 'cargo-nightly' 'just')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b29aea71ebd63fdb1ea28cc82e8a5fcf487dd5cd8aef721239ef212d601a802f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host://p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  just dest-root="$pkgdir/usr/" install
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
}
