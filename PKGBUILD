# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=cloudflare-dynamic-dns
pkgver=4.3.14
pkgrel=1
pkgdesc='Updates AAAA records at Cloudflare according to the current IPv6 address'
url='https://github.com/zebradil/cloudflare-dynamic-dns'
arch=(any)
license=(MIT)
install=''
makedepends=(go)
provides=(cloudflare-dynamic-dns)
source=(cloudflare-dynamic-dns-4.3.14::https://github.com/zebradil/cloudflare-dynamic-dns/archive/4.3.14.tar.gz)
prepare () 
{ 
    cd "$pkgname-$pkgver" || exit 1;
    mkdir -p build/
}
build () 
{ 
    cd "$pkgname-$pkgver" || exit 1;
    export CGO_ENABLED=0;
    go build -buildmode=pie -trimpath -ldflags=-linkmode=external -ldflags="-X=main.version=$pkgver -X=main.commit=$pkgver -X=main.date=$(date -Iseconds)" -mod=readonly -modcacherw -o build/$pkgname main.go
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
sha256sums=('d86e82c11d4a7fba0aa0832df8bafff39bd3ff4cea4f49a6a1ff9e6fb8cb9698')
