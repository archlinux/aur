# Maintainer: Tolga Hosgor <fasdfasdas@gmail.com>

pkgname=('ogre-2.1')
pkgver=r9291.da035e05b
pkgrel=1
pkgdesc='Scene-oriented, flexible 3D engine written in C++'
arch=('i686' 'x86_64')
url='http://ogre3d.org'
license=('MIT')
depends=('freeimage' 'freetype2' 'libxaw' 'libxrandr'
         'zziplib' 'ois' 'glu' 'tinyxml')
makedepends=('cmake' 'doxygen' 'graphviz' 'ttf-dejavu' 'mesa' 'git')
provides=('ogre' 'ogre-docs')
conflicts=('ogre' 'ogre-docs')
source=("git+https://github.com/OGRECave/ogre.git#branch=v2-1")
sha512sums=('SKIP')

prepare() {
  cd ogre
}

pkgver() {
  cd ogre
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ogre

  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  # Silence warnings about deprecated declarations
  CXXFLAGS+=' -Wno-deprecated-declarations'

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOGRE_INSTALL_DOCS=1 \
    -DOGRE_INSTALL_SAMPLES=1 \
    -DOGRE_BUILD_SAMPLES2=1 \
    -DOGRE_USE_BOOST=0 \
    -DOGRE_CONFIG_THREAD_PROVIDER=std \
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


  # symlink for docs
  install -dm755 ${pkgdir}/usr/share/OGRE/
  mkdir -p ${pkgdir}/usr/share/doc
  cd ${pkgdir}/usr/share/doc
  ln -s OGRE/docs OGRE
 
}
