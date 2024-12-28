# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="pterodactyl-wings"
pkgver=1.11.13
pkgrel=1
pkgdesc="The server control plane for Pterodactyl Panel"
url="https://pterodactyl.io/"
license=("MIT")
arch=("x86_64" "aarch64")
depends=("docker")
makedepends=("go")
conflicts=("pterodactyl-daemon")
source=("$pkgname-$pkgver.tar.gz::https://github.com/pterodactyl/wings/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.service")
sha256sums=('d27c4e492a5126208f69e036e464f65fd93de0e3c91023b94e741e427d21d59c'
            '62dfff25f9bdae4769f4201ed30e7c2bfca54611bee75512c5626e74c764f46e')

build(){
 cd "wings-$pkgver"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 go build -o "build/wings" -v wings.go
 # upx not included as it returns the following: upx: build/wings: CantPackException: bad DT_GNU_HASH n_bucket=0x62  n_bitmask=0x8  len=0x2c0
}

package(){
 cd "wings-$pkgver"
 install -d 640 "$pkgdir/etc/pterodactyl"
 install -D -m 755 "build/wings" "$pkgdir/usr/bin/wings"
 install -D -m 644 "$srcdir/$pkgname.service"   "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
