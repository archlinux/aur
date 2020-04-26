# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contriburo: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Andre Wayand <aur-awl@awayand.sleepmail.com>

pkgbase=awl
pkgname=('awl' 'awl-docs')
pkgver=0.61
pkgrel=1
pkgdesc="Andrew's Web Libraries"
arch=('any')
url="https://gitlab.com/davical-project/awl/"
license=('GPL2')
depends=('php')
makedepends=('doxygen' 'graphviz')
options=('!strip')
install=${pkgbase}.install
source=("${pkgbase}-${pkgver}.tar.bz2::https://gitlab.com/davical-project/${pkgbase}/repository/archive.tar.bz2?ref=r${pkgver}")
sha512sums=('50c5bf5c757b154ea044dee34d2977a084f3524374867ed45366aeeda28a8dec053b0471ebd8e7231f352312c43f72eb8e9cd2e9521b0f44f25a4db87483779d')

package_awl() {
    pkgdesc="Andrew's Web Libraries - PHP Utility Libraries"
    depends=('php')
    optdepends=('awl-docs')

    cd "${srcdir}/${pkgbase}-r${pkgver}-"*

    # create directory
    mkdir -p "${pkgdir}/usr/share/${pkgbase}"

    # update package version
    sed -s \
      "/^ *.c->awl_library_version *=.*$/ s/^ *.c->awl_library_version *=.*$/\$c->awl_library_version = ${pkgver};/" \
      inc/AWLUtilities.php.in > inc/AWLUtilities.php

    # remove template
    rm -f inc/AWLUtilities.php.in

    # install package
    cp -ra dba inc "${pkgdir}/usr/share/${pkgbase}"
}

package_awl-docs() {
    pkgdesc="Andrew's Web Libraries - API documentation"
    depends=()

    cd "${srcdir}/${pkgbase}-r${pkgver}-"*

    # create directory
    mkdir -p "${pkgdir}/usr/share/doc/${pkgbase}"

    # build documentation
    sed \
      -e 's/^STRIP_FROM_PATH.*/STRIP_FROM_PATH = ..\//' \
      -e "s/^PROJECT_NUMBER.*/PROJECT_NUMBER = ${pkgver}/" \
      docs/Doxyfile | doxygen -

    # install package documentation
    cp -ra docs/api/* "${pkgdir}/usr/share/doc/${pkgbase}"
}
