# Maintainer: sc0ttfr33 <sc0ttfr33 at hotmail dot com>

pkgname=cbxv-git
pkgver=0.4.1.r0.g0c53c74
pkgrel=1
pkgdesc='The high fidelity comic book viewer'
arch=('x86_64')
url='https://github.com/mftb0/cbxv'
license=('MIT')
depends=('libunarr')
makedepends=('git' 'go' 'gtk3')
provides=('cbxv')
conflicts=('cbxv')
source=("${pkgname}::git+${url}")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o out/cbxv ./cmd/cbxv/*.go
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
    install -Dm755 "${srcdir}/${pkgname}"/out/cbxv "${pkgdir}"/usr/bin/cbxv
    install -Dm644 "${srcdir}/${pkgname}"/build/assets/lin/wtf.swbd.cbxv.desktop "${pkgdir}"/usr/share/applications/cbxv.desktop
    install -Dm644 "${srcdir}/${pkgname}"/build/assets/lin/logo_cbxv.png "${pkgdir}"/usr/share/icons/hicolor/1024x1024/apps/logo_cbxv.png
}

