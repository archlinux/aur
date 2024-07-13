# Maintainer: devome <evinedeng@hotmail.com>

pkgname="taierspeed-cli"
pkgver=1.7.1
pkgrel=1
pkgdesc="TaierSpeed CLI"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/ztelliot/${pkgname}"
provides=("${pkgname}" "${pkgname%-*}")
conflicts=("${pkgname}" "${pkgname%-*}")
license=("LGPL-3.0-or-later")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ef27f15111d9559a637d86fd73f107908b10120b86c81e69a9ff203ce073f711')

build() {
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    cd "${pkgname}-${pkgver}"
    local ldflags="
        -w -s \
        -X \"${url/https:\/\//}/defs.ProgName=${pkgname}\" \
        -X \"${url/https:\/\//}/defs.ProgVersion=${pkgver}\" \
        -X \"${url/https:\/\//}/defs.BuildDate=$(date -u "+%Y-%m-%d %H:%M:%S %Z")\"
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
