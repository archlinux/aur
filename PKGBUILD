# Maintainer: Mik Mueller <imse335@gmail.com>
pkgname=smarthome-cli
pkgver=2.7.0
pkgrel=2
pkgdesc="Terminal client for the smarthome-go/smarthome server."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/smarthome-go/cli"
license=('GPL2')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/smarthome-go/cli/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('9582313ec5890ed6db0a974039fb671c96272ed39b52610ed1f547a0e6927a13717c401c5803efb15e4f8a8cce63b0f70348214123f4850a0291174dcad57542')

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
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-w -s -linkmode external -extldflags \"-static -Wl,-z,now,-z,relro ${LDFLAGS}\"" \
        -v \
        -o build/smarthome-cli \
        .
}

package() {
    cd "$srcdir/cli-$pkgver"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
