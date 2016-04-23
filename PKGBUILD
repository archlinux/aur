# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=filebeat
pkgver=1.2.1
pkgrel=1
pkgdesc='Collects, pre-processes, and forwards log files from remote sources'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url='https://www.elastic.co/products/beats'
license=('APACHE')
backup=("etc/$pkgname/$pkgname.yml")
makedepends=('go>=1.5' 'git')
optdepends=('elasticsearch: for running standalone installation')
install="$pkgname.install"
options=('!strip')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/elastic/beats/archive/v$pkgver/beats-$pkgver.tar.gz"
        "$pkgname.install"
        "$pkgname.service"
        "$pkgname.sysusers")
sha256sums=('d7aa53dddb36bae62846fcdf091c9e70d279252bdbc0ebe976d2ed7ca0c71e7a'
            '337d78d9cb21745098c4cc75578f026e5a5819cd4d0575e3f4241f13370c0863'
            '1b668b67134dcbca41193f7987371c6e9ead9853f3ebcb54d5c80a9d0b9decf0'
            '33feb3690f8b31563cc1e2da557c2aa326501ce9ccd7e0a142036902bfdb05ff')

prepare() {
    cd "beats-$pkgver/$pkgname"

    # Perform some timestomping to avoid make warnings
    LANG=C _t="$(date -r Makefile +'%Y-%m-%d %k:%M:%S')"
    # Avoid installing extraneous configs
    sed -i '/[- ]win/d ; /[- ]darwin/d ; /[- ]binary/d' Makefile
    # Install the Linux config as default
    sed -i 's/filebeat-linux.yml/filebeat.yml/' Makefile
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
    mkdir -p "$pkgdir/var/lib/$pkgname"

    make PREFIX="$pkgdir/etc/$pkgname" install-cfg

    install -D -m755 "$pkgname" \
                     "$pkgdir/usr/bin/$pkgname"
    install -D -m644 "$srcdir/$pkgname.service" \
                     "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    # See man page for sysusers.d(5)
    install -D -m644 "$srcdir/$pkgname.sysusers" \
                     "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
