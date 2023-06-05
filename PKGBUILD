# Maintainer: Kars Mulder <devmail@karsmulder.nl>
pkgname=evsieve
pkgver=1.4.0
pkgrel=1
pkgdesc="A utility for mapping events from Linux event devices."
arch=("x86_64")
url="https://github.com/KarsMulder/$pkgname"
license=("GPL2" "MIT")
depends=("libevdev" "gcc-libs")
makedepends=("rust")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c667d1b60f887342653e5816b44b2848c260e44f8583f942fcc451272de4c3b0')


prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --frozen --target-dir=target
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
