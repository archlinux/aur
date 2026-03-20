# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=aether
pkgver=4.0.0
pkgrel=1
pkgdesc='Desktop theming application - extract colors from wallpapers and apply cohesive themes'
arch=('x86_64')
url='https://github.com/bjarneo/aether'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
makedepends=('go' 'nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bjarneo/aether/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b641976451127bedd2793d1366b29ce35cda8fc2f7bc129ea59c386560933777')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export GOPATH="${srcdir}/gopath"
    export PATH="${GOPATH}/bin:${PATH}"

    go install github.com/wailsapp/wails/v2/cmd/wails@v2.11.0

    wails build -tags webkit2_41
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 build/bin/aether "${pkgdir}/usr/bin/aether"
    install -Dm644 build/linux/aether.desktop "${pkgdir}/usr/share/applications/aether.desktop"
    install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/aether.png"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
