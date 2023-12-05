# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
pkgname=fscan
pkgver=1.8.3.build3
_pkgver=1.8.3-build3
pkgrel=1
pkgdesc="An intranet comprehensive scanning tool"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/shadow1ng/fscan"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/$_pkgver.tar.gz")
sha256sums=('ae9dced28b9d06897e285d68c5ac9627a41578532896f355682d086b09e20457')

prepare() {
    cd "$pkgname-$_pkgver"
    mkdir -p build/
}

build() {
    cd "$pkgname-$_pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build .
}

check() {
    cd "$pkgname-$_pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$_pkgver"
    install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" *.md
}
