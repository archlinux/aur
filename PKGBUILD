# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="hatch"
pkgver=0.5.0
pkgrel=1
pkgdesc="Arrow-Powered DuckDB Flight Server"
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/TFMV/$pkgname"
license=("MIT")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/TFMV/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
b2sums=('0d69bc77b114a393e9d76deac3aecc270b15096451a14d9dfc15c3c4a8806cf5b215c77c5534509171ed68b6319918337b556cb03aff5b4bc225b3e9000f2860'
        '16c501f45bdfed16525aa680c91b0cad2c51958ca1ab99fd98b9b2a79ae724a9b8ec809d85e121071d2538ea3d3970304c5437639cb82bc51a49af8fd297cfb3'
        'df0ca782e0ee5963b82c9568b545f597dba097447d32794e6fc199cd983ed9daaa530ba48a3727b415913592266396b2a3d8add825d84faeb98a04e9aded76e5'
        'f70a1e02096c193f4734c55dbae80981a9a48b062ec632ab8e50a5d5e7b3d21a9a038b6fd4f453ae4adeb808d67f50f2cdc21537172fdbcb68bcaa61e9f80413')
options=("!strip")
backup=("etc/hatch.yaml")


build(){
 cd "$pkgname-$pkgver"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 go build -o "$pkgname" ./cmd/server
}

package(){
 cd "$pkgname-$pkgver"
 install -D -m 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 install -D -m 640 "config/config.yaml" "$pkgdir/etc/hatch.yaml"
 install -D -m 644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
 install -D -m 644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
 install -D -m 644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
