# Maintainer: fam007e <faisalmoshiur+gpg@gmail.com>
pkgname=rofi-chem
pkgver=2026.01.14
pkgrel=1
pkgdesc="Chemical Elements & Compounds Rofi Plugin"
arch=('x86_64' 'aarch64')
url="https://github.com/fam007e/rofi-chem"
license=('MIT')
depends=('rofi')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('cc0315ea69307eb45e4e10c453f10a9593fda71cb8d28fb249e12075654bfd7f')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir -p gopath
    export GOPATH="${srcdir}/gopath"
    go mod download -modcacherw
}

build() {
    cd "${pkgname}-${pkgver}"
    export GOPATH="${srcdir}/gopath"
    export GOENV=off

    # Added -buildmode=pie for security hardening
    go build -v \
        -buildmode=pie \
        -trimpath \
        -mod=readonly \
        -modcacherw \
        -ldflags="-linkmode=external" \
        -o "${pkgname}" cmd/rofi-chem/main.go
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
