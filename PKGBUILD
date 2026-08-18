# Maintainer: kekmacska

pkgname=cargonaut-git
pkgver=0.2.0.r0.g6dd9912
pkgrel=1
pkgdesc="Rust-native, terminal, keyboard-first dual-pane file manager — Norton Commander & Midnight Commander reimagined for 2026"
arch=('any')
url="https://github.com/mohnkhan/cargonaut"
license=('Apache-2.0' 'MIT')
depends=('xz')
makedepends=('rust')
source=('git+https://github.com/mohnkhan/cargonaut.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
    cd "${pkgname%-*}"

    export RUSTFLAGS="\
        -C opt-level=3 \
        -C target-cpu=native \
        -C embed-bitcode=yes \
        -C codegen-units=1 \
        -C strip=symbols \
        -C relocation-model=pic \
        -C link-arg=-fuse-ld=lld \
        -C link-arg=-Wl,--icf=safe \
        -C link-arg=-Wl,--gc-sections \
        -C link-arg=-Wl,--as-needed \
        -C link-arg=-Wl,-O3 \
  "

  cargo build --release
}

package() {
    cd "$srcdir/${pkgname%-*}"

    install -Dm755 "target/release/${pkgname%-*}" "$pkgdir/usr/bin/${pkgname%-*}"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
