# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contriburo: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Andre Wayand <aur-awl@awayand.sleepmail.com>

pkgname='awl'
pkgver='0.57'
pkgrel=2
pkgdesc="Andrew's php Web Libraries"
arch=('i686' 'x86_64')
url="https://gitlab.com/davical-project/awl/"
license=('GPL2')
depends=('php')
makedepends=('make' 'apigen' 'php-sqlite')
install="${pkgname}.install"
source=("awl-0.57.tar.bz2::https://gitlab.com/davical-project/awl/repository/archive.tar.bz2?ref=r0.57"
        "${pkgname}.install")
sha256sums=('42e5bfc5cf1c011c3896eece13002da5be09e701a3161a6109fe5888eba5e5bc'
            '483f89aa1f30db4e6b64a90f486ab543985d68a712996f0deec58d354e4fb4c7')

prepare() {
    cd "${srcdir}"
    msg "renaming source dir"
    mv awl-r${pkgver}-* "awl-${pkgver}"
    msg "stripping Debian build files from source dir"
    rm -rf "${srcdir}/${pkgname}-${pkgver}/debian"
    msg "enabling pdo_sqlite.so php extensions in the Makefile regardless of php.ini setting"
    sed -i 's|apigen generate|php -d "extension=pdo_sqlite.so" /usr/bin/apigen generate|g' "${srcdir}/${pkgname}-${pkgver}/Makefile"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -d m755 "${pkgdir}/usr/share/${pkgname}"
    cp -rf docs inc scripts tests vendor "${pkgdir}/usr/share/${pkgname}/"
}
