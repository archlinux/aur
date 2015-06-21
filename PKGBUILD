# $Id$
# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=('ogre-1.8')
pkgver=1.8.1
pkgrel=4
pkgdesc='Scene-oriented, flexible 3D engine written in C++. Version 1.8.'
arch=('i686' 'x86_64')
url='http://www.ogre3d.org'
license=('custom:MIT')
depends=('boost-libs' 'freeimage' 'freetype2' 'libxaw' 'libxrandr'
         'nvidia-cg-toolkit' 'zziplib' 'ois' 'glu')
makedepends=('boost' 'cmake' 'doxygen' 'graphviz' 'ttf-dejavu' 'mesa')
install=ogre-1.8.install
_dir="OGRE-1.8"
_src_dir="ogre_src_v${pkgver//./-}"
source=("${_dir}.tar.bz2::http://downloads.sourceforge.net/ogre/ogre_src_v${pkgver//./-}.tar.bz2"
        "freetype.patch")
md5sums=('b85e3dcf370a46b3a8624d4fdd722d39'
         '65fd7049ed67142fdb363df821bd40e8')
conflicts=()
provides=('ogre')


build() {
  cd ${srcdir}/${_src_dir}

  # patching CMake script for Freetype
  patch -p1 -i ${startdir}/freetype.patch

  # get a clean build dir
  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  # generate CMake Makefile
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/opt/${_dir} \
    -DOGRE_INSTALL_PLUGINS_HEADERS=TRUE \
    -DOGRE_INSTALL_SAMPLES=TRUE \
    -DOGRE_INSTALL_DOCS=FALSE \
    -DOGRE_INSTALL_MEDIA=TRUE \
    -DOGRE_INSTALL_SAMPLES_SOURCE=TRUE \
    -DCMAKE_BUILD_TYPE=Release # set =Debug for debugging version

  # compile
  make
}

package() {
  cd ${srcdir}/${_src_dir}/build

  # install the bugger
  make DESTDIR=${pkgdir} install

  # rename pkg-config files
  #for files in ${pkgdir}/opt/${_dir}/lib/pkgconfig/*.pc
  #do
  #  mv "$files" "${files%.pc}-1.8.pc"
  #done

  # fix up samples
  #install -dm775 -o root -g users ${pkgdir}/opt/${_dir}/samples/
  #mv ${pkgdir}/opt/${_dir}/share/${_dir}/*.cfg ${pkgdir}/opt/${_dir}/samples/
  #mv ${pkgdir}/opt/${_dir}/bin/SampleBrowser ${pkgdir}/opt/${_dir}/samples/

  # make sample launcher
  #echo "#!/bin/bash" > ${pkgdir}/opt/${_dir}/bin/OgreSampleBrowser
  #echo "cd /opt/${_dir}/samples && ./SampleBrowser" >> ${pkgdir}/opt/${_dir}/bin/OgreSampleBrowser
  #chmod +x ${pkgdir}/opt/${_dir}/bin/OgreSampleBrowser

  # install license
  install -Dm644 ../Docs/License.html ${pkgdir}/usr/share/licenses/${pkgname}/license.html
}

# vim:set ts=2 sw=2 et:
