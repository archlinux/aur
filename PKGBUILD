# $Id$
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgbase=ogre-1.10
pkgname=('ogre-1.10' 'ogre-docs-1.10')
pkgver=1.10.11
pkgrel=4
pkgdesc='Scene-oriented, flexible 3D engine written in C++'
arch=('x86_64')
url='http://www.ogre3d.org'
license=('custom:MIT')
depends=('boost-libs' 'freeimage' 'freetype2' 'libxaw' 'libxrandr'
         'nvidia-cg-toolkit' 'zziplib' 'sdl2' 'glu' 'tinyxml')
makedepends=('boost' 'cmake' 'doxygen' 'graphviz' 'ttf-dejavu' 'mesa' 'python' 'swig' 'systemd')
provides=('ogre=1.10' 'ogre-docs=1.10')
install=ogre.install
source=("https://github.com/OGRECave/ogre/archive/v${pkgver}.tar.gz")
sha512sums=('2dfedd6f0a0de1a8c687c001439138b233200ca11e5c9940debf43d8a0380ca6472e0b5f4d599f0e22ca2049d0a5d34066ef41b6bc4912130694fa5d851fc900')

prepare() {
  cd ogre-${pkgver}

  sed -i "s/dist-packages/site-packages/" Components/Python/CMakeLists.txt
}

build() {
  cd ogre-${pkgver}

  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOGRE_INSTALL_SAMPLES=TRUE \
    -DOGRE_INSTALL_DOCS=TRUE \
    -DOGRE_INSTALL_SAMPLES_SOURCE=TRUE \
    -DOGRE_BUILD_DEPENDENCIES=FALSE \
    -DOGRE_BUILD_COMPONENT_PYTHON=TRUE \
    -DOGRE_BUILD_COMPONENT_JAVA=FALSE \
    -DCMAKE_BUILD_TYPE=Release

  make
  make OgreDoc
}

package_ogre-1.10() {
  optdepends=('cppunit: unit testing'
              'intel-tbb: better threading support'
              'poco: portability'
              'python: python bindings'
              'boost: for developing using ogre'
              'ogre-docs: documentation')

  cd ogre-${pkgver}/build

  make DESTDIR=${pkgdir} install

  mv ${pkgdir}/usr/bin/SampleBrowser ${pkgdir}/usr/bin/OgreSampleBrowser
  install -Dm644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # move docs out of this package
  mv ${pkgdir}/usr/share/OGRE/docs ${srcdir}/docs
}

package_ogre-docs-1.10() {
  pkgdesc="Documentation for ogre"
  depends=()

  cd ogre-${pkgver}/build

  # move docs into this package
  install -dm755 ${pkgdir}/usr/share/doc
  mv ${srcdir}/docs ${pkgdir}/usr/share/doc/OGRE/

  # symlink for docs
  install -dm755 ${pkgdir}/usr/share/OGRE/
  cd ${pkgdir}/usr/share
  ln -s /usr/share/doc/OGRE/ OGRE/docs
}

# vim:set ts=2 sw=2 et:
