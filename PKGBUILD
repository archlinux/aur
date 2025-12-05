# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Qichen Liu [@qichenliu]

pkgname=asciit
pkgver=1.0.3
pkgrel=1
pkgdesc="A more compact and intuitive ASCII table highlighting digits and letters"
arch=('x86_64')
url="https://github.com/Q1CHENL/asciit"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Q1CHENL/asciit/archive/refs/tags/v${pkgver}.tar.gz")
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
sha256sums=('841c5a2eb6c7cb0cfbb6d6603db1951e7b03cd28d9d3169c4dfb196178539fd9')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --frozen
}

check() {
    cd "${pkgname}-${pkgver}"
    target/release/asciit 'Test' > actual.txt
    if ! grep -qE '54.+65.+73.+74' actual.txt; then
        printf >&2 '%s\n' 'Unexpected test output:' '==='
        cat >&2 actual.txt
        printf >&2 '\n%s\n' '==='
        exit 1
    fi
}

package() {
    cd "${pkgname}-${pkgver}"

    echo >&2 'Packaging the executable'
    install -D -m 755 -t "${pkgdir}/usr/bin" \
        target/release/asciit

    echo >&2 'Packaging the documentation'
    install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
        README.md

    echo >&2 'Packaging the license'
    install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
        LICENSE
}
