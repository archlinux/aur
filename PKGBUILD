# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xdpdropper"
pkgver=0.0.2
pkgrel=3
pkgdesc="A network packet dropper API implemented on top of eBPF XDP"
url="https://github.com/renanqts/xdpdropper/"
license=("MIT")
arch=("x86_64" "aarch64" "armv7h")
makedepends=("go")
source=("xdpdropper.conf"
        "xdpdropper.service"
        "$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('039e7322ed8632d011dd43b7eef8a30f879cfd4d247125085c2387a4847e035639dc3dfa337134c9e04e365069a34191237d2633b557438b3474997818acace8'
        '4131f04593b74b058faa318b1cb0d3625de0aad23e3259dc7f172b9142c0f166c1188fec5299b2a085c06ed5f76b8adc846e01ac5d94e183af7310346146f302'
        'dbbc7cae90d5b046f0b7b52f78095ca96649220cb6ee6cbeb8372e2572eb814296509cd67c199ab8e8a5f2229c7b53d348cf2ae58097574c7a23a29d0ea7a4d2')
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
 install -D -m 600 "$srcdir/xdpdropper.conf" -t "$pkgdir/etc"
 install -D -m 644 "$srcdir/xdpdropper.service" -t "$pkgdir/usr/lib/systemd/system"
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
