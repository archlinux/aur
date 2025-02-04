# Maintainer: devome <evinedeng@hotmail.com>

pkgname=hub-tool
pkgver=0.4.6
pkgrel=1
pkgdesc="Docker Hub experimental CLI tool"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/docker/${pkgname}"
license=("Apache-2.0")
makedepends=("go" "unzip")
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('ae9ce9b932f5d61cdf2788f70319b15911dceadfd4c44eada7d817ea6f6784da')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    local commit=$(unzip -qz "${pkgname}-${pkgver}.zip" | cut -c1-7)
    local ldflags="
        -s -w \
        -X '${url//https:\/\//}/internal.GitCommit=${commit}' \
        -X '${url//https:\/\//}/internal.Version=${pkgver}' \
        -extldflags '${LDFLAGS}'
    "

    cd "${pkgname}-${pkgver}"
    go build -trimpath -ldflags="${ldflags}"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
