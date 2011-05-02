# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################
# How many jobs should 'make' use (for multicore CPUs)?
# Value is 2 by default because it doesn't hurt but can help.

_jobcount="2"

##############
# Do we build with jreen? Otherwise gloox will be used.
# Don't use jreen unless gloox plugin doesn't want to co-operate!
# Possible values: on, off

_enablejreen="off"

##############
# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is DebugFull to help with debugging.

_buildtype="RelWithDebInfo"

##############################################################

pkgname=tomahawk
pkgver=0.0.3
pkgrel=2
pkgdesc="A Music Player App written in C++/Qt"
arch=('i686' 'x86_64')
url="http://tomahawk-player.org/"
license=('GPL3')
##############################################################
# Attention! Add new depends entries at the beginning of the array to not break gloox/jreen auto-switch
#############################################################
depends=('taglib>=1.6.2' 'boost>=1.30' 'clucene-git' 'libmad>=0.15.1b' 'libechonest-git' 'liblastfm>=0.3.3' 'gloox>=1.0')
makedepends=('git' 'cmake>=2.8.0')
provides=('tomahawk')
conflicts=('tomahawk-git')
options=(!strip)
changelog=ChangeLog
source=(http://download.tomahawk-player.org/tomahawk-${pkgver}.tar.bz2)
md5sums=('a2716c41c7c7720e4dd8336c6b73609c')

# Swap last entry in depends array to match jreen's deps
if [[ ${_enablejreen} == "on" ]]; then
  depends[${#depends[@]}-1]='qca'
  depends+=('libidn')
fi

# Clean options array to strip pkg if release buildtype is chosen
if [[ ${_buildtype} == "Release" ]] || [[ ${_buildtype} == "release" ]]; then
  options=()
fi

build() {

  # Get/update jreen if enabled. May be unneeded for a release version!
  if [[ ${_enablejreen} == "on" ]]; then
    cd ${srcdir}/${pkgname}/thirdparty
    if [[ $(find -type d -empty|grep jreen|wc -l) -eq 1 ]]; then
      msg "Obtaining jreen..."
      cd ${srcdir}/${pkgname}
      git submodule init && git submodule update
    else
      msg "Updating jreen..."
      cd ../
      git submodule update
    fi
  fi

  msg "Starting build..."

  rm -rf ${srcdir}/${pkgname}-${pkgver}-build
  cp -r ${srcdir}/${pkgname}-${pkgver} ${srcdir}/${pkgname}-${pkgver}-build
  cd ${srcdir}/${pkgname}-${pkgver}-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_JREEN=${_enablejreen} -DCMAKE_BUILD_TYPE=${_buildtype}
  make -j ${_jobcount}
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
