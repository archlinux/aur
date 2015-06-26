# Maintainer: Tyler Langlois <ty at tjll dot net>

pkgname=packetbeat
pkgver=1.0.0_beta1
_pkgver=${pkgver/_/.}
_pkgver=${_pkgver/b/B}
_godver='8e415298196f6e605ce29cbcc4d8237dc24fd756'
pkgrel=1
pkgdesc='An open source network packet analyzer that ships data to Elasticsearch.'
arch=('i686' 'x86_64')
url='https://www.elastic.co/products/beats/packetbeat'
license=('APACHE')
depends=('libpcap')
makedepends=('go')
optdepends=('elasticsearch: for running standalone installation')
options=('!strip' 'docs')
source=("https://github.com/elastic/$pkgname/archive/v$_pkgver.tar.gz"
        "https://github.com/fiorix/go-daemon/archive/$_godver.zip"
        'packetbeat.service')
sha256sums=('a119a2976ac7c7577d7ee2750d0608354e51cd73edbc5529a6ec2c5b67fd6a7b'
            '750d0ff53dc7521d1316b38074c8ada3f91d581a318fd21829499f3e40f174a3'
            '09420676932fd4292351c9b55e835c545013477d015b7ffe8d5009ed1984da64')

build() {
    local pkgsrc="$srcdir/$pkgname-$_pkgver"

    # Needs to be an environment variable for various subcommands of make.
    mkdir -p "$srcdir/gopath"
    export GOPATH="$srcdir/gopath"

    # Link needed god.c source into packetbeat source tree
    ln -sf "$srcdir/go-daemon-$_godver/god.c" "$pkgsrc/go-daemon/"
    ln -sf "$srcdir/go-daemon-$_godver/Makefile" "$pkgsrc/go-daemon/"

    # Workaround to place extracted release into GOPATH
    mkdir -p "$GOPATH/src/github.com/elastic"
    ln -sf "$pkgsrc" "$GOPATH/src/github.com/elastic/packetbeat"

    cd "$pkgsrc"
    make deps
    # `make deps` has odd behavior and creates a symlink; ensure it's gone
    [ -h "$pkgsrc/$pkgname-$_pkgver" ] && unlink "$pkgsrc/$pkgname-$_pkgver"
    make go-daemon/god
    make

    # make creates a versioned binary; link it to where `make install`
    # expects to find it
    ln -sf "$pkgname-$_pkgver" "$pkgname"
}

package() {
    cd "$srcdir/$pkgname-$_pkgver"
    make DESTDIR="$pkgdir/" install

    install -D -m644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
