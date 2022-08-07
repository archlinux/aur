# Maintainer: Mik Mueller <imse335@gmail.com>
pkgname=smarthome-cli
pkgver=2.13.0
pkgrel=1
pkgdesc="Terminal client for the smarthome-go/smarthome server."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/smarthome-go/cli"
license=('GPL2')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/smarthome-go/cli/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('1b057e703372ed74a438fd891bf4af2869522b50156b72da6c64d4561f5e8bd254513615db75a6555445c758384f6c11418600d1c99c491ae3d425b462e10530')

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
