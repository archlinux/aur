# Maintainer Jens Staal <staal1978@gmail.com>
# Big thanks to: ids1024 !
# old maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=blackpenguin
pkgver=0.2
pkgrel=4
pkgdesc="An arcade style jump-on-cubes game with Penguin and Evil Window"
arch=('i686' 'x86_64')
url="http://www.ibiblio.org/pub/linux/games/arcade/"
license=('GPL')
depends=('libxext' 'qt5-base')
#in order to go more modern, more invasive changes are needed
#qt5 does not provide the qt3 compat headers and libs
source=("http://www.ibiblio.org/pub/linux/games/arcade/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.patch"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "qt2to4.patch"
        "blackpenguin-qt5.patch")
md5sums=('91ac8ac0f5588122c469e3f65b98c3df'
         'f3ca77928e512e263fbf9e769d614260'
         '9204e564d47ea7ce9592232e2bd31c92'
         '55d2533c522dae44e9ac739a6fb287c0'
         '5705ea4929b6eea8b4d39a4052ff5743'
         'e9f73a47936e2eaeafe1f492cac53427')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  rm blackpenguin #ensure that a new binary is made
  patch -Np2 -i ../../${pkgname}.patch
  patch -Np2 -i ../../qt2to4.patch
  mv appwindow.cpp{.alt,}
  patch -Np2 -i ../../blackpenguin-qt5.patch

  qmake-qt5 -makefile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  install -Dm755 src/${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install a readme file
  install -Dm644 doc/README "${pkgdir}/usr/share/${pkgname}/README"
}

# vim:set ts=2 sw=2 et:
