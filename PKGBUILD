# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
pkgname=fscan
pkgver=1.8.2
pkgrel=2
pkgdesc="An intranet comprehensive scanning tool"
arch=('x86_64' 'aarch64')
url="https://github.com/shadow1ng/fscan"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=()
options=()
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/$pkgver.tar.gz")
sha256sums=('e62776ec36636619b74f096597458d372fb28b05e398589eecef18f891428e5f')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p build/
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build .
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" *.md
}
