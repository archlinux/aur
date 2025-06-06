# Maintainer: Andrzej Wąsowski <wasowski [at] data [dot] pl>
# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contriburo: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Andre Wayand <aur-awl@awayand.sleepmail.com>

pkgbase=awl
pkgname=('awl' 'awl-docs')
pkgver=0.64
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
sha512sums=('c3fd27286a663a4493500133185a245046ec41672cf37a64d6edaea87f159b173f590fda180082758b11e75404a2bec717ea692dc6e949a2f284f0376e045fc0')
b2sums=('a3220495661c6299e7b7be87b830ea7f95b3ff39efc916566534223c5f8fa09a086d9341b4419614451af9a45b9fcfae6e72641bd01498245a2c21211150cadc')

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
