# Maintainer: Michael Gruz <michael.gruz@gmail.com>

pkgbase=cura-5-plugin-octoprint
pkgname=(cura5-plugin-octoprint cura-5-plugin-octoprint)
pkgver=3.7.3
_pkgname=Cura-OctoPrintPlugin-${pkgver}
pkgrel=2
arch=('any')
license=('GPL3')
url="https://github.com/fieldofview/OctoPrintPlugin"
depends=('python' 'python-zeroconf')
makedepends=('git' 'cmake')
source=("https://github.com/fieldOfView/Cura-OctoPrintPlugin/archive/refs/tags/v${pkgver}.tar.gz"
        "git+https://github.com/jstasiak/python-zeroconf.git"
        "git+https://github.com/pydron/ifaddr.git"
        "CMakeLists.txt.patch")
sha256sums=('6549bbafc1ac5e00e6baa57f7e2ff10ed05a37553fc647543758be1d2912fcf7'
            'SKIP'
            'SKIP'
            '080788bd6a25644c4f7120f1d570a63ce389db117553df685a940ddab29a6db2')

prepare() {
  cd $srcdir/$_pkgname
  git submodule init
  git config submodule.python-zeroconf.url $srcdir/python-zeroconf
  git config submodule.ifaddr.url $srcdir/ifaddr
  git submodule update
  patch -Np0 < $srcdir/CMakeLists.txt.patch
}

build() {
  mkdir -p ${srcdir}/${_pkgname}/build5
  cd ${srcdir}/${_pkgname}/build5
  cmake -DCMAKE_INSTALL_PREFIX=/usr/lib/cura ..
  make

  mkdir -p ${srcdir}/${_pkgname}/build-5
  cd ${srcdir}/${_pkgname}/build-5
  cmake -DCMAKE_INSTALL_PREFIX=/opt/cura5/share ..
  make
}

package_cura5-plugin-octoprint() {
  pkgdesc="Cura plugin which enables printing directly to OctoPrint and monitoring the progress"
  conflicts=('cura5-plugin-octoprint-git')
  cd ${srcdir}/${_pkgname}/build5
  make DESTDIR="$pkgdir/" install
}

package_cura-5-plugin-octoprint() {
  pkgdesc="Cura AppImage plugin which enables printing directly to OctoPrint and monitoring the progress"
  conflicts=('cura-5-plugin-octoprint-git')
  cd ${srcdir}/${_pkgname}/build-5
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:


