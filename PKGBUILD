# Maintainer: devome <evinedeng@hotmail.com>

pkgname="taierspeed-cli"
pkgver=1.7.2
pkgrel=1
pkgdesc="TaierSpeed CLI"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/ztelliot/${pkgname}"
provides=("${pkgname}" "${pkgname%-*}")
conflicts=("${pkgname}" "${pkgname%-*}")
license=("LGPL-3.0-or-later")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2691e7c2ef38d597f66f244462080fb81bf93fda5ff94bbc3fe14a4b5a1f8856')

build() {
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    cd "${pkgname}-${pkgver}"
    local ldflags="
        -w -s \
        -X \"${url/https:\/\//}/defs.ProgName=${pkgname}\" \
        -X \"${url/https:\/\//}/defs.ProgVersion=${pkgver}\" \
        -X \"${url/https:\/\//}/defs.BuildDate=$(date -u "+%Y-%m-%d %H:%M:%S %Z")\" \
        -extldflags '${LDFLAGS}'
    "
    go build -o "${pkgname}" -ldflags "${ldflags}" -trimpath main.go
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    ln -s          "${pkgname}" "${pkgdir}/usr/bin/${pkgname%-*}"
}
