# Maintainer: Bart Libert <bart plus aur at libert dot email>
pkgname=swaycons
pkgver=0.3.1
pkgrel=2
pkgdesc="Window Icons in Sway with Nerd Fonts"
arch=(x86_64)
url="https://github.com/allie-wake-up/swaycons"
license=('MIT')
depends=('sway' 'ttf-font-nerd' 'gcc-libs' 'glibc')
makedepends=(cargo)
provides=(swaycons)
source=("$pkgname-$pkgver.tar.gz::https://github.com/allie-wake-up/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7693cbd5c06db25de3f67d3782089f9baade4b50d7312ed5cb93171e8f6a22d0')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}"
}
