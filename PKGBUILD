# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=topbeat
pkgver=1.0.0_beta3
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc='An open source server monitoring agent that stores metrics in Elasticsearch'
arch=('i686' 'x86_64')
url='https://www.elastic.co/products/beats'
license=('APACHE')
backup=("etc/$pkgname/$pkgname.yml")
makedepends=('go')
optdepends=('elasticsearch: for running standalone installation')
options=('!strip')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/elastic/$pkgname/archive/v$_pkgver.tar.gz"
        "$pkgname.service")
sha256sums=('b728d57a1a878fa89766cfde06d551d493706b799d269de327aa622ea5bc0969'
            '62f5b613d9464e4d8b1074c1a54b95cbd1c6615f0c788f1d9093becbdbc6c45d')

prepare() {
    cd "$pkgname-$_pkgver"

    # Prepare an empty GOPATH for `go build`
    mkdir -p "$srcdir/gopath"

    # Workaround to place extracted release into GOPATH
    mkdir -p "$srcdir/gopath/src/github.com/elastic"
    ln -sf "$srcdir/$pkgname-$_pkgver" \
        "$srcdir/gopath/src/github.com/elastic/$pkgname"
}

build() {
    # Needs to be an environment variable for various go subcommands of make.
    export GOPATH="$srcdir/gopath"

    cd "$srcdir/$pkgname-$_pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$_pkgver"

    mkdir -p "$pkgdir/etc/$pkgname"

    # Avoid installing extraneous configs
    sed -i -E '/-(darwin|win)[.]yml/d' Makefile
    # Install the Linux config as default
    sed -i 's/topbeat-linux[.]yml/topbeat.yml/' Makefile

    make PREFIX="$pkgdir/etc/$pkgname" install_cfg

    install -D -m755 $pkgname-$_pkgver "$pkgdir/usr/bin/$pkgname"
    install -D -m644 "$srcdir/$pkgname.service" \
                     "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
