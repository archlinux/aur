# Maintainer: Sandwich <sandwich@archworks.co>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=pixelfed
pkgver=0.11.9
pkgrel=1
pkgdesc='A free and ethical photo sharing platform, powered by ActivityPub federation'
arch=(any)
url="https://github.com/pixelfed/pixelfed"
license=(AGPL)
backup=(etc/webapps/pixelfed/env)
depends=(php php-sodium)
makedepends=('composer' 'unzip')
optdepends=('postgresql'
            'mysql'
            'php-fpm>=8.1'
            'php-pgsql'
            'php-gd'
            'php-imagick'
            'redis'
            'jpegoptim'
            'optipng'
            'pngquant'
            'ffmpeg'
            )
source=("$pkgname-$pkgver.tar.gz::https://github.com/pixelfed/pixelfed/archive/v${pkgver}.tar.gz"
        "pixelfed-queue.service"
        "pixelfed-scheduler.service"
        "pixelfed-scheduler.timer")
sha256sums=('a56629a8094749911927a4a02b69fa3446f1a089315ff9b2ccfd85a5e26bd140'
            '535d230e7178f4aec6165e998540150c1ad38e7b9824ce6a08325a2443579a1b'
            'dd35ce78248b5b9df52b127e5ad0039a062027942688fa21eb20bfbb8274d33c'
            'dc724f129786a3175bf7d0d6f740a767e63ef95b4de6ecb89727230b7d67924d')

build() {
    cd "$pkgname-$pkgver"

    # Run Composer and check the exit code
    composer install --no-ansi --no-interaction --no-progress --no-scripts --optimize-autoloader 2>/dev/null || {
        # Notify the user about the required PHP extensions
        echo "Please enable the following PHP extensions in order for the compilation to succeed:"
        echo "1. extension=bcmath"
        echo "2. extension=intl"
        echo "3. extension=iconv"
        echo "4. extension=sodium"

        # Provide a copy-paste command to enable the extensions
        echo -e "\nYou can enable the extensions by running the following commands:"
        echo "sudo sed -i 's/;extension=bcmath/extension=bcmath/' /etc/php/php.ini"
        echo "sudo sed -i 's/;extension=intl/extension=intl/' /etc/php/php.ini"
        echo "sudo sed -i 's/;extension=iconv/extension=iconv/' /etc/php/php.ini"
        echo -e "sudo sed -i 's/;extension=sodium/extension=sodium/' /etc/php/php.ini\n"

        # Exit with a non-zero status code to indicate build failure
        exit 1
    }
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

    # Adjust the env file
    echo "Adjust the /etc/webapps/pixelfed/env file according to your needs."
}
