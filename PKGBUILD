# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contriburo: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Andre Wayand <aur-awl@awayand.sleepmail.com>

pkgbase=awl
pkgname=('awl' 'awl-docs')
pkgver=0.62
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
b2sums=('b0e8ac8a2baaeb3ee6b47ce470f098fb64a9894c3da130a085e4f20d96092836910c368d776e489e3d050fa6a9edcf06c89b1cd8c22632638effb07c1ea440a9')

package_awl() {
    pkgdesc="Andrew's Web Libraries - PHP Utility Libraries"
    depends=('php')
    optdepends=('awl-docs')

    cd "${srcdir}/${pkgbase}-r${pkgver}"

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

    cd "${srcdir}/${pkgbase}-r${pkgver}"

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
