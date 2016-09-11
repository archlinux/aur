# Maintainer: Ben Reul <breul99<NOSPAM>gmail.com>
# Contributer: Arthur D'Andréa Alemar

pkgname=prometheus
pkgver=1.1.2
pkgrel=2
pkgdesc="An open-source service monitoring system and time series database."
depends=('glibc')
makedepends=('go')
arch=('i686' 'x86_64')
url="http://prometheus.io"
license=('APACHE')
install="$pkgname.install"
backup=('etc/prometheus/prometheus.yml')
source=("https://github.com/prometheus/prometheus/archive/v$pkgver.tar.gz"
                'prometheus.service')
sha256sums=('1a924ce9d8880a6dbff11eefbb823cdcc0af5977488deb8e5d16a74ae68d4708'
            'e17b33a12e46f337e4eda60df99944d601467c9a38e10fb25975acc2efe5c541')

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
    install -dm755 "$pkgdir/usr/bin/$pkgsrc"
    install -m755 "$srcdir/$pkgname-$pkgver/prometheus" "$pkgdir/usr/bin/$pkgsrc"
    install -m755 "$srcdir/$pkgname-$pkgver/promtool" "$pkgdir/usr/bin/$pkgsrc"

    install -dm755 "$pkgdir/etc/prometheus"
    install -m644 "$srcdir/$pkgname-$pkgver/documentation/examples/prometheus.yml" "$pkgdir/etc/prometheus"
    install -dm755 "$pkgdir/etc/prometheus"
    install -dm755 "$pkgdir/etc/prometheus/console_libraries"
    install -dm755 "$pkgdir/etc/prometheus/consoles"

    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -m644 "${srcdir}/prometheus.service" "$pkgdir/usr/lib/systemd/system/prometheus.service"

    install -dm755 "$pkgdir/usr/share/doc/prometheus/examples"
    cp -R "$srcdir/$pkgname-$pkgver/consoles" "$pkgdir/usr/share/doc/prometheus/examples"
    cp -R "$srcdir/$pkgname-$pkgver/console_libraries" "$pkgdir/usr/share/doc/prometheus/examples"

    install -dm755 "$pkgdir/usr/share/prometheus/web"
}
