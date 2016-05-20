# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=packetbeat
pkgver=1.2.3
pkgrel=1
pkgdesc='An open source network packet analyzer that ships data to Elasticsearch.'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://www.elastic.co/products/beats/$pkgname"
license=('APACHE')
backup=("etc/$pkgname/$pkgname.yml")
depends=('libpcap')
makedepends=('go>=1.5' 'git')
optdepends=('elasticsearch: for running standalone installation')
options=('!strip')
provides=('packetbeat')
conflicts=('packetbeat-bin')
source=("https://github.com/elastic/beats/archive/v$pkgver/beats-$pkgver.tar.gz"
        "$pkgname.service")
sha256sums=('8eea85de415898c362144ba533062651d8891241c738799e54cc9b17040c1fc9'
            'e45629a37d5c305efa26e2b6a68561528762081681e547e312bb058cbff76125')

prepare() {
    cd "beats-$pkgver/$pkgname"

    # Perform some timestomping to avoid make warnings
    LANG=C _t="$(date -r Makefile +'%Y-%m-%d %k:%M:%S')"
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
