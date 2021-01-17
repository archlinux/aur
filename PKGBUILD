# Maintainer: Christoph Brill <egore911@gmail.com>
pkgbase=ogre-1.10
pkgname=('ogre-1.10' 'ogre-docs-1.10')
pkgver=1.10.12
pkgrel=1
pkgdesc='Scene-oriented, flexible 3D engine written in C++'
arch=('x86_64')
url='https://www.ogre3d.org'
license=('custom:MIT')
depends=('freeimage' 'freetype2' 'libxaw' 'libxrandr' 'openexr'
         'nvidia-cg-toolkit' 'zziplib' 'sdl2' 'glu' 'tinyxml'
         'boost-libs')
makedepends=('cmake' 'doxygen' 'graphviz' 'ttf-dejavu' 'mesa' 'python' 'swig' 'systemd')
provides=('ogre=1.10' 'ogre-docs=1.10')
source=("https://github.com/OGRECave/ogre/archive/v${pkgver}.tar.gz")
sha512sums=('c2a16b7b80759b1ee02cd95bce6dc8fa21d66148aa3573b54cc6ee42b29a3ca389aeb2e1c74fb24ef2d08fd60b8758ea71a08f4279b34b77ca5d11e95310ab65')

prepare() {
  mkdir -p ogre-${pkgver}/build
}

build() {
  cd ogre-${pkgver}/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOGRE_BUILD_DEPENDENCIES=FALSE \
    -DCMAKE_BUILD_TYPE=Release \
    -DOGRE_BUILD_PLUGIN_FREEIMAGE=TRUE \
    -DOGRE_BUILD_PLUGIN_EXRCODEC=TRUE \
    -DOGRE_INSTALL_SAMPLES=TRUE \
    -DOGRE_INSTALL_SAMPLES_SOURCE=TRUE \
    -DOGRE_BUILD_COMPONENT_PYTHON=TRUE

  make
  make OgreDoc
}

package_ogre-1.10() {
  optdepends=('cppunit: unit testing'
              'python: python bindings'
              'ogre-docs: documentation')

  cd ogre-${pkgver}/build

  make DESTDIR=${pkgdir} install

  install -Dm644 ../Docs/License.md ${pkgdir}/usr/share/licenses/${pkgname}/license

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
