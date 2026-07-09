# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=tempo-cli
pkgver=3.0.2
pkgrel=1
pkgdesc='Command line tool for viewing and manipulating Grafana Tempo backend blocks'
arch=('x86_64' 'aarch64')
url='https://github.com/grafana/tempo'
license=('AGPL-3.0-only')
depends=('glibc')
makedepends=('go')
source=("tempo-v$pkgver.tar.gz::https://github.com/grafana/tempo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9da6e1c411694d1010bb7641ab55e365095bc85fd76d02e142ede0fa2162cf71')
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
