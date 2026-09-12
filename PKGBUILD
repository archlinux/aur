# Maintainer: bipin kumar <kbipinkumar@pm.me>
pkgbase=chopper
pkgname=('chopper' 'chopper-docs')
pkgver=0.14.0
pkgrel=3
pkgdesc='Rust implementation of NanoFilt+NanoLyse intended for long read sequencing'
arch=(x86_64)
makedepends=('git' 'rust' 'cmake')
url='https://github.com/wdecoster/chopper'
license=('MIT')
options=(!lto)
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/wdecoster/chopper/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('b309abcac6ac0472c53ab9fff0a695b50204c21a4d22c7de18e64a93c8f7a5a3474ed8c345175a89cd6173c1dac947dd1378e24d63ab3991300a3806f3866544')

prepare() {
    cd ${pkgbase}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch  --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ${pkgbase}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
    cargo doc --frozen --no-deps --all-features
}

check() {
    cd ${pkgbase}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package_chopper() {
    depends=('gcc-libs' 'glibc' 'zlib' 'xz')
    optdepends=('chopper-docs: HTML documentation')
    
    cd ${pkgbase}-${pkgver}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgbase}"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgbase}"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgbase}"
}

package_chopper-docs() {
    pkgdesc="Documentation for ${pkgbase}"
    arch=('any')
    
    cd ${pkgbase}-${pkgver}
    install -d "$pkgdir/usr/share/doc/${pkgbase}"
    cp -a target/doc "$pkgdir/usr/share/doc/${pkgbase}/html"
    rm -f "$pkgdir/usr/share/doc/${pkgbase}/html/.lock"
    
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
}
