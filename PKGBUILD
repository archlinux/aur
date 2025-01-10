# Maintainer: Jonas Karlsson <jonaskarlsson at fripost dot org>

pkgname=thinkfan-tui
pkgver=0.1.1
pkgrel=1
pkgdesc="A terminal-based Linux application for fan control and temperature monitoring on ThinkPad laptops."
url="https://github.com/karjonas/thinkfan-tui"
license=('MIT')
makedepends=('cargo')
depends=('polkit' 'lm_sensors')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("git+$url#tag=$pkgver")
sha256sums=('16aea65dca1478802c95b28a6e1e7fa11d4f140e26c0c76f094773520eb0eaaf')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --offline --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}