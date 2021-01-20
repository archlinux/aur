# Maintainer: Kars Mulder <devmail@karsmulder.nl>
pkgname=evsieve
pkgver=1.1.0
pkgrel=1
pkgdesc="A utility for mapping events from Linux event devices."
arch=("x86_64")
url="https://github.com/KarsMulder/$pkgname"
license=("GPL2" "MIT" "custom:HPND-sell-variant")
depends=("libevdev" "gcc-libs")
makedepends=("rust")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ed8a20bbc62566d097044369e6cafd2fdc87ede4ba38e76929d4836b7753ecb3')


prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --frozen --all-features --target-dir=target
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm 755 "target/release/$pkgname" -t "${pkgdir}/usr/bin"
    _pkg_license_dir="${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 "COPYING" -t "$_pkg_license_dir"
    install -Dm 644 "LICENSE" -t "$_pkg_license_dir"
    cp -R licenses "$_pkg_license_dir"
    find "$_pkg_license_dir" -type f -exec chmod 644 -- {} +
    find "$_pkg_license_dir" -type d -exec chmod 755 -- {} +
}
