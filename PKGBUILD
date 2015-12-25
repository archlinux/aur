# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=packetbeat
pkgver=1.0.1
pkgrel=1
pkgdesc='An open source network packet analyzer that ships data to Elasticsearch.'
arch=('i686' 'x86_64' 'armv7h')
url="https://www.elastic.co/products/beats/$pkgname"
license=('APACHE')
backup=("etc/$pkgname/$pkgname.yml")
depends=('libpcap')
makedepends=('go>=1.5' 'git')
optdepends=('elasticsearch: for running standalone installation')
options=('!strip')
provides=('packetbeat')
conflicts=('packetbeat-bin')
source=("https://github.com/elastic/beats/archive/v$pkgver.tar.gz"
        "$pkgname.service")
sha256sums=('94467bcd75cfe6296a016dcdf45cf419e905de49e3f067f875c6ea557be8b707'
            '09420676932fd4292351c9b55e835c545013477d015b7ffe8d5009ed1984da64')

prepare() {
    cd "beats-$pkgver/$pkgname"

    # Perform some timestomping to avoid make warnings
    _t="$(date -r Makefile +'%Y-%m-%d %k:%M:%S')"
    # Remove win and darwin config installation
    sed -i '/[- ]win/d ; /[- ]darwin/d' Makefile
    # Replace Linux config filename
    sed -i 's/packetbeat-linux.yml/packetbeat.yml/' Makefile
    # Binary config is redundant
    sed -i '/packetbeat-binary.yml/d' Makefile
    touch -m -d "$_t" Makefile

    # Prepare an empty GOPATH for `go build`
    mkdir -p "$srcdir/gopath"

    # Workaround to place extracted release into GOPATH
    mkdir -p "$srcdir/gopath/src/github.com/elastic"
    ln -sf "$srcdir/beats-$pkgver" \
        "$srcdir/gopath/src/github.com/elastic/beats"
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
