# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=rbxcloud
pkgver=0.17.0
pkgrel=1
pkgdesc='Easily communicate with the Roblox Open Cloud APIs'
url='https://github.com/Sleitnick/rbxcloud'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'clang')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d00fbd78d1fd3bcd8c6f4cd716d43f8c8994de4acbeb4196670c3347c59e88f9')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CC=clang
    export CXX=clang++
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
