# Maintainer: danieltetraquark

pkgname=grocy
pkgver=4.7.1
pkgrel=1
pkgdesc="web-based self-hosted groceries & household management solution for your home"
depends=('php-interpreter' 'php-sqlite' 'php-gd' 'php-intl')
makedepends=('composer' 'yarn' 'git' 'nodejs>=24')
license=('MIT')
arch=('any')
url="https://grocy.info/"
source=(
https://github.com/grocy/grocy/archive/v${pkgver}.zip
)
sha512sums=('58820511fccdc148d5215393fe292abd012250aa40de364457681611ef9e17cb7b1a8374f5546629fb7cdda9ed24ca4f6f611ebb000425970b65f4d7e8f9b43a')

backup=('etc/webapps/grocy/config.php')

build() {
    cd grocy-${pkgver}

    # composer need to have php-gd extension enabled, otherwise it will fail for a dependency of grocy.
    # note: you may need to adjust your php open_basedir setting, so that php can run!
    php -n -dextension=gd.so -dextension=intl.so -dextension=iconv.so /usr/bin/composer install --no-interaction --no-dev --optimize-autoloader
    php /usr/bin/composer clear-cache

    yarn install --modules-folder public/packages --production --frozen-lockfile
    yarn cache clean
}

package() {
    cd grocy-${pkgver}

    _instdir="$pkgdir"/usr/share/webapps/grocy
    mkdir -p "$_instdir" "$pkgdir"/etc/webapps/grocy "$pkgdir"/var/lib/webapps


    # install license
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # copy files to install directory
    cp -ra . "$_instdir"/

    mv "$pkgdir"/usr/share/webapps/grocy/data "$pkgdir"/var/lib/webapps/grocy

#    mkdir "$pkgdir"/usr/share/webapps/grocy/data/
    ln -s /var/lib/webapps/grocy "$pkgdir"/usr/share/webapps/grocy/data

    ln -s /etc/webapps/grocy/config.php "$pkgdir"/var/lib/webapps/grocy/config.php

    mv config-dist.php "$pkgdir"/etc/webapps/grocy/config.php

    chown 33 "$pkgdir"/var/lib/webapps/grocy
}

