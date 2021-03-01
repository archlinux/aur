# Maintainer: Andreas Kurth <archlinux@akurth.net>
pkgname='bender'
pkgver=0.22.0
pkgrel=3
pkgdesc="Dependency management tool for hardware design projects"
arch=('x86_64')
url="https://github.com/pulp-platform/${pkgname}"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        0001-tests-iss5-Determine-name-of-default-branch.patch)
sha512sums=('efbaba2e9f58c0ae6cc6747e3d3a2cca4b64c2f48e0a46036e3ce3677df73fc10f16ea90221530e0c732040f509d74233bfb46ff1379316f6ba134a545eb355e'
            'ed7b0860391af36fd41c8603535c0cafaf42325b905eaed650a0743740aa8b050a174591c147343d68da71b9e73be1cbb7fcf7c52738027396d6dca33d979fcc')

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
