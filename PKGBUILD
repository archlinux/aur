# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=dstask
pkgver=0.20
pkgrel=1
pkgdesc="A personal task tracker designed to help you focus"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/naggie/dstask"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a2a79e534896f16094df1e16033f63f7399326f15d689c1b22d8ceb6d9547b40')

build() {
    cd $pkgname-$pkgver

    _commit=d687a0f9aec634a808cfa0df4aecb06ab4f57732

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=vendor \
        -modcacherw \
        -ldflags "-s -w
            -X \"github.com/naggie/dstask.GIT_COMMIT=$_commit\"
            -X \"github.com/naggie/dstask.VERSION=$pkgver\"
            -X \"github.com/naggie/dstask.BUILD_DATE=$(date -d@"$SOURCE_DATE_EPOCH" +%Y-%m-%dT%H:%M:%SZ)\"
            -extldflags $LDFLAGS" \
        cmd/dstask.go
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
