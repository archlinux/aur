# Maintainer: Eric Torres <eric.torres@its-et.me>
_dirname="traefik-crowdsec-bouncer"
pkgname=crowdsec-traefik-bouncer
pkgver=0.5.0
pkgrel=1
pkgdesc="Crowdsec bouncer for protecting traefik"
arch=('x86_64')
url="https://github.com/fbonalair/traefik-crowdsec-bouncer"
license=('MIT')
depends=('crowdsec' 'traefik')
makedepends=('go')
backup=("etc/default/$pkgname")
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/fbonalair/traefik-crowdsec-bouncer/archive/refs/tags/v${pkgver}.tar.gz"
        $pkgname.service
        $pkgname.conf
       )
sha256sums=('a5ec4a59d0b7811c6a955c8d14b76d037c56d35720e354dc4be99343e3570026'
            '415f259b207e6f629bc92c979c621bd6da00ecf8ecea67f220f023493dca223e'
            '9f68cc9148369b730cab21bd1c24db46c2c1c75e1577acee2e9eacd384d21413')

build() {
	cd "$_dirname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
    
    go build -ldflags "-compressdwarf=false -linkmode external" -o "$pkgname" .
}

# This test requires a crowdsec bouncer API key
#check() {
#  cd "$_dirname-$pkgver"
#  go test ./...
#}

package() {
	cd "$_dirname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    # This file is necessary for the service to run
    install -Dm660 "$srcdir/$pkgname.conf" "$pkgdir/etc/default/$pkgname"
}
