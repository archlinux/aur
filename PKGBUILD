# $Id$
# Maintainer: Firas Zaidan <firas@zaidan.de>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
_dir="OGRE-1.9"
pkgname=('ogre-1.9')
pkgver=1.9.0
pkgrel=17
pkgdesc='Scene-oriented, flexible 3D engine written in C++'
arch=('i686' 'x86_64')
url='http://www.ogre3d.org'
license=('custom:MIT')
depends=('boost-libs' 'freeimage' 'freetype2' 'libxaw' 'libxrandr'
         'nvidia-cg-toolkit' 'zziplib' 'ois' 'glu' 'tinyxml')
makedepends=('boost' 'cmake' 'doxygen' 'graphviz' 'ttf-dejavu' 'mesa' 'mercurial')
install=ogre-1.9.install
source=("hg+http://bitbucket.org/sinbad/ogre#tag=v${pkgver//./-}"
        ogre-template-fix.patch::https://bitbucket.org/sinbad/ogre/commits/a24ac4afbbb9dc5ff49a61634af50da11ba8fb97/raw/
        ogre-cmake30.patch::https://bitbucket.org/sinbad/ogre/commits/d84bce645d3dd439188d3d29d8da51c51765a085/raw/)
md5sums=('SKIP'
         '3debee4514a33a0a642370aecdc41975'
         '116fb8009c8d4b499f9a885052cc0ea6')

prepare() {
  cd ogre

  patch -Np1 < $srcdir/ogre-template-fix.patch
  patch -Np1 < $srcdir/ogre-cmake30.patch
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
    -DOGRE_INSTALL_DOCS=FLASE \
    -DOGRE_INSTALL_SAMPLES_SOURCE=TRUE \
    -DCMAKE_BUILD_TYPE=Release

  make

  make OgreDoc
}

package() {
  optdepends=('cppunit: unit testing'
              'intel-tbb: better threading support'
              'poco: portability'
              'boost: for developing using ogre'
              'ogre-docs: documentation')

  cd ogre/build

  make DESTDIR=${pkgdir} install

  install -Dm644 ../Docs/License.html ${pkgdir}/usr/share/licenses/${pkgname}/license.html

  # Create symlinks in /usr/lib
  mkdir -p ${pkgdir}/usr/lib/OGRE/Samples
  find ${pkgdir}/opt/${_dir}/lib -name "*so.${pkgver}" -exec sh -c 'ln -s `echo "$1" | sed -e "s/^.*opt/\/opt/g"` `echo "$1" | sed -e "s/opt\/OGRE-1.9/usr/g"`' sh {} \;
}

# vim:set ts=2 sw=2 et:
