# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is RelWithDebInfo to help with debugging.

_buildtype="RelWithDebInfo"

##############################################################

pkgname=qtweetlib-git
pkgver=20130303
pkgrel=1
pkgdesc="C++ Qt based Twitter library - development version"
arch=('i686' 'x86_64')
url="https://github.com/minimoog/QTweetLib"
license=('GPL2')
depends=('qjson')
makedepends=('git' 'cmake')
provides=('qtweetlib')
conflicts=('qtweetlib')
options=(!strip)

# Clean options array to strip pkg if release buildtype is chosen
if [[ ${_buildtype} == "Release" ]] || [[ ${_buildtype} == "release" ]]; then
  options=()
fi

_gitroot="git://github.com/minimoog/QTweetLib.git"
_gitname="QTweetLib"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin master
  else
    git clone --depth 1 ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"

  if [[ -e ${srcdir}/${_gitname}-build ]]; then rm -rf ${srcdir}/${_gitname}-build; fi
  mkdir ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  cmake -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=${_buildtype} \
        ../${_gitname}
  make
}

package() {
  cd ${srcdir}/${_gitname}-build
  make DESTDIR=${pkgdir} install
}
