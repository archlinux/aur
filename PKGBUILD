# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=bbcli
pkgver=0.6.0
pkgrel=1
pkgdesc="inoffical Bitbucket.org command line tool"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/craftamap/bb"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a89e149aa713d90f3dab676dcf9b12240b0cb08070fcc289fd7005b9b4feb272')

prepare() {
    export GOPATH="$srcdir/gopath"
    export GO111MODULE=on

    go clean -modcache
}

build() {
    cd "${pkgname%cli}-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-X github.com/craftamap/bb/cmd.Version=$pkgver -linkmode external -extldflags \"${LDFLAGS}\"" \
        -o "${pkgname%cli}" .

    go clean -modcache
}

package() {
    cd "${pkgname%cli}-$pkgver"

    install -Dm755 "${pkgname%cli}" "$pkgdir/usr/bin/${pkgname%cli}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
