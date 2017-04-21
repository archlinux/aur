# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=firefly-iii
pkgver=4.3.8
pkgrel=2
pkgdesc='PHP personal finances manager'
arch=('any')
url="https://github.com/${pkgname}/${pkgname}"
license=('custom')
depends=('php-intl')
makedepends=('composer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('47a8096ed23b5a49aa734b9854c70e6c1f991c90acbed904ee2a9c2d0c6d3d57')

install=$pkgname.install

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -d "$pkgdir/usr/share/webapps" "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/etc/webapps/$pkgname"
    php -dextension=intl.so /usr/bin/composer create-project --working-dir "$pkgdir/usr/share/webapps" "grumpydictator/$pkgname" --no-dev --prefer-dist
    install -D "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
    echo "Start move"
    mv -v "$pkgdir/usr/share/webapps/$pkgname/.env"* "$pkgdir/etc/webapps/$pkgname"
    echo "End move"

	for i in '' '.docker' '.example' '.sandstorm' '.testing' ; do
        echo "$i"
        mv -v "$pkgdir/etc/webapps/$pkgname/.env$i" "$pkgdir/etc/webapps/$pkgname/config.env$i"
        ln -sv "../../../../etc/webapps/firefly-iii/config.env$i" "$pkgdir/usr/share/webapps/$pkgname/.env$i"
    done
}

# vim:ts=4:sw=4:expandtab
