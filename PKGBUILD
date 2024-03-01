# Maintainer: Jan Holthuis <jan.holthuis@ruhr-uni-bochum.de>
pkgname=litra
pkgver=1.1.0
pkgrel=1
pkgdesc="Control your Logitech Litra lights from the command line."
arch=(i686 x86_64 armv7h aarch64)
url="https://crates.io/crates/$pkgname/$pkgver"
license=('MIT')
makedepends=(cargo)
depends=(
  glibc
  gcc-libs
  systemd-libs
)
source=(
    "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
    "litra.service"
)
md5sums=('9ba11a0ea24cc9c715d2d01b35e1a9fb'
         '58612b935a9197b6a3ffa8b8254228d0')

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm0644 -t "$pkgdir/usr/lib/systemd/system" "litra.service"

    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/lib/udev/rules.d" "99-litra.rules"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE.md"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "README.md"
}
