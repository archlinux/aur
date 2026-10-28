# Contributor: ISSOtm <arch@eldred.fr>

pkgname=linux-id
pkgver=0.2.4
pkgrel=2
pkgdesc="FIDO token implementation for Linux that protects the token keys using your system's TPM."
arch=(x86_64)
url=https://github.com/matejsmycka/linux-id
license=(MIT)
depends=(glibc)
makedepends=(go)
optdepends=('fprintd: Use fingerprint for authentication')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/matejsmycka/linux-id/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.rules"
        "$pkgname-uhid.conf")
sha256sums=('fc23f48778899d06174107e037c21999b7f668cf9ed248c863133f4a259bbf34'
            'a5c21c13e02612996486089c1c88533a894b0983c0afd45cf0ce7d7f4f59f2be'
            '8a42f5924b06effb0620714db1313b385f821db0f324982e11ebd28feca9f1dd'
            '0d328038322f62ff1f3319666df5f8f58c0a028415a917ad247b0446c1ff90f5')

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
    install -Dm644 "../$pkgname-uhid.conf" "$pkgdir/usr/lib/modules-load.d/$pkgname-uhid.conf"
}
