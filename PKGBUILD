# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=wallabag
pkgver=2.2.2
pkgrel=1
pkgdesc='Self hostable application for saving web pages'
arch=('any')
url='http://www.wallabag.org/'
license=('MIT')
depends=(
    'php>=5.5'
    'php-gd'
    'php-tidy'
    'pcre'
)
optdepends=(
    'php-pgsql: For postgres storage'
    'php-sqlite: For sqlite storage'
    'rabbitmq: For async import'
    'redis: For async import'
)
install="$pkgname.install"
options=(!strip)
source=("https://static.wallabag.org/releases/wallabag-release-${pkgver}.tar.gz")
sha256sums=('40d98bd556116dbc28f92339f0e5b93836ece87dcb01e7aaa628ea98855a1f51')
backup=("etc/webapps/${pkgname}/parameters.yml"
        "usr/share/webapps/${pkgname}/parameters.yml"
        "var/lib/${pkgname}/data/db/wallabag.sqlite"
        "usr/share/webapps/${pkgname}/data/db/wallabag.sqlite")

package() {
    cd "${pkgdir}"
    mkdir -p usr/share/webapps
    mv "${srcdir}/release-${pkgver}" usr/share/webapps/${pkgname}

    WALLABAG_CONF_DIR="${pkgdir}/usr/share/webapps/${pkgname}/app/config"

    install -d "${pkgdir}/etc/webapps/${pkgname}/"
    mv "${WALLABAG_CONF_DIR}"/parameters.yml ${pkgdir}/etc/webapps/${pkgname}/
    chown -R http:http ${pkgdir}/etc/webapps/${pkgname}
    ln -s /etc/webapps/${pkgname}/parameters.yml "${WALLABAG_CONF_DIR}"/

    _VAR_DIR="${pkgdir}/var/lib/${pkgname}/"
    install -d "$_VAR_DIR"
    mv "${pkgdir}/usr/share/webapps/${pkgname}/"{data,var} "$_VAR_DIR"
    ln -s "/var/lib/${pkgname}/"{data,var} "${pkgdir}/usr/share/webapps/${pkgname}/"
    chown -R http:http "$_VAR_DIR"

    sed -i "${_VAR_DIR}/var/bootstrap.php.cache" -e "s@__DIR__.'/../@'/usr/share/webapps/${pkgname}/@"

    chown -R http:http "${pkgdir}/usr/share/webapps/${pkgname}"
}
