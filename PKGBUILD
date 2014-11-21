# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.

_buildtype='Release'

##############################################################

pkgname=tomahawk
pkgver=0.8.2
pkgrel=1
pkgdesc='A Music Player App written in C++/Qt'
arch=('i686' 'x86_64')
url='http://tomahawk-player.org/'
license=('GPL3')
depends=('phonon-qt4' 'taglib' 'lucene++' 'libechonest' 'jreen' 'quazip' 'attica' 'qtwebkit' 'liblastfm' 'qtkeychain' 'qca-ossl')
makedepends=('cmake' 'automoc4' 'sparsehash' 'boost' 'websocketpp')
optdepends=('kdelibs: integration with Plasma Desktop' 'telepathy-qt4: integration with Telepathy')
provides=('tomahawk')
conflicts=('tomahawk-git')
source=("http://download.tomahawk-player.org/${pkgname}-${pkgver}.tar.bz2")
md5sums=('a63128cad97035d9b872000a3f8c6d5f')
install=tomahawk.install

if [[ ! ${_buildtype} == 'Release' ]] && [[ ! ${_buildtype} == 'release' ]]; then
  options=('debug')
fi

prepare() {
  if [[ -e ${srcdir}/${pkgname}-${pkgver}-build ]]; then rm -rf ${srcdir}/${pkgname}-${pkgver}-build; fi
  mkdir ${srcdir}/${pkgname}-${pkgver}-build
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib/${pkgname} \
        -DCMAKE_BUILD_TYPE=${_buildtype} \
        ../${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
