# $Id$
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Vamp898 <vamp898@web.de>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Maintainer:  twa022 <twa022 at gmail dot com>

# Use the master branch if _branch is not defined
_branch='' #"5.0"

_pkgname=kmymoney
pkgname=${_pkgname}-git
pkgver=5.0.1+186+g8bdae558
pkgrel=1
pkgdesc="Personal finance manager for KDE which operates similarly to MS-Money or Quicken"
arch=('x86_64' 'i686')
url="https://github.com/KDE/kmymoney"
license=('GPL')
depends=('aqbanking' 'boost-libs' 'libalkimia' 'sqlcipher' 'qt5-base' 'qgpgme' 'karchive'
         'kcoreaddons' 'kconfig' 'kwidgetsaddons' 'ki18n' 'kcompletion' 'kcmutils' 'kitemmodels'
         'kitemviews' 'kservice' 'kwallet' 'kiconthemes' 'kxmlgui' 'kidentitymanagement'
         'ktextwidgets' 'knotifications' 'kio' 'kdoctools' 'kholidays' 'kross' 'kactivities'
         'kqtquickcharts' 'kdiagram' 'kdewebkit' 'kcontacts' 'libical' 'akonadi' 'shared-mime-info')
makedepends=('boost' 'extra-cmake-modules' 'doxygen' 'git')
conflicts=("${_pkgname}")
provides=("${pkgname}=${pkgver%%+}")
source=()
[[ "${_branch}" == '' ]] && _branch='master'
source=("${_pkgname}::git+https://github.com/KDE/kmymoney#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  #_ver=$( grep -i "kmymoney version" CMakeLists.txt | sed 's:.*\"\(.*\)\".*:\1:' )
  git describe --long --tags | sed "s/^v//;s/-/+/g" # | sed "s:[^+]*+\(.*\):${_ver}+\1:"
}

build() {
  cd "${srcdir}/${_pkgname}"

  [ -d build ] && rm -fr build
  mkdir build
  cd build

  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_SKIP_RPATH=YES \
    -Wno-dev
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  make DESTDIR="${pkgdir}" install
}
