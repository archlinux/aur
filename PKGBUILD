# Maintainer: Mik Mueller <imse335@gmail.com>
pkgname=smarthome-cli
pkgver=2.7.2
pkgrel=1
pkgdesc="Terminal client for the smarthome-go/smarthome server."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/smarthome-go/cli"
license=('GPL2')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/smarthome-go/cli/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('e76698c4964c2c31c90a5e512f14691d29c2adc570911a1b282d05db391568420b881dbf40508e7ca8ce4487a7db8feb4aa12cd9bb09a0f5d0da010640698e44')

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
