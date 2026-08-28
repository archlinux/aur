# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=tempo-cli
pkgver=3.0.3
pkgrel=1
pkgdesc='Command line tool for viewing and manipulating Grafana Tempo backend blocks'
arch=('x86_64' 'aarch64')
url='https://github.com/grafana/tempo'
license=('AGPL-3.0-only')
depends=('glibc')
makedepends=('go')
source=("tempo-v$pkgver.tar.gz::https://github.com/grafana/tempo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3aa84c97d3a8502848cc0e0cc3d0ef18886422842ba20e5bd157e7fe89ade02c')
options=(!lto)

build() {
    cd tempo-$pkgver

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -buildmode=pie \
        -trimpath \
        -mod=vendor \
        -modcacherw \
        -ldflags "-compressdwarf=false -linkmode external -extldflags '$LDFLAGS'" \
        ./cmd/$pkgname
}

check() {
    cd tempo-$pkgver
    ./$pkgname --help
}

package() {
    cd tempo-$pkgver
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
