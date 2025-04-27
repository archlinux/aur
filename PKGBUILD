# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=rx888-stream-git
_pkgname=rx888_stream
pkgver=r16.b699542
pkgrel=1
pkgdesc="command line utility to stream samples from RX888"
arch=('x86_64' 'aarch64')
url="https://github.com/rhgndf/rx888_stream"
license=('GPL3')
depends=('gcc-libs' 'libusb')
makedepends=('cargo' 'git')
provides=('rx888-stream')
conflicts=('rx888-stream')
source=(git+https://github.com/rhgndf/rx888_stream.git)
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
  cd "$_pkgname"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm 644 SDDC_FX3.img -t "$pkgdir/usr/share/$_pkgname"
}

# vim: ts=2 sw=2 et:

