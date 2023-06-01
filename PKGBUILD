pkgname=meg
pkgver=0.3.0
pkgrel=1
pkgdesc="Fetch many paths for many hosts - without killing the hosts"
arch=(any)
url="https://github.com/tomnomnom/meg"
license=(MIT)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=("9cf649e32d648de3f6c118d567452a29a083cd7e8e87e68cbd353aebfd66cc5712bcd986056d599de93c3ff37c86f0151085b4c986f5a3f51aa03e9e26df1b18")

prepare() {
    cd $pkgname-$pkgver
    mkdir -p build/
}

build() {
    cd $pkgname-$pkgver
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./...
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 build/$pkgname -t "$pkgdir/usr/bin/"
    install -Dm644 README.mkd "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CONTRIBUTING.mkd "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
