# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=cloudflare-dynamic-dns
pkgver=4.1.0
pkgrel=1
pkgdesc='Updates AAAA records at Cloudflare according to the current IPv6 address'
url='https://github.com/zebradil/cloudflare-dynamic-dns'
arch=(any)
license=(MIT)
install=''
makedepends=(go)
provides=(cloudflare-dynamic-dns)
source=(cloudflare-dynamic-dns-4.1.0::https://github.com/zebradil/cloudflare-dynamic-dns/archive/4.1.0.tar.gz)
prepare () 
{ 
    cd "$pkgname-$pkgver" || exit 1;
    mkdir -p build/
}
build () 
{ 
    cd "$pkgname-$pkgver" || exit 1;
    export CGO_CPPFLAGS="${CPPFLAGS}";
    export CGO_CFLAGS="${CFLAGS}";
    export CGO_CXXFLAGS="${CXXFLAGS}";
    export CGO_LDFLAGS="${LDFLAGS}";
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw";
    go build -o build/$pkgname main.go
}
check () 
{ 
    cd "$pkgname-$pkgver" || exit 1;
    go test ./...
}
package () 
{ 
    set -eo pipefail;
    cd "$pkgname-$pkgver";
    BIN="build/$pkgname";
    install -Dm755 "$BIN" -t "$pkgdir/usr/bin";
    install -Dm644 systemd/* -t "$pkgdir/usr/lib/systemd/system";
    install -m700 -d "$pkgdir/etc/$pkgname/config.d"
}
sha256sums=('74358f0b1e8f90480149e7f04eec9d5c2f4622c1320bd477d2f289d4a187d825')
