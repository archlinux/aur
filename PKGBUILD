# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=filebeat
pkgver=1.0.0_rc1
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc='Collects, pre-processes, and forwards log files from remote sources'
arch=('i686' 'x86_64' 'armv7h')
url='https://www.elastic.co/products/beats'
license=('APACHE')
backup=("etc/$pkgname/$pkgname.yml")
makedepends=('go>=1.5')
optdepends=('elasticsearch: for running standalone installation')
options=('!strip')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/elastic/$pkgname/archive/v$_pkgver.tar.gz"
        "$pkgname.service")
sha256sums=('3ea03cfbc82f13155f7cc4cd114f4b2617b0c9c326594fdc72ae1bfb4560eedd'
            '9985f8e0441efde0e60c5efe97890e46d4f1cbd118d8722eb478be876197326a')

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

    make PREFIX="$pkgdir/etc/$pkgname" install-cfg

    install -D -m755 "$pkgname-$_pkgver" \
                     "$pkgdir/usr/bin/$pkgname"
    install -D -m644 "$srcdir/$pkgname.service" \
                     "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
