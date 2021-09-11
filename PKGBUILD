# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=earthly
pkgver=0.5.22
pkgrel=1
pkgdesc='A build automation tool that executes in containers'
arch=('x86_64')
url='https://earthly.dev/'
license=('custom: BSL1.1')
depends=('docker')
makedepends=('go')
source=("https://github.com/earthly/earthly/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1f6ff14613ae64fd7f7cd19b62c63a0ee3502770f3f931a3e3b207f953b3f99f')

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
