# Maintainer: Eduardo Leggiero <https://www.leggiero.uk/>
# Contributor: Josh 'jheretic' King <josh at chambana dot net>
# Contributor: James An <james@jamesan.ca>

pkgname=drush
pkgver=7.1.0
pkgrel=2
pkgdesc="Drush is a command line shell and Unix scripting interface for Drupal"
arch=('any')
url="https://github.com/drush-ops/drush/"
license=('GPL')
depends=('php' 'php-composer')
install=${pkgname}.install
source=(
    "http://github.com/drush-ops/$pkgname/archive/$pkgver.tar.gz"
    'http://download.pear.php.net/package/Console_Table-1.2.1.tgz'
)
md5sums=('edbcac3216b793b5debb4a4b7c7bac12'
         '87e0447d69f396eb755c3a8629a9d8d9')

package() {
    cd "${pkgname}-${pkgver}"

    composer update

    # create dir structure
    install -d "${pkgdir}/etc/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/lib/${pkgname}"
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    # add empty directory for drush extensions
    install -d "${pkgdir}/usr/share/${pkgname}/commands"

    # install main files
    cp -r commands lib includes vendor "${pkgdir}/usr/lib/${pkgname}"
    cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"

    install -m644 examples/example.{{aliases.,}drushrc.php,drush.ini} "${pkgdir}/etc/${pkgname}"
    install -m644 drush_logo-black.png     "${pkgdir}/usr/share/doc/${pkgname}"
    install -m644 drush.info drush.api.php "${pkgdir}/usr/lib/${pkgname}"
    install -m644 drush.php                "${pkgdir}/usr/lib/${pkgname}"
    install -m755 drush                    "${pkgdir}/usr/lib/${pkgname}"
    ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # install Console_Table library too
    install -Dm644 ../Console_Table-1.2.1/Table.php "${pkgdir}/usr/lib/${pkgname}/includes/table.inc"
}
