# Maintainer: Mario Finelli <mario at finel dot li>
# Co-Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Eduardo Leggiero <https://www.leggiero.uk/>
# Contributor: Josh 'jheretic' King <josh at chambana dot net>
# Contributor: James An <james@jamesan.ca>

pkgname=drush
pkgver=8.1.10
pkgrel=1
pkgdesc="Drush is a command line shell and Unix scripting interface for Drupal."
arch=('any')
url="https://github.com/drush-ops/drush/"
license=('GPL')
depends=('php')
makedepends=('php-composer' 'php-box')
install=${pkgname}.install
source=(
    "drush.install"
    "https://github.com/drush-ops/${pkgname}/archive/$pkgver.tar.gz")
sha256sums=('e800601699e4b1ea0a0057fc91827b31fc8c5070f5014df2777396aabc7680ec'
            'e81778d9ac742c04ba6fccf6de30e69ee4f92d1d03b03099d0a9d9b48b7bb6d9')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp box.json.dist box.json
    sed -i '/"git-version":/d' box.json
    sed -i '/"git-commit":/d' box.json
    composer install --no-dev
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    php -d phar.readonly=Off /usr/bin/php-box build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 drush.phar "${pkgdir}/usr/bin/drush"

    install -Dm644 examples/example.drush.ini "${pkgdir}/etc/drush/drush.ini"
    install -Dm644 examples/example.aliases.drushrc.php "${pkgdir}/etc/drush/aliases.drushrc.php"
    install -Dm644 examples/example.drushrc.php "${pkgdir}/etc/drush/drushrc.php"
}
