pkgname=linux-id
pkgver=0.2.0
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
sha256sums=('45586ab8c2e7b3eee994467e36ad52ce2922bbe34f9fa9fab7dc02e47eac8466'
            '74891b75cfbd8963c13369af16a11ee0fd997400051a84c3e525d5d4e56ab084'
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

    go build -ldflags "-compressdwarf=false -linkmode external -bindnow"
}

package() {
    depends+=(pinentry)

    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "../$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
    install -Dm644 "../$pkgname.rules" "$pkgdir/usr/lib/udev/rules.d/60-$pkgname-fido-tpm.rules"
}
