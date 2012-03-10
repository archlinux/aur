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
pkgver=0.4.0
pkgrel=2
pkgdesc="A Music Player App written in C++/Qt"
arch=('i686' 'x86_64')
url="http://tomahawk-player.org/"
license=('GPL3')
depends=('phonon' 'taglib' 'boost' 'clucene' 'libechonest' 'jreen' 'qtweetlib' 'quazip' 'attica' 'qtwebkit')
makedepends=('git' 'cmake')
optdepends=('tomahawk-spotify-git: spotify resolver')
provides=('tomahawk')
conflicts=('tomahawk-git')
options=(!strip)
source=("http://download.tomahawk-player.org/${pkgname}-${pkgver}.tar.bz2"
	'0001-Use-new-QTweetLib-0.5-API-for-PIN-values-so-leading-.patch')
md5sums=('444f610e432281025bcac00aad0b0a90'
	'25605d9c899601c3e2e71537cfdafcd6')
install=tomahawk.install

# Clean options array to strip pkg if release buildtype is chosen
if [[ ${_buildtype} == "Release" ]] || [[ ${_buildtype} == "release" ]]; then
  options=()
fi

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  patch -p3 -d src/sip -i ${startdir}/0001-Use-new-QTweetLib-0.5-API-for-PIN-values-so-leading-.patch

  msg "Starting build..."

  if [[ -e ${srcdir}/${pkgname}-${pkgver}-build ]]; then rm -rf ${srcdir}/${pkgname}-${pkgver}-build; fi
  mkdir ${srcdir}/${pkgname}-${pkgver}-build
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
