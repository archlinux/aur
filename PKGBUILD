# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=pixelfed
pkgver=0.10.9
pkgrel=1
pkgdesc='A free and ethical photo sharing platform, powered by ActivityPub federation'
arch=(any)
url="https://github.com/pixelfed/pixelfed"
license=(AGPL)
backup=(etc/webapps/pixelfed/env)
depends=(php php-intl)
makedepends=("composer" "unzip")
optdepends=('mysql'
            'postgresql'
            'php-fpm'
            'php-pgsql'
            'php-gd'
            'php-imagick'
            'redis'
            'jpegoptim'
            'optipng'
            'pngquant'
            )
source=("$pkgname-$pkgver.tar.gz::https://github.com/pixelfed/pixelfed/archive/v${pkgver}.tar.gz"
        "pixelfed-queue.service"
        "pixelfed-scheduler.service"
        "pixelfed-scheduler.timer")
sha256sums=('d843796473858de2f0f3cda11db2f711b8303a058660d62c6696d4cb828a8a45'
            '535d230e7178f4aec6165e998540150c1ad38e7b9824ce6a08325a2443579a1b'
            'dd35ce78248b5b9df52b127e5ad0039a062027942688fa21eb20bfbb8274d33c'
            'dc724f129786a3175bf7d0d6f740a767e63ef95b4de6ecb89727230b7d67924d')

build() {
    cd "$pkgname-$pkgver"
    # BUG: This fails if the builder has not enabled several php extensions.
    composer install --no-ansi --no-interaction --no-progress --no-scripts --optimize-autoloader
}

package() {
    cd "$pkgname-$pkgver"
    _instdir="$pkgdir"/usr/share/webapps/$pkgname

    install -d "$_instdir"
    cp -ra * "$_instdir/"

    install -d "$pkgdir/var/lib/pixelfed"
    install -d "$pkgdir/var/lib/pixelfed/bootstrap"
    mv "$_instdir/storage"         "$pkgdir/var/lib/pixelfed"
    mv "$_instdir/bootstrap/cache" "$pkgdir/var/lib/pixelfed/bootstrap"
    chown -R 33:33 "$pkgdir/var/lib/pixelfed"

    install -Dm640 -o http -g http .env.example "$pkgdir/etc/webapps/$pkgname/env"
    ln -s "/etc/webapps/$pkgname/env" "$_instdir/.env"
    ln -s "/var/lib/pixelfed/storage" "$_instdir/storage"
    ln -s "/var/lib/pixelfed/storage/app/public" "$_instdir/public/storage"
    ln -s "/var/lib/pixelfed/bootstrap/cache" "$_instdir/bootstrap/cache"

    install -d "$pkgdir/usr/lib/systemd/system"
    cp "$srcdir"/*{.service,.timer} "$pkgdir/usr/lib/systemd/system/"
}
