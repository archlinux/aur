# Maintainer: Stephen Cox <stephencoxmail@gmail.com>
# Contributor: lorico <lsteinert@uraziel.de>
# Contributor: angelsl <angelsl@in04.sg>
# Contributor: Simon Doppler (dopsi) <dop.simon@gmail.com>

pkgname=firefly-iii
pkgver=6.4.9
pkgrel=1
pkgdesc='PHP personal finances manager'
arch=('any')
url="https://github.com/${pkgname}/${pkgname}"
license=('AGPL-3.0-only')
depends=('php-intl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/FireflyIII-v${pkgver}.tar.gz")
sha256sums=('b768b9ba39b180f978dab09bff1a57e73f91f24690360d79cd82910be0fd2658')

backup=("etc/webapps/$pkgname/config.env")

package() {
    cd "$srcdir"

    rm -f $pkgname-$pkgver.tar.gz

    install -d "$pkgdir/usr/share/webapps/$pkgname" "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/etc/webapps/$pkgname"
    cp -rv * "$pkgdir/usr/share/webapps/$pkgname"
    install -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

    cp -v .env.example "$pkgdir/etc/webapps/$pkgname/config.env"
    ln -s "/etc/webapps/$pkgname/config.env" "$pkgdir/usr/share/webapps/$pkgname/.env"

    rm -rf "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache"
    install -o http -g http -d "$pkgdir/var/cache/$pkgname"
    ln -s "/var/cache/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache"

    mkdir -p "$pkgdir/var/lib"
    mv "$pkgdir/usr/share/webapps/$pkgname/storage" "$pkgdir/var/lib/firefly-iii"
    chown -R http:http "$pkgdir/var/lib/firefly-iii"
    chmod 775 "$pkgdir/var/lib/firefly-iii"
    ln -s "/var/lib/firefly-iii" "$pkgdir/usr/share/webapps/$pkgname/storage"
}

# vim:ts=4:sw=4:expandtab
