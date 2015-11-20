# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=filebeat
pkgver=1.0.0_rc2
_pkgver=${pkgver/_/-}
pkgrel=2
pkgdesc='Collects, pre-processes, and forwards log files from remote sources'
arch=('i686' 'x86_64' 'armv7h')
url='https://www.elastic.co/products/beats'
license=('APACHE')
backup=("etc/$pkgname/$pkgname.yml")
makedepends=('go>=1.5')
optdepends=('elasticsearch: for running standalone installation')
install="$pkgname.install"
options=('!strip')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/elastic/$pkgname/archive/v$_pkgver.tar.gz"
        "$pkgname.install"
        "$pkgname.service"
        "$pkgname.sysusers")
sha256sums=('a9ef85bafda63d5204033597c72df8befe31acce2946f05330b9dea279b562af'
            'dca0278bc86c4bbf2c1976a4482784f608221cd4e0607787c334beca7bdef0ef'
            'd6db8138b0cb70925a529609b612ad0caf0c72bd8cf2e6b85de64eb2c42bced7'
            '33feb3690f8b31563cc1e2da557c2aa326501ce9ccd7e0a142036902bfdb05ff')

prepare() {
    cd "$pkgname-$_pkgver"

    # Perform some timestomping to avoid make warnings
    _t="$(date -r Makefile)"
    # Avoid installing extraneous configs
    sed -i '/[- ]win/d ; /[- ]darwin/d ; /[- ]binary/d' Makefile
    # Install the Linux config as default
    sed -i 's/filebeat-linux.yml/filebeat.yml/' Makefile
    touch -m -d "$_t" Makefile

    # Prepare an empty GOPATH for `go build`
    mkdir -p "$srcdir/gopath"

    # Workaround to place extracted release into GOPATH
    mkdir -p "$srcdir/gopath/src/github.com/elastic"
    ln -sf "$srcdir/$pkgname-$_pkgver" \
        "$srcdir/gopath/src/github.com/elastic/$pkgname"
}

build() {
    cd "$srcdir/$pkgname-$_pkgver"

    # Needs to be an environment variable for various go subcommands of make.
    export GOPATH="$srcdir/gopath"
    make
}

package() {
    cd "$srcdir/$pkgname-$_pkgver"

    mkdir -p "$pkgdir/etc/$pkgname"
    mkdir -p "$pkgdir/var/lib/$pkgname"

    make PREFIX="$pkgdir/etc/$pkgname" install-cfg

    install -D -m755 "$pkgname-$_pkgver" \
                     "$pkgdir/usr/bin/$pkgname"
    install -D -m644 "$srcdir/$pkgname.service" \
                     "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    # See man page for sysusers.d(5)
    install -D -m644 "$srcdir/$pkgname.sysusers" \
                     "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
