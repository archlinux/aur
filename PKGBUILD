# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=topbeat
pkgver=1.0.1
pkgrel=1
pkgdesc='An open source server monitoring agent that stores metrics in Elasticsearch'
arch=('i686' 'x86_64')
url='https://www.elastic.co/products/beats'
license=('APACHE')
backup=("etc/$pkgname/$pkgname.yml")
makedepends=('go>=1.5' 'git')
optdepends=('elasticsearch: for running standalone installation')
options=('!strip')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/elastic/beats/archive/v$pkgver.tar.gz"
        "$pkgname.service")
sha256sums=('94467bcd75cfe6296a016dcdf45cf419e905de49e3f067f875c6ea557be8b707'
            '62f5b613d9464e4d8b1074c1a54b95cbd1c6615f0c788f1d9093becbdbc6c45d')

prepare() {
    cd "beats-$pkgver/$pkgname"

    # Perform some timestomping to avoid make warnings
    _t="$(date -r Makefile +'%Y-%m-%d %k:%M:%S')"
    # Avoid installing extraneous configs
    sed -i '/[- ]win/d ; /[- ]darwin/d ; /[- ]binary/d' Makefile
    # Install the Linux config as default
    sed -i 's/topbeat-linux.yml/topbeat.yml/' Makefile
    touch -m -d "$_t" Makefile

    # Prepare an empty GOPATH for `go build`
    mkdir -p "$srcdir/gopath"

    # Workaround to place extracted release into GOPATH
    mkdir -p "$srcdir/gopath/src/github.com/elastic"
    ln -sf "$srcdir/beats-$pkgver" \
        "$srcdir/gopath/src/github.com/elastic/beats"
    ln -sf "$srcdir/beats-$pkgver/vendor/github.com/elastic/gosigar" \
        "$srcdir/gopath/src/github.com/elastic/gosigar"
}

build() {
    cd "$srcdir/beats-$pkgver/$pkgname"

    # Needs to be an environment variable for various go subcommands of make.
    export GOPATH="$srcdir/gopath"
    make
}

package() {
    cd "$srcdir/beats-$pkgver/$pkgname"

    mkdir -p "$pkgdir/etc/$pkgname"

    make PREFIX="$pkgdir/etc/$pkgname" install-cfg

    install -D -m755 "$pkgname" \
                     "$pkgdir/usr/bin/$pkgname"
    install -D -m644 "$srcdir/$pkgname.service" \
                     "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
