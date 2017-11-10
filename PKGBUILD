# Maintainer: max-k <max-kATpostDOTcom>
# Contributor: Ben Reul <breul99<NOSPAM>gmail.com>
# Contributor: Arthur D'Andréa Alemar

pkgname=prometheus
pkgver=2.0.0
pkgrel=1
pkgdesc="An open-source service monitoring system and time series database."
arch=('i686' 'x86_64')
url="http://$pkgname.io"
license=('APACHE')
depends=('glibc')
makedepends=('go' 'git')
install="$pkgname.install"
backup=("etc/$pkgname/$pkgname.yml")
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz"
        "${pkgname}.service")
sha256sums=('6947ae9b2d414d49304034a2635f0e1ecd45ac83a4f4592ea5bcca40d6f7951b'
            '2d689efe588302346b7065fef1b05be812e4a91df1a8d8845830c0b2397b2ac3')

prepare() {
    cd "$srcdir/$pkgname-$pkgver" || exit 1
    export GOPATH="$srcdir/gopath"
    mkdir -p "$GOPATH/src/github.com/$pkgname"
    rm -f "$GOPATH/src/github.com/$pkgname/$pkgname"
    ln -sr "$srcdir/$pkgname-$pkgver" "$GOPATH/src/github.com/$pkgname/$pkgname"
}

build() {
    export GOPATH="$srcdir/gopath"
    cd "$GOPATH/src/github.com/$pkgname/$pkgname" || exit 1
    make build

}
check() {
    echo "Tests are skipped because they fail even with more than 4GB free space in /tmp."
    echo "See https://github.com/prometheus/prometheus/issues/3299 for more informations."
    export GOPATH="$srcdir/gopath"
    cd "$GOPATH/src/github.com/$pkgname/$pkgname" || exit 1
    # make tests
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
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
