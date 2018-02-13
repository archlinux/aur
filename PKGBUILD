# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contriburo: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Andre Wayand <aur-awl@awayand.sleepmail.com>

pkgname='awl'
pkgver='0.59'
pkgrel=1
pkgdesc="Andrew's php Web Libraries"
arch=('any')
url="https://gitlab.com/davical-project/awl/"
license=('GPL2')
depends=('php')
makedepends=('apigen' 'php-sqlite')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/davical-project/${pkgname}/repository/archive.tar.bz2?ref=r${pkgver}")
sha512sums=('3f8aba5f8a2e2afbd7574a7a585815a504f5154ab8e345c1ebcc8e5a3428f0e0a8a0b9ae2b0c9aa553aff50baf136d12e7bc3bc985f91bd947678b689e4ef4de')

prepare() {
    cd "${srcdir}"
    # rename source dir
    mv ${pkgname}-r${pkgver}-* "${pkgname}-${pkgver}"
    # strip debian build files from source dir
    rm -rf "${srcdir}/${pkgname}-${pkgver}/debian"
    # enable pdo_sqlite php extension for apigen
    sed -i 's|apigen generate|php -d "extension=pdo_sqlite.so" /usr/bin/apigen generate|g' "${srcdir}/${pkgname}-${pkgver}/Makefile"
    # enable inconv php extension for make test
    sed -i 's|; do php -l \$\${PHP}|; do php -d "extension=iconv.so" -l \$\${PHP}|g' "${srcdir}/${pkgname}-${pkgver}/Makefile"
    # enable inconv php extension for phpunit
    sed -i 's|#!/usr/bin/env php$|#!/usr/bin/env php -d "extension=iconv.so"|1' "${srcdir}/${pkgname}-${pkgver}/vendor/phpunit/phpunit/composer/bin/phpunit"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

# phpunit simply runs in an endless loop for >90min without any result...
# seems to be an upstream bug
#check() {
#    cd "${srcdir}/${pkgname}-${pkgver}"
#    make test
#}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -d m755 "${pkgdir}/usr/share/${pkgname}"
    cp -ra dba inc scripts tests vendor "${pkgdir}/usr/share/${pkgname}/"
    install -D -d m755 "${pkgdir}/usr/share/doc/${pkgname}"
    cp -ra docs/* "${pkgdir}/usr/share/doc/${pkgname}/"
}
