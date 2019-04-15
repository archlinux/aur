# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contriburo: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Andre Wayand <aur-awl@awayand.sleepmail.com>

pkgname='awl'
pkgver='0.60'
pkgrel=1
pkgdesc="Andrew's php Web Libraries"
arch=('any')
url="https://gitlab.com/davical-project/awl/"
license=('GPL2')
depends=('php')
makedepends=('apigen' 'php-sqlite')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/davical-project/${pkgname}/repository/archive.tar.bz2?ref=r${pkgver}")
sha512sums=('2604d92e6541da76be57c5700d360ffd512047ace951b1597c622456a2898871dc101646f52cd5da1aa4c3c5b4e2629bc7fdee9e12f874e0971790e9d0f8f703')

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
