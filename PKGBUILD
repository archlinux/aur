# Maintainer: Stephen Cox <stephencoxmail@gmail.com>
# Contributor: lorico <lsteinert@uraziel.de>

_pkgname=data-importer
pkgname=firefly-iii-$_pkgname
pkgver=1.9.1
pkgrel=2
pkgdesc='The Firefly III Data Importer can import data into Firefly III'
arch=('any')
url="https://github.com/firefly-iii/$_pkgname"
license=('AGPL-3.0-or-later')
depends=('php>=8.4.0')
optdepends=('nginx: HTTP server'
            'apache: HTTP server')
options=('!strip' '!debug')
install=$pkgname.install
source=("$_pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/DataImporter-v${pkgver}.tar.gz")
sha256sums=('3cbdd30494d19a1a40f2a5f09943a777642a59571f15a37f1c8309ef996d8202')

backup=("etc/webapps/$pkgname/config.env")

package(){
    cd "$srcdir"

    install -d "$pkgdir/usr/share/webapps/$pkgname" "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/etc/webapps/$pkgname"
    cp -rv * "$pkgdir/usr/share/webapps/$pkgname"
    install -D "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

    cp -v .env.example "$pkgdir/etc/webapps/$pkgname/.env"
    mv -v "$pkgdir/etc/webapps/$pkgname/.env" "$pkgdir/etc/webapps/$pkgname/config.env"

    ln -s "/etc/webapps/$pkgname/config.env" "$pkgdir/usr/share/webapps/$pkgname/.env"
    rm -rf "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache"

    install -d "$pkgdir/var/cache/$pkgname"
    ln -s "/var/cache/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache"

    mkdir -p "$pkgdir/var/lib"
    mv "$pkgdir/usr/share/webapps/$pkgname/storage" "$pkgdir/var/lib/$pkgname"
    ln -s "/var/lib/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/storage"
}
