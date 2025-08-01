# Maintainer: PhantomShift <phantomsmhift at proton dot me>

pkgname=lxcomm
pkgver=0.3.0
pkgrel=2
pkgdesc="Mod browser, downloader and manager made for XCOM2(WOTC) on Linux"
url="https://github.com/PhantomShift/lxcomm"
license=('MIT OR Apache-2.0')
arch=('x86_64' 'aarch64')
provides=('lxcomm')
depends=('steamcmd')
makedepends=('git' 'cargo-nightly')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "lxcomm.desktop")
sha256sums=('6f379590349ba01aedea958d7ed5b9b8adc8747518d72eaef85855516f4c4aba'
            '45f16be98e145170cf64df874baeddb4936e5beb95cf62ef9db75c515b43fa19')

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
  install -Dm644 -t "$pkgdir/usr/share/applications/" $pkgname.desktop

  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 -t "$pkgdir/usr/bin/" target/release/$pkgname
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT

  install -Dm644 assets/lxcomm_icon.svg "$pkgdir/usr/share/pixmaps/lxcomm.svg"
}
