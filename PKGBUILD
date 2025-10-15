pkgname=panopta-agent
pkgver=2022.47.9
pkgrel=4
pkgdesc="Panopta monitoring agent"
arch=('any')
url="https://my.panopta.com"
license=('custom')
depends=('python' 'cronie')
source=('https://packages.panopta.com/tar/panopta-agent-tarball-latest.tar.gz'
        'panopta-agent.cron'
        'license.txt'
        'agent.py.patch'
        'agent_util.py.patch')
install=$pkgname.install
md5sums=('e8ac052af8f4cf832ecc2d07d5306e24'
         '0e1c4e4fa5ff801fe9503307c39e73b2'
         '2a657feea0ec01bf57ffad93686ea9c2'
         'eb827036a06efca50d60c19b34930af8'
         '60fe3dfc37ab85e264d47309eaae1597')

pkgver() {
    cd "$srcdir"
    echo $(tar -tf panopta-agent-tarball-latest.tar.gz | head -n1 | sed 's/panopta-agent-//; s/\///')
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # /usr/lib
    mkdir -p "$pkgdir/usr/lib/$pkgname"
    cp -r lib/* "$pkgdir/usr/lib/$pkgname"
    # Remove unneeded dependencies for other platforms
    rm -rf "$pkgdir/usr/lib/panopta-agent/dependencies/linux2/"
    rm -rf "$pkgdir/usr/lib/panopta-agent/dependencies/linux2-32/"
    rm -rf "$pkgdir/usr/lib/panopta-agent/dependencies/sparc/"
    rm -rf "$pkgdir/usr/lib/panopta-agent/dependencies/sunos5/"
    rm -rf "$pkgdir/usr/lib/panopta-agent/dependencies/freebsd*/"
    # Patch agent.py and agent_util.py that have some lingering python2 syntax.
    patch "$pkgdir/usr/lib/panopta-agent/library/agent.py" "$srcdir/agent.py.patch"
    patch "$pkgdir/usr/lib/panopta-agent/library/agent_util.py" "$srcdir/agent_util.py.patch"

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
