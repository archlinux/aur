pkgname=panopta-agent
pkgver=2022.20.5
pkgrel=1
pkgdesc="Panopta monitoring agent"
arch=('any')
url="https://my.panopta.com"
license=('custom')
depends=('python2' 'cronie')
source=("http://packages.panopta.com/tar/panopta-agent-tarball-latest.tar.gz" "panopta-agent.cron" "license.txt")
install=$pkgname.install
md5sums=('SKIP'
         '0e1c4e4fa5ff801fe9503307c39e73b2'
         '2a657feea0ec01bf57ffad93686ea9c2')

pkgver() {
    cd "$srcdir"
    echo $(tar -tf panopta-agent-tarball-latest.tar.gz | head -n1 | sed 's/panopta-agent-//; s/\///')
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # /usr/lib
    mkdir -p "$pkgdir/usr/lib/$pkgname"
    cp -r lib/* "$pkgdir/usr/lib/$pkgname"

    # /usr/bin
    mkdir -p "$pkgdir/usr/bin/$pkgname"
    cp -r bin/* "$pkgdir/usr/bin/$pkgname"

    # /var/lib
    mkdir -p "$pkgdir/var/lib/$pkgname"
    touch "$pkgdir/var/lib/$pkgname/register"
    touch "$pkgdir/var/lib/$pkgname/report"

    # Copy cron file
    mkdir -p "$pkgdir/etc/cron.d"
    install -Dm644 "$srcdir/$pkgname.cron" "$pkgdir/etc/cron.d/$pkgname"

    # Copy license
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
