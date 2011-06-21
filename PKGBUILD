# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is RelWithDebInfo to help with debugging.

_buildtype="RelWithDebInfo"

##############################################################

pkgname=tomahawk
pkgver=0.1.0
pkgrel=3
pkgdesc="A Music Player App written in C++/Qt"
arch=('i686' 'x86_64')
url="http://tomahawk-player.org/"
license=('GPL3')
depends=('phonon>=4.5.0' 'taglib>=1.6.2' 'boost>=1.30' 'clucene>=2.3.3.4' 'libechonest>=1.1.8' 'jreen-git>=20110605' 'qtweetlib-git')
makedepends=('git' 'cmake>=2.8.0')
provides=('tomahawk')
conflicts=('tomahawk-git')
options=(!strip)
source=(http://download.tomahawk-player.org/${pkgname}-${pkgver}.tar.bz2
        0001-Fixes-due-to-changed-Jreen-API.patch)
md5sums=('e7c06eac747db2f6f9f04cbb0fd5024a'
         'd67cc8bbd35fcbd4a5429b2abad25a48')
install=tomahawk.install

# Clean options array to strip pkg if release buildtype is chosen
if [[ ${_buildtype} == "Release" ]] || [[ ${_buildtype} == "release" ]]; then
  options=()
fi

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 -i ${srcdir}/0001-Fixes-due-to-changed-Jreen-API.patch

  msg "Starting build..."

  rm -rf ${srcdir}/${pkgname}-${pkgver}-build
  cp -r ${srcdir}/${pkgname}-${pkgver} ${srcdir}/${pkgname}-${pkgver}-build
  cd ${srcdir}/${pkgname}-${pkgver}-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=${_buildtype}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
