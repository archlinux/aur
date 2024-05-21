# Maintainer: devome <evinedeng@hotmail.com>

pkgname="nginx-ui"
pkgver=2.0.0.beta.24
_pkgver=$(echo ${pkgver} | sed -E 's|\.([a-zA-Z]+)|-\1|g')
pkgrel=1
pkgdesc="Yet another WebUI for Nginx"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/0xJacky/${pkgname}"
backup=("etc/${pkgname}/config.ini")
license=("AGPL-3.0-or-later")
depends=("nginx")
makedepends=("npm" "go")
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz"
        "${pkgname}.service")
sha256sums=('73f1f5db269e0ea5d059e299e9e80ad9f1cce21672768d41356a4403d1c32ad2'
            'ff046cd729097a4c68c4f6d3d035125455457933fed18300c63072e9c55a8fdd')

build() {
    cd "${pkgname}-${_pkgver}"
    npm --prefix app install
    npm --prefix app run build

    go build \
        -trimpath \
        -ldflags="-s -w -extldflags '${LDFLAGS}'" \
        -o "${pkgname}" \
        -v \
        ./main.go
}

package() {
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    cd "${pkgname}-${_pkgver}"
    install -Dm755 "${pkgname}"    "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 app.example.ini "${pkgdir}/etc/${pkgname}/config.ini"
    install -Dm644 LICENSE         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 *.md         -t "${pkgdir}/usr/share/doc/${pkgname}"
}
