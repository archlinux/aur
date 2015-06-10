# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgbase=mingw-w64-mygui
pkgname=('mingw-w64-mygui')
pkgver=3.2.2
pkgrel=1
pkgdesc="A multilayer and overlappable GUI System for OGRE (mingw-w64)"
arch=('any')
url="http://mygui.info/"
license=('LGPL')
depends=('mingw-w64-crt' 'mingw-w64-boost' 'mingw-w64-ogre' 'mingw-w64-ois' 'mingw-w64-pkg-config')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-cmake' 'mingw-w64-gcc' 'mingw-w64-pkg-config' 'doxygen' 'graphviz' 'ttf-dejavu')
source=("https://github.com/MyGUI/mygui/archive/MyGUI$pkgver.tar.gz"
        'findogre.patch'
        'platforms.patch'
        'cmakeinstall.patch'
        'cmake-boost-system.patch')
md5sums=('0023a689a2a63febc2cc703f81f86c62'
         'bb4b844665e339fe1f5e596b8997d162'
         'd0fb901ad31fb43357d88ce091999652'
         '03369fc85c24a92af9a24b6e530fac40'
         '69c53e5e0b57a9537092dbaf0a0d03c2')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd $srcdir/mygui-MyGUI$pkgver

  patch -Np1 < ../findogre.patch
  patch -Np1 < ../platforms.patch
  patch -Np1 < ../cmakeinstall.patch
  patch -Np1 < ../cmake-boost-system.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    unset LDFLAGS CXXFLAGS
    ${_arch}-cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DCMAKE_BUILD_TYPE="release" \
      -DMYGUI_SAMPLES_INPUT=2 \
      -DMYGUI_BUILD_DEMOS="False" \
      -DMYGUI_BUILD_TOOLS="False" \
      ../mygui-MyGUI$pkgver
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}
    make DESTDIR=${pkgdir} install

    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/release/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/release/*.a
  done
}

# vim:set ts=2 sw=2 et:
