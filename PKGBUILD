pkgname=linux-id
pkgver=0.1.6
pkgrel=1
pkgdesc="FIDO token implementation for Linux that protects the token keys using your system's TPM."
arch=(x86_64)
url=https://github.com/matejsmycka/linux-id
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::https://github.com/matejsmycka/linux-id/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.rules")
sha256sums=('f9650331e7b790f41b2bd3be87de830c2aaae620368ef8038d48f701ef8ada67'
            'e59c7a03fb6b7ac535dd1844dd298fbd6946464b98e6da6653a8a804526eeeb2'
            '8a42f5924b06effb0620714db1313b385f821db0f324982e11ebd28feca9f1dd')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir"
    go mod download -modcacherw
}

build() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

    go build -ldflags "-compressdwarf=false -linkmode external"
}

package() {
    depends+=(pinentry)

    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "../$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
    install -Dm644 "../$pkgname.rules" "$pkgdir/usr/lib/udev/rules.d/60-$pkgname-fido-tpm.rules"
}
