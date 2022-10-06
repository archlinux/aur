# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contriburo: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Andre Wayand <aur-awl@awayand.sleepmail.com>

pkgbase=awl
pkgname=('awl' 'awl-docs')
pkgver=0.63
pkgrel=1
pkgdesc="Andrew's Web Libraries"
arch=('any')
url="https://gitlab.com/davical-project/awl"
license=('GPL2')
depends=('php')
makedepends=('doxygen' 'graphviz')
options=('!strip')
install=${pkgbase}.install
source=("${pkgbase}-${pkgver}.tar.gz::$url/-/archive/r$pkgver/$pkgbase-r$pkgver.tar.gz")
sha512sums=('9ea5aad9762ec889fdc7f870a793cec82eaa374f08bead122de219c98d255677f55baf943f529cbd5008381cdf0f61283babfaa780c2d9468c9e56c739a092ea')
b2sums=('a49892f205662763c909af448e897114555867c751cced60da7338881243e60270f9c9da243cebd501c953f6eebc22ef093baab2a04627b09bf011b0fbd0b52d')

package_awl() {
    pkgdesc="Andrew's Web Libraries - PHP Utility Libraries"
    depends=('php')
    optdepends=('awl-docs: documentation')

    cd "${pkgbase}-r${pkgver}"

    # create directory
    mkdir -vp "${pkgdir}/usr/share/${pkgbase}"

    # update package version
    sed -s \
      "/^ *.c->awl_library_version *=.*$/ s/^ *.c->awl_library_version *=.*$/\$c->awl_library_version = ${pkgver};/" \
      inc/AWLUtilities.php.in > inc/AWLUtilities.php

    # remove template
    rm -vf inc/AWLUtilities.php.in

    # install package
    cp -vra dba inc "${pkgdir}/usr/share/${pkgbase}"
}

package_awl-docs() {
    pkgdesc="Andrew's Web Libraries - API documentation"
    depends=()

    cd "${pkgbase}-r${pkgver}"

    # create directory
    mkdir -vp "${pkgdir}/usr/share/doc/${pkgbase}"

    # build documentation
    sed \
      -e 's/^STRIP_FROM_PATH.*/STRIP_FROM_PATH = ..\//' \
      -e "s/^PROJECT_NUMBER.*/PROJECT_NUMBER = ${pkgver}/" \
      docs/Doxyfile | doxygen -

    # install package documentation
    cp -vra docs/api/* "${pkgdir}/usr/share/doc/${pkgbase}"
}
