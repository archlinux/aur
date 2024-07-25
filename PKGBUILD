# Maintainer: devome <evinedeng@hotmail.com>

pkgname="nginx-ui"
pkgver=2.0.0_beta.28
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Yet another WebUI for Nginx"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/0xJacky/${pkgname}"
backup=("etc/${pkgname}/config.ini")
license=("AGPL-3.0-or-later")
depends=("nginx")
makedepends=("pnpm" "go")
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz"
        "${pkgname}.service")
sha256sums=('378e8c9a9de020e4090ae1f29a46f958f6573c1f734c71b890e48ef6ffe9380c'
            'ff046cd729097a4c68c4f6d3d035125455457933fed18300c63072e9c55a8fdd')

build() {
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    cd "${pkgname}-${_pkgver}"
    pnpm --prefix app install
    pnpm --prefix app build

    local ldflags="
        -s -w \
        -extldflags '${LDFLAGS}' \
        -X 'github.com/0xJacky/Nginx-UI/settings.buildTime=$(date +%s)'
    "

    go build \
        -trimpath \
        -tags jsoniter \
        -ldflags="-s -w -extldflags '${LDFLAGS}'" \
        -o "${pkgname}" \
        ./main.go
}

package() {
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    cd "${pkgname}-${_pkgver}"
    install -Dm755 "${pkgname}"    "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 app.example.ini "${pkgdir}/etc/${pkgname}/config.ini"
    install -Dm644 *.md         -t "${pkgdir}/usr/share/doc/${pkgname}"
}
