# Maintainer: Mik Mueller <imse335@gmail.com>
pkgname=smarthome-cli
pkgver=2.14.0
pkgrel=1
pkgdesc="Terminal client for the smarthome-go/smarthome server."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/smarthome-go/cli"
license=('GPL2')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/smarthome-go/cli/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7d2900a22dcc75a615128228591fe97ad631c940833b463a953f7d440c54389b68664855c9c7a730acc656d3d16bc538ae96e89d6ee24d33239bee5925953fb3')

prepare() {
    cd "$srcdir/cli-$pkgver"
    go mod tidy
    mkdir -p build/
}

build() {
    cd "$srcdir/cli-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build \
        -v \
        -o build/smarthome-cli \
        .
}

package() {
    cd "$srcdir/cli-$pkgver"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
