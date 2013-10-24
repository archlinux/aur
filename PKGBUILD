# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is RelWithDebInfo to help with debugging.

_buildtype="Release"

##############################################################

pkgname=jreen
pkgver=1.1.1
pkgrel=4
pkgdesc="Free and Opensource Jabber library, written in C++ using cross-platform framework Qt."
arch=('i686' 'x86_64')
url="http://qutim.org/jreen"
license=('GPL2')
depends=('libidn' 'qca-ossl' 'zlib')
makedepends=('cmake')
provides=('jreen')
conflicts=('jreen-git')
source=("${pkgname}-${pkgver}.zip::http://github.com/euroelessar/${pkgname}/archive/v${pkgver}.zip"
	'jreenMacros.cmake.patch')
md5sums=('07e64faaae4be7cf2c99eac07f80fb8f'
         '397e75be409ea7e8bddff88b6f977f5f')

# Clean options array to strip pkg if release buildtype is chosen
if [[ ! ${_buildtype} == "Release" ]] && [[ ! ${_buildtype} == "release" ]]; then
  options=(!strip)
fi

prepare() {
  if [[ -e ${srcdir}/${pkgname}-${pkgver}-build ]]; then rm -rf ${srcdir}/${pkgname}-${pkgver}-build; fi
  mkdir ${srcdir}/${pkgname}-${pkgver}-build

  cd ${srcdir}/${pkgname}-${pkgver}/cmake
  patch -i ${srcdir}/jreenMacros.cmake.patch
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-build

  cmake -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=${_buildtype} \
        ../${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
