# Maintainer: RokyBeast <sajid.shaik1186@gmail.com>
pkgname=femboysay
pkgver=1.0.0
pkgrel=2
pkgdesc="Cowsay boring? Try out this alternative"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/rokybeast/femboysay"
license=('WTFPL')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rokybeast/femboysay/archive/v$pkgver.tar.gz")
sha256sums=('81a67f65113f77f3193f727ddc3c55a581357a0c27b7fe650b6f317a88503296')

build() {
    # Use variable instead of hardcoded 1.0.0
    cd "$srcdir/$pkgname-$pkgver"
    
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    go build -o femboysay main.go
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 femboysay "$pkgdir/usr/bin/femboysay"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
