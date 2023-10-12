# Maintainer: vxlerieuwu <vxlerieuwu@unixgirl.xyz>

pkgname=multiplex
pkgver=0.1.2
pkgrel=1
pkgdesc='Watch torrents with your friends.'
arch=('x86_64' 'aarch64')
url='https://github.com/pojntfx/multiplex'
license=('AGPL3')
depends=('gtk4>=4.10.3' 'gobject-introspection' 'libadwaita>=1.3.2' 'mpv')
makedepends=('git' 'go>=1.20.3')
source=("https://github.com/pojntfx/multiplex/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('5f311c2ebdd324856fce6c81f8733571abf8d175def9666fb177fa46dfbc482d0787fab98284c32ac8468f2ef16efc23530c4fcbfdcf71735953f95b70614570')

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
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/com.pojtinger.felicitas.Multiplex.metainfo.xml" "${pkgdir}/usr/share/metainfo/com.pojtinger.felicitas.Multiplex.metainfo.xml"
    for icon in 16x16 22x22 24x24 32x32 36x36 48x48 64x64 72x72 96x96 128x128 192x192 256x256 512x512; do install -D -m 0644 ${srcdir}/${pkgname}-${pkgver}/docs/icon-${icon}.png ${pkgdir}/usr/share/icons/hicolor/${icon}/apps/com.pojtinger.felicitas.Multiplex.png; done
}


