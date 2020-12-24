# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=('ogre-git')
pkgver=2.2.0.r8509.37e9fc7b8ae8
pkgrel=1
pkgdesc='Scene-oriented, flexible 3D engine written in C++'
arch=('i686' 'x86_64')
url='http://ogre3d.org'
license=('MIT')
depends=('boost-libs' 'freeimage' 'freetype2' 'libxaw' 'libxrandr'
         'nvidia-cg-toolkit' 'zziplib' 'ois' 'glu' 'tinyxml')
makedepends=('boost' 'cmake' 'doxygen' 'graphviz' 'ttf-dejavu' 'mesa' 'mercurial')
provides=('ogre' 'ogre-docs')
conflicts=('ogre' 'ogre-docs')
_dir="OGRE"
source=("git+https://github.com/OGRECave/ogre.git")
sha512sums=('SKIP')

prepare() {
  cd ogre
}

pkgver() {
  cd ogre
  printf "2.2.0.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd ogre

  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  # Silence warnings about deprecated declarations
  CXXFLAGS+=' -Wno-deprecated-declarations'

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOGRE_INSTALL_SAMPLES=TRUE \
    -DOGRE_INSTALL_DOCS=TRUE \
    -DOGRE_BUILD_COMPONENT_PAGING=TRUE \
    -DOGRE_BUILD_COMPONENT_PROPERTY=TRUE \
    -DOGRE_BUILD_COMPONENT_RTSHADERS=TRUE \
    -DOGRE_BUILD_COMPONENT_TERRAIN=TRUE \
    -DOGRE_BUILD_COMPONENT_VOLUME=TRUE \
    -DOGRE_BUILD_PLUGIN_CG=TRUE \
    -DOGRE_BUILD_RENDERSYSTEM_GL3Plus=TRUE \
    -DOGRE_BUILD_RENDERSYSTEM_GLES2=TRUE \
    -DOGRE_BUILD_SAMPLES=TRUE \
    -DOGRE_BUILD_SAMPLES2=TRUE \
    -DOGRE_CONFIG_ENABLE_QUAD_BUFFER=TRUE \
    -DOGRE_CONFIG_THREADS=2 \
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
  cd ${pkgdir}/usr/share
  ln -s /usr/share/doc/OGRE/ OGRE/docs  
 
}
