# Maintainer: Tyler Langlois <ty at tjll dot net>

pkgname=packetbeat
pkgver=1.0.0_beta1
_pkgver=${pkgver/_/.}
_pkgver=${_pkgver/b/B}
pkgrel=3
pkgdesc='An open source network packet analyzer that ships data to Elasticsearch.'
arch=('i686' 'x86_64')
url="https://www.elastic.co/products/beats/$pkgname"
license=('APACHE')
backup=("etc/$pkgname/$pkgname.yml")
depends=('libpcap')
makedepends=('go')
optdepends=('elasticsearch: for running standalone installation')
options=('!strip')
source=("https://github.com/elastic/$pkgname/archive/v$_pkgver.tar.gz"
        "$pkgname.service")
sha256sums=('a119a2976ac7c7577d7ee2750d0608354e51cd73edbc5529a6ec2c5b67fd6a7b'
            '09420676932fd4292351c9b55e835c545013477d015b7ffe8d5009ed1984da64')

prepare() {
    cd "$pkgname-$_pkgver"

    # go-daemon isn't necessary on systemd systems, so remove it from the
    # install pipeline here. Also perform some timestomping to avoid make
    # warnings.
    _t="$(date -r Makefile)"
    sed -i '/install -D go-daemon/d' Makefile
    touch -m -d "$_t" Makefile

    # Create phony files to prevent `make` from building the god target.
    touch go-daemon/god{,.c}

    # Prepare an empty GOPATH for `go build`
    mkdir -p "$srcdir/gopath"

    # Workaround to place extracted release into GOPATH
    mkdir -p "$srcdir/gopath/src/github.com/elastic"
    ln -sf "$srcdir/$pkgname-$_pkgver" \
        "$srcdir/gopath/src/github.com/elastic/$pkgname"
}

build() {
    local pkgsrc="$srcdir/$pkgname-$_pkgver"

    # Needs to be an environment variable for various go subcommands of make.
    export GOPATH="$srcdir/gopath"

    cd "$pkgsrc"

    make deps
    # `make deps` has odd behavior and creates a symlink; ensure it's gone
    [ -h "$pkgsrc/$pkgname-$_pkgver" ] && unlink "$pkgsrc/$pkgname-$_pkgver"
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
