# $Id$
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Vamp898 <vamp898@web.de>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=kmymoney
pkgname=${_pkgname}-git
pkgver=4.100.90+1409+gd16c1ae9
pkgrel=1
pkgdesc="Personal finance manager for KDE which operates similarly to MS-Money or Quicken"
arch=('x86_64')
url="https://github.com/KDE/kmymoney"
license=('GPL')
depends=('kdewebkit' 'aqbanking' 'libalkimia-qt5' 'libical'
         'kcmutils' 'kitemmodels' 'kdiagram' 'kross' 'kactivities')
makedepends=('extra-cmake-modules' 'doxygen' 'kdoctools')
conflicts=("${_pkgname}")
provides=("${pkgname}=${pkgver%%+}")
source=("${_pkgname}::git+https://github.com/KDE/kmymoney#branch=5.0")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver=$( grep -i "kmymoney version" CMakeLists.txt | sed 's:.*\"\(.*\)\".*:\1:' )
  git describe --long --tags | sed "s/-/+/g" | sed "s:[^+]*+\(.*\):${_ver}+\1:"
}

build() {
  cd "${srcdir}/${_pkgname}"

  [ -d build ] && rm -fr build
  mkdir build
  cd build

  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_SKIP_RPATH=YES
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  make DESTDIR="${pkgdir}" install
  
  # There must be a better way to do this. WTF cmake
  mv "${pkgdir}"/usr/lib64/* "${pkgdir}"/usr/lib
  rm -fr "${pkgdir}"/usr/lib64
}
