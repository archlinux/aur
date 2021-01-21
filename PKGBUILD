# Maintainer: Andreas Kurth <archlinux@akurth.net>
pkgname='bender'
pkgver=0.22.0
pkgrel=1
pkgdesc="Dependency management tool for hardware design projects"
arch=('x86_64')
url="https://github.com/fabianschuiki/${pkgname}"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        0001-tests-iss5-Determine-name-of-default-branch.patch)
sha512sums=('efbaba2e9f58c0ae6cc6747e3d3a2cca4b64c2f48e0a46036e3ce3677df73fc10f16ea90221530e0c732040f509d74233bfb46ff1379316f6ba134a545eb355e'
            'bd103927b68e0da0feb4bbe043181020699f7bbdc419fda5a51410f7d9eae45255a70580779a9194efffe416f34056d3656fce8201a9ae196a83d71e2b7aa48a')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    patch -Np1 -i ../0001-tests-iss5-Determine-name-of-default-branch.patch
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cargo test --release --locked --target-dir=target
    tests/run_all.sh
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
