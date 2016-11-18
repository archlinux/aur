# Maintainer: max-k <max-kATpostDOTcom>
# Contributor: Ben Reul <breul99<NOSPAM>gmail.com>
# Contributor: Arthur D'Andréa Alemar

pkgname=prometheus
pkgver=1.3.1
pkgrel=1
pkgdesc="An open-source service monitoring system and time series database."
arch=('i686' 'x86_64')
url="http://prometheus.io"
license=('APACHE')
depends=('glibc')
makedepends=('go' 'git')
install="$pkgname.install"
backup=('etc/prometheus/prometheus.yml')
source=("https://github.com/prometheus/prometheus/archive/v$pkgver.tar.gz"
        'prometheus.service')
sha256sums=('6463369891cc9e748e1025a600bc948e95f276830c58b44689165d5d8de7f5f6'
            '2d689efe588302346b7065fef1b05be812e4a91df1a8d8845830c0b2397b2ac3')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath"
    mkdir -p "$GOPATH/src/github.com/prometheus"
    rm -f "$GOPATH/src/github.com/prometheus/prometheus"
    ln -sr "$srcdir/$pkgname-$pkgver" "$GOPATH/src/github.com/prometheus/prometheus"
}

build() {
    export GOPATH="$srcdir/gopath"
    cd "$GOPATH/src/github.com/prometheus/prometheus"
    make build

}
check() {
    export GOPATH="$srcdir/gopath"
    cd "$GOPATH/src/github.com/prometheus/prometheus"
    make test
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname-$pkgver/prometheus" "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname-$pkgver/promtool" "$pkgdir/usr/bin"

    install -dm755 "$pkgdir/etc/prometheus"
    install -m644 "$srcdir/$pkgname-$pkgver/documentation/examples/prometheus.yml" "$pkgdir/etc/prometheus"
    install -dm755 "$pkgdir/etc/prometheus"
    install -dm755 "$pkgdir/etc/prometheus/console_libraries"
    install -dm755 "$pkgdir/etc/prometheus/consoles"

    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -m644 "$srcdir/prometheus.service" "$pkgdir/usr/lib/systemd/system/prometheus.service"

    install -dm755 "$pkgdir/usr/share/doc/prometheus/examples"
    cp -R "$srcdir/$pkgname-$pkgver/consoles" "$pkgdir/usr/share/doc/prometheus/examples"
    cp -R "$srcdir/$pkgname-$pkgver/console_libraries" "$pkgdir/usr/share/doc/prometheus/examples"

    install -dm755 "$pkgdir/usr/share/prometheus/web"
}
