# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=cloudflare-dynamic-dns
pkgver=2.3.1
pkgrel=4
pkgdesc="Updates AAAA records at Cloudflare according to the current IPv6 address"
url="https://github.com/Zebradil/cloudflare-dynamic-dns"
arch=(any)
license=(MIT)
groups=()
backup=()
depends=()
makedepends=(go)
checkdepends=()
optdepends=()
conflicts=()
provides=()
replaces=()
source=(cloudflare-dynamic-dns-2.3.1::https://github.com/zebradil/cloudflare-dynamic-dns/archive/2.3.1.tar.gz)
sha256sums=('08dff99a91805ad521bd652795eba03ac2e7ec128b9395b4f49eb41282d77221')
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
    cd "$pkgname-$pkgver" || exit 1;
    BIN=$pkgname;
    install -Dm755 ./$BIN -t "$pkgdir/usr/bin";
    install -Dm644 systemd/* -t "$pkgdir/usr/lib/systemd/system";
    install -m700 -d "$pkgdir/etc/$pkgname/config.d";
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    ./$BIN completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$BIN";
    ./$BIN completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$BIN.fish";
    ./$BIN completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$BIN"
}
