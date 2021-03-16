# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=wallabag
pkgver=2.4.2
pkgrel=1
pkgdesc='Self hostable application for saving web pages'
arch=('any')
url='http://www.wallabag.org/'
license=('MIT')
makedepends=('systemd')
depends=(
    'php7>=7.2'
    'php7-gd'
    'php7-tidy'
    'pcre'
)
optdepends=(
    'php7-pgsql: For postgres storage'
    'php7-sqlite: For sqlite storage'
    'rabbitmq: For async import'
    'redis: For async import'
)
install="$pkgname.install"
options=(!strip)
source=("https://github.com/wallabag/wallabag/releases/download/${pkgver}/wallabag-${pkgver}.tar.gz")
sha256sums=('da56ec37ed3d78a4b4132e8a248ac4997442eefaad6f831805304a8c317569d8')
backup=("etc/webapps/${pkgname}/parameters.yml"
        "usr/share/webapps/${pkgname}/parameters.yml"
        "var/lib/${pkgname}/data/db/wallabag.sqlite"
        "usr/share/webapps/${pkgname}/data/db/wallabag.sqlite")

package() {
    cd "${pkgdir}"
    mkdir -p usr/share/webapps
    mv "${srcdir}/${pkgver}" "usr/share/webapps/${pkgname}"

    WALLABAG_CONF_DIR="${pkgdir}/usr/share/webapps/${pkgname}/app/config"

    install -d "${pkgdir}/etc/webapps/${pkgname}/"
    mv "${WALLABAG_CONF_DIR}"/parameters.yml "${pkgdir}/etc/webapps/${pkgname}/"
    chown -R http:http "${pkgdir}/etc/webapps/${pkgname}"
    ln -s "/etc/webapps/${pkgname}/parameters.yml" "${WALLABAG_CONF_DIR}"/

    _VAR_DIR="${pkgdir}/var/lib/${pkgname}/"
    install -d "$_VAR_DIR"
    mv "${pkgdir}/usr/share/webapps/${pkgname}/"{data,var} "$_VAR_DIR"
    ln -s "/var/lib/${pkgname}/"{data,var} "${pkgdir}/usr/share/webapps/${pkgname}/"
    chown -R http:http "$_VAR_DIR"

    sed -i "${_VAR_DIR}/var/bootstrap.php.cache" -e "s@__DIR__.'/../@'/usr/share/webapps/${pkgname}/@"

    chown -R http:http "${pkgdir}/usr/share/webapps/${pkgname}/"{bin/,app/config/,vendor/,web/}
}
