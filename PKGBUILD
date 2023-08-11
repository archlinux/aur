# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xdpdropper"
pkgver=0.0.2
pkgrel=2
pkgdesc="A network packet dropper API implemented on top of eBPF XDP"
url="https://github.com/renanqts/xdpdropper/"
license=("MIT")
arch=("x86_64" "aarch64" "armv7h")
makedepends=("go")
source=("xdpdropper.conf"
        "xdpdropper.service"
        "$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5b58a848c64ffbaf1db19b0901c0e9449d551bf2ceeb522ae2e392e0e63c4427'
            '0b79b540d7ad518495b6d1d00a89d480fc28b393381ab1e6cea61c1da3894314'
            '53370ff98190c66a1c0da3c998fb16aecbda64485cb2d436433135b03549fe0f')
backup=("etc/xdpdropper.conf")

build(){
 cd "$pkgname-$pkgver"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 go build -o "xdpdropper" ./cmd/...
}

package(){
 cd "$pkgname-$pkgver"
 install -D -m 755 "xdpdropper" "$pkgdir/usr/bin/xdpdropper"
 install -D -m 644 "$srcdir/xdpdropper.conf" -t "$pkgdir/etc"
 install -D -m 644 "$srcdir/xdpdropper.service" -t "$pkgdir/usr/lib/systemd/system"
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
