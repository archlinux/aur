# Maintainer: devome <evinedeng@hotmail.com>

pkgname="cups-web"
pkgver=0.2.15
pkgrel=2
pkgdesc="Web printing management interface for CUPS"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64' 'loong64')
url="https://github.com/hanxi/${pkgname}"
license=("MIT")
backup=("etc/conf.d/${pkgname}")
install="${pkgname}.install"
makedepends=("npm" "go")
optdepends=("avahi: for airprinter service"
            "libreoffice: for document (.doc .docx .xls .xlsx .ppt .pptx) conversion"
            "ofdrw: for OFD file (.ofd) conversion"
            "noto-fonts: for general character support"
            "noto-fonts-cjk: for CJK (Chinese Japanese Korean) character support")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.env"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('78e31351c0826c0143cdd51782cb06c9a9880135dba67ac01d691d6cb1f1ee82'
            '0c81a30afeb1f19a0616f783e77684fb24372c3e2221b82fb97348db68895e60'
            'c2a4dca8de0bf1ec14a4aeae1c1430e764ebec47faeb20a661cbce58678a9cd2'
            '1b448e0b4d6a8d13edbe2f9a051b1392beba42d6773b5da7cf7b260470695548'
            'efe697300c7cdcd977341cf48d6c5c8a934055b406de001a98234c133495dda6')

prepare() {
    cd "${pkgname}-${pkgver}"
    go mod tidy
    npm --prefix frontend ci --no-audit --no-fund --prefer-offline --allow-remote=all
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "${pkgname}-${pkgver}"
    npm --prefix frontend run build
    go build -ldflags="-s -w -X main.Version=${pkgver}" -o "${pkgname}" ./cmd/server
}

package() {
    depends=("cups" "fontconfig" "ghostscript")
    
    install -Dm644 "${pkgname}.env"      "${pkgdir}/etc/conf.d/${pkgname}"
    install -Dm644 "${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}"          "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "README.md"           "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE"             "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
