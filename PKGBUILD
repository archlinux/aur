# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=mastotool
pkgver=0.2.3
pkgrel=1
pkgdesc="A collection of tools to work with your Mastodon account"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/muesli/mastotool"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cd9c8d65c6e69cf0b559c8925512c139b37970c2cd814645c21fe6d8423f7842')

prepare() {
    export GOPATH="$srcdir/gopath"
    go clean -modcache
}

build() {
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-X main.Version=$pkgver -linkmode external -extldflags \"${LDFLAGS}\"" \
        -o "$pkgname" .

    go clean -modcache
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
