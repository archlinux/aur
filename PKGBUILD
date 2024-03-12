# Maintainer: Evine Deng <evinedeng@hotmail.com>

pkgname="nginx-ui"
pkgver=2.0.0.beta.18
_pkgver=$(echo ${pkgver} | sed -E 's|\.([a-zA-Z]+)|-\1|')
pkgrel=1
pkgdesc="Yet another WebUI for Nginx"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/0xJacky/${pkgname}"
backup=("etc/${pkgname}/config.ini")
license=("AGPL3")
depends=("glibc" "nginx" "systemd")
makedepends=("npm" "go")
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz"
        "${pkgname}.service")
sha256sums=('03a9b30ee022e6904aeff1a14a9e3febe83d7081b784f528490ea1a43c39c60e'
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
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 app.example.ini "${pkgdir}/etc/${pkgname}/config.ini"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" *.md
}
