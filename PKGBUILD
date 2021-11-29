# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=earthly
pkgver=0.6.0
pkgrel=1
pkgdesc='A build automation tool that executes in containers'
arch=('x86_64')
url='https://earthly.dev/'
license=('custom: BSL1.1')
depends=('docker')
makedepends=('go')
BUILDENV+=('!check')
source=("https://github.com/earthly/earthly/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5fcf254e3e88b99f4fb937e74dbb5c88b68c077b33c00f7c32bd773edc4a1bf2')

prepare() {
    mkdir -p "earthly-${pkgver}/build"
}

build() {
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
    cd "earthly-${pkgver}"
    go build -o build ./cmd/...
}

check() {
    cd "earthly-${pkgver}"
    go test ./...
}

package() {
    install -D -m755 "earthly-${pkgver}/build/earthly" -t "${pkgdir}/usr/bin"
    install -D -m644 "earthly-${pkgver}/licenses/BSL" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
