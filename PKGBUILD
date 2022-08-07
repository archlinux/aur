# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=dendrite
pkgname=$_pkgname-libvips
pkgver=0.9.1
pkgrel=1
pkgdesc="A second-generation Matrix homeserver written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/matrix-org/$_pkgname"
license=('Apache')
depends=('libvips')
makedepends=('go')
optdepends=('postgresql: recommended database for large instances')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/matrix-org/$_pkgname/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz"
        "$_pkgname.sysusers"
        "$_pkgname.tmpfiles"
        "$_pkgname.service")
sha256sums=('5a65eb07b47dffefab2e8abe48cd7d37bc59e08c5163b09c63ec1d30cc808d35'
            'aba328d7a7244e82f866f9d0ead0a53e79e1590b9c449ad6d18ff2659cb5e035'
            '8da956f9fcc7c6ea844cea53c823fcfa4376acf04ecd9bceb1a908a85846c90f'
            'afcaa66d826a0b56b1cfb165b05c37dc6ec5739b24e21d382edb6c7973e588ff')
install="$_pkgname.install"

build() {
    cd "$_pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags='-s -w -linkmode=external' -tags bimg ./cmd/dendrite-monolith-server
    go build -ldflags='-s -w -linkmode=external' ./cmd/generate-config
    go build -ldflags='-s -w -linkmode=external' ./cmd/generate-keys
    go build -ldflags='-s -w -linkmode=external' ./cmd/create-account
}

package() {
    cd "$_pkgname-$pkgver"
    install -D -m 755 "dendrite-monolith-server"       "$pkgdir/usr/bin/$_pkgname"
    install -D -m 755 "generate-config"                "$pkgdir/usr/bin/$_pkgname-generate-config"
    install -D -m 755 "generate-keys"                  "$pkgdir/usr/bin/$_pkgname-generate-keys"
    install -D -m 755 "create-account"                 "$pkgdir/usr/bin/$_pkgname-create-account"
    install -D -m 644 "$_pkgname-sample.monolith.yaml" "$pkgdir/etc/$_pkgname/config-example.yaml"
    install -D -m 644 "$srcdir/$_pkgname.service"      "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    install -D -m 644 "$srcdir/$_pkgname.sysusers"     "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -D -m 644 "$srcdir/$_pkgname.tmpfiles"     "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
