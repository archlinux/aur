# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="dendrite"
pkgver=0.5.1
pkgrel=1
pkgdesc="A second-generation Matrix homeserver written in Go"
url="https://github.com/matrix-org/dendrite"
license=("Apache")
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
makedepends=("go>=1.15")
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "$pkgname.service")
sha256sums=('0c69e8031278d0b951e6a35532be939665ba8d8eab2d8eac80d8deed0656cf74'
            'aba328d7a7244e82f866f9d0ead0a53e79e1590b9c449ad6d18ff2659cb5e035'
            '83fa60ac51eb307aa1c96dbb088aa1ce69a91694b3bbaac210bf37408f33d837'
            'b0d5da62858969bed01fa6d8154cf43867dba48e86821e51cda8dc6eecba5cc7')

prepare(){
 cd "$pkgname-$pkgver"
 sed -i "$pkgname-config.yaml" \
     -e "s|# This is the Dendrite configuration file.|# This is an example configuration file for Dendrite.|"
}

build(){
 cd "$pkgname-$pkgver"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 go build ./cmd/dendrite-monolith-server
 go build ./cmd/generate-config
 go build ./cmd/generate-keys
 go build ./cmd/create-account
}

check(){
 cd "$pkgname-$pkgver"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 go test ./cmd/dendrite-monolith-server
}

package(){
cd "$pkgname-$pkgver"
install -D -m 755 "$pkgname-monolith-server"   "$pkgdir/usr/bin/$pkgname"
install -D -m 755 "generate-config"            "$pkgdir/usr/bin/$pkgname-generate-config"
install -D -m 755 "generate-keys"              "$pkgdir/usr/bin/$pkgname-generate-keys"
install -D -m 755 "create-account"             "$pkgdir/usr/bin/$pkgname-create-account"
install -D -m 644 "$pkgname-config.yaml"       "$pkgdir/etc/$pkgname/config-sample.yaml"
install -D -m 644 "$srcdir/$pkgname.service"   "$pkgdir/usr/lib/systemd/system/$pkgname.service"
install -D -m 644 "$srcdir/$pkgname.sysusers"  "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
install -D -m 644 "$srcdir/$pkgname.tmpfiles"  "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
