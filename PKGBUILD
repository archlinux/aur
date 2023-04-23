# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=mmdbinspect
pkgver=0.1.1
pkgrel=1
pkgdesc="look up records for one or more IPs/networks in one or more .mmdb databases"
arch=(x86_64 aarch64 armv7h armv6h)
url="https://github.com/maxmind/mmdbinspect"
license=('Apache')
depends=(glibc)
makedepends=(go)
source=("https://github.com/maxmind/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('3e3e8c5a9d7bf256e1700323f968589f066a187d0ca29fad5fb811431de4874e1918841862ef3ea497b9c7c0b32da16c4e5c737a5399330cf655bec2e0de1998')

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
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o $pkgname \
    cmd/mmdbinspect/main.go
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 -t "$pkgdir"/usr/bin $pkgname
}
