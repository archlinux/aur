# Maintainer: devome <evinedeng@hotmail.com>

pkgname="cups-web"
pkgver=0.1.9
pkgrel=1
pkgdesc="Web printing management interface for CUPS"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64' 'loong64')
url="https://github.com/hanxi/${pkgname}"
license=("MIT")
backup=("etc/conf.d/${pkgname}")
install="${pkgname}.install"
depends=("cups" "fontconfig" "ghostscript")
makedepends=("npm" "go")
optdepends=("libreoffice: for document (.doc .docx .xls .xlsx .ppt .pptx) conversion"
            "ofdrw: for OFD file (.ofd) conversion"
            "noto-fonts: for general character support"
            "noto-fonts-cjk: for CJK (Chinese Japanese Korean) character support")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.env"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('5fc2a30c833d2dc9ef5b06d29ecdf5952a3049de596822a98f6368dfd71a5739'
            '23f92510f45cabe57fbac3349b8a426085299e045d71e5e79348a2f3a59bd098'
            'd0c92ec21b32c0d226f96696d078f369fecee493d2a351d11176014194da05c2'
            '1b448e0b4d6a8d13edbe2f9a051b1392beba42d6773b5da7cf7b260470695548'
            'b17fd1e47cfa27481eb31b526065b424dd30ddc2b57a9e9617d92fdf8c9316c7')

prepare() {
    cd "${pkgname}-${pkgver}"
    go mod tidy
    npm --prefix frontend install
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
    install -Dm644 "${pkgname}.env"      "${pkgdir}/etc/conf.d/${pkgname}"
    install -Dm644 "${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}"          "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "README.md"           "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE"             "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
