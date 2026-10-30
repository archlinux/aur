# Maintainer: bipin kumar <kbipinkumar@pm.me>
pkgbase=chopper
pkgname=('chopper' 'chopper-docs')
pkgver=0.15.0
pkgrel=1
pkgdesc='Rust implementation of NanoFilt+NanoLyse intended for long read sequencing'
arch=(x86_64)
makedepends=('git' 'rust' 'cmake')
url='https://github.com/wdecoster/chopper'
license=('MIT')
options=(!lto)
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/wdecoster/chopper/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('be615dc1ad63071cb7748b01b7ba7309380042ecbcc9be98126659cc8973f63d937b5a76b9d092d4ed0ccc61712b396cd9bbc1998ee6840984a6d0c0f3d31f3c')

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
