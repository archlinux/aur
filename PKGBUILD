# Maintainer: Eduardo Leggiero <https://www.leggiero.uk/>
# Contributor: Josh 'jheretic' King <josh at chambana dot net>
# Contributor: James An <james@jamesan.ca>

pkgname=drush
pkgver=8.0.0
pkgrel=1
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
md5sums=('133970474ac88ed86e1619f40ec35283'
         '87e0447d69f396eb755c3a8629a9d8d9')

package() {
    cd "${pkgname}-${pkgver}"

    composer update

    # create dir structure
    install -d "${pkgdir}/etc/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/webapps/${pkgname}"
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    # add empty directory for drush extensions
    install -d "${pkgdir}/usr/share/webapps/${pkgname}/commands"

    # install main files
    cp -r commands lib includes vendor "${pkgdir}/usr/share/webapps/${pkgname}"
    cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"

    install -m644 examples/example.{{aliases.,}drushrc.php,drush.ini} "${pkgdir}/etc/${pkgname}"
    install -m644 drush_logo-black.png     "${pkgdir}/usr/share/doc/${pkgname}"
    install -m644 drush.info drush.api.php "${pkgdir}/usr/share/webapps/${pkgname}"
    install -m644 drush.php                "${pkgdir}/usr/share/webapps/${pkgname}"
    install -m755 drush                    "${pkgdir}/usr/share/webapps/${pkgname}"
    ln -s "/usr/share/webapps/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # install Console_Table library too
    install -Dm644 ../Console_Table-1.2.1/Table.php "${pkgdir}/usr/share/webapps/${pkgname}/includes/table.inc"
}
