# Maintainer: Owen Trigueros <owentrigueros@gmail.com>

pkgname=technitium-dns-server-bin
_pkgname=technitium-dns-server
pkgver=15.0.1
pkgrel=1
pkgdesc="Open source authoritative and recursive DNS server focused on privacy and security"
arch=('any')
url="https://technitium.com/dns/"
license=('GPL3')
depends=('aspnet-runtime')
conflicts=('technitium-dns-server')
provides=('technitium-dns-server')
source=("$_pkgname-$pkgver.tar.gz::https://download.technitium.com/dns/archive/$pkgver/DnsServerPortable.tar.gz"
        "$_pkgname.service"
        "$_pkgname.sysuser")
sha256sums=('2eaa47654eb6e58bf08821bd170dceb59bbd035468c744bc47ba12154df28b48'
            '464dbfe1038e4737ca83c60617a5a4e334cdd948fe41315a3a36913011680952'
            'd349d144faf8932c56a054b22721420f1eb68adf7bc226f174654b33510f75e4')

package() {
    cd "$srcdir"

    install -Dm644 "$_pkgname.sysuser" "$pkgdir"/usr/lib/sysusers.d/$_pkgname.conf

    for f in *.{dll,pdb}
        do install -Dm 0644 $f "$pkgdir/opt/$_pkgname/$f"
    done

    install -Dm 0644 DnsServerApp.deps.json "$pkgdir/opt/$_pkgname/DnsServerApp.deps.json"
    install -Dm 0644 DnsServerApp.runtimeconfig.json "$pkgdir/opt/$_pkgname/DnsServerApp.runtimeconfig.json"
    install -Dm 0644 named.root "$pkgdir/opt/$_pkgname/named.root"
    install -Dm 0644 root-anchors.xml "$pkgdir/opt/$_pkgname/root-anchors.xml"

    cp -r www "$pkgdir/opt/$_pkgname/www"
    cp -r dohwww "$pkgdir/opt/$_pkgname/dohwww"

    install -dm755 "$pkgdir/opt/$_pkgname/config"

    install -Dm 0644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
}
