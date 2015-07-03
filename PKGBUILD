# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=('ogre-2.0')
pkgver=2.0.0RC1
pkgrel=1
pkgdesc='Scene-oriented, flexible 3D engine written in C++'
arch=('i686' 'x86_64')
url='http://ogre3d.org'
license=('MIT')
depends=('boost-libs' 'freeimage' 'freetype2' 'libxaw' 'libxrandr'
         'nvidia-cg-toolkit' 'zziplib' 'ois' 'glu' 'tinyxml')
makedepends=('boost' 'cmake' 'doxygen' 'graphviz' 'ttf-dejavu' 'mesa' 'mercurial')
_dir="OGRE-2.0"
source=("hg+http://bitbucket.org/sinbad/ogre#tag=v${pkgver//./-}")
sha512sums=('SKIP')

prepare() {
  cd ogre
}

build() {
  cd ogre

  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  # Silence warnings about deprecated declarations
  CXXFLAGS+=' -Wno-deprecated-declarations'

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/opt/${_dir} \
    -DOGRE_INSTALL_SAMPLES=TRUE \
    -DOGRE_INSTALL_DOCS=TRUE \
    -DOGRE_INSTALL_SAMPLES_SOURCE=TRUE \
    -DCMAKE_BUILD_TYPE=Release

  make

  make OgreDoc
}

package() {
  optdepends=('cppunit: unit testing'
              'intel-tbb: better threading support'
              'poco: portability'
              'boost: for developing using ogre')

  cd ogre/build

  make DESTDIR=${pkgdir} install

  install -Dm644 ../Docs/License.html ${pkgdir}/usr/share/licenses/${pkgname}/license.html
}
