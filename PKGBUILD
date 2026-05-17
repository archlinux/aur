# Maintainer: devome <evinedeng@hotmail.com>

pkgname="nginx-ui"
pkgver=2.3.11
_pkgver=${pkgver//_/-}
pkgrel=1
epoch=1
pkgdesc="Yet another WebUI for Nginx"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/0xJacky/${pkgname}"
backup=("etc/${pkgname}/config.ini")
license=("AGPL-3.0-or-later")
depends=("nginx")
makedepends=("pnpm" "go")
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('d07007820239c16f0a4603fa8e232b7191e1dfb6cedbb1d1f5b6a0daa81bf028')

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
        -ldflags="${ldflags}" \
        -o "${pkgname}" \
        ./main.go
    
    sed -E \
        -e "s|^(ExecStart=).+|\1/usr/bin/${pkgname} --config /etc/${pkgname}/config.ini|g" \
        -e "s|^(Documentation=).+|\1https://nginxui.com|g" \
        "resources/services/${pkgname}.service" > "${pkgname}.service"
}

package() {
    cd "${pkgname}-${_pkgver}"
    install -Dm755 "${pkgname}"         "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 app.example.ini      "${pkgdir}/etc/${pkgname}/config.ini"
    install -Dm644 {,resources/readme/}README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
