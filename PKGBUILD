# Maintainer: vxlerieuwu <vxlerieuwu@unixgirl.xyz>

pkgname=multiplex
pkgver=0.1.5
pkgrel=1
pkgdesc='Watch torrents with your friends.'
arch=('x86_64' 'aarch64')
url='https://github.com/pojntfx/multiplex'
license=('AGPL3')
depends=('gtk4>=4.10.3' 'gobject-introspection' 'libadwaita>=1.3.2' 'mpv')
makedepends=('git' 'go>=1.20.3' 'blueprint-compiler>=0.12.0')
source=("https://github.com/pojntfx/multiplex/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('424e3e4b8c2de964141fa8f01cb3d40ee09953994d48bc722be2731635ac87be3ea8e55b0acfffb97981a5da285d807ac75ad5e2084fbe1ac1845c1989205f55')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build
    go generate ./...
}

build() {
    cd "${pkgname}-${pkgver}"
    # https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}/go"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build
}

package() {
    cd "${pkgname}-${pkgver}/build"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/com.pojtinger.felicitas.Multiplex.desktop" "${pkgdir}/usr/share/applications/com.pojtinger.felicitas.Multiplex.desktop"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/internal/resources/com.pojtinger.felicitas.Multiplex.metainfo.xml" "${pkgdir}/usr/share/metainfo/com.pojtinger.felicitas.Multiplex.metainfo.xml"
    for icon in 16x16 22x22 24x24 32x32 36x36 48x48 64x64 72x72 96x96 128x128 192x192 256x256 512x512; do install -D -m 0644 ${srcdir}/${pkgname}-${pkgver}/docs/icon-${icon}.png ${pkgdir}/usr/share/icons/hicolor/${icon}/apps/com.pojtinger.felicitas.Multiplex.png; done
}


