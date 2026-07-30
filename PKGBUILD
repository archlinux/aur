# Maintainer: Maxi Barmetler <maxi.barmetler@gmail.com>

pkgname=falsec
pkgver=0.1.9
pkgrel=1
pkgdesc='Interpreter and compiler for the FALSE language'
url='https://github.com/MixusMinimax/falsec'
license=(MIT)
makedepends=('cargo')
depends=('gcc-libs' 'glibc' 'nasm' 'binutils')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MixusMinimax/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('fd1c07218c1abf4d9b7f47f3bc91b7376f9df334f4f7ec678e4052e5fc5421d1314957ba02d66f65cbd0a558e04abdd900b39d9cfa6dd07b83722339b65c2ec2')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 THIRD_PARTY_LICENSES "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_LICENSES"
    install -Dm644 completion/falsec.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 completion/falsec.elv "${pkgdir}/usr/share/elvish/lib/${pkgname}.elv"
    install -Dm644 completion/falsec.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    install -Dm644 completion/falsec.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
