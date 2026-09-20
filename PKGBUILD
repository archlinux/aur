# Maintainer: devome <evinedeng@hotmail.com>

pkgname="nginx-ui"
pkgver=2.6.2
_pkgver=${pkgver//_/-}
pkgrel=1
epoch=1
pkgdesc="Yet another WebUI for Nginx"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/0xJacky/${pkgname}"
backup=("etc/${pkgname}/config.ini")
license=("AGPL-3.0-or-later")
makedepends=("bun" "go")
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('55eb6f50a2676fb8d335d796a6420ccb4fb4d988d3fa0b281417d8e76786f42b')

build() {
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    cd "${pkgname}-${_pkgver}"
    bun --cwd=app install
    bun --cwd=app run build

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
    depends=("nginx")
    
    cd "${pkgname}-${_pkgver}"
    install -Dm755 "${pkgname}"         "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 app.example.ini      "${pkgdir}/etc/${pkgname}/config.ini"
    install -Dm644 {,resources/readme/}README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
