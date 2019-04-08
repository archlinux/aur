# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-libbluray
pkgver=1.1.1
pkgrel=1
pkgdesc='Library to access Blu-Ray disks for video playback (mingw-w64)'
arch=('any')
url='http://www.videolan.org/developers/libbluray.html'
license=('LGPL2.1')
depends=('mingw-w64-crt' 'mingw-w64-fontconfig' 'mingw-w64-freetype2' 'mingw-w64-libxml2')
options=(!strip !buildflags !libtool staticlibs)
makedepends=('mingw-w64-configure' 'mingw-w64-gcc' 'mingw-w64-pkg-config' 'git')
#makedepends=('apache-ant' 'java-environment=8' 'git' 'mingw-w64-configure' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
#optdepends=('java-runtime=8: BD-J library')
source=(
  git+https://code.videolan.org/videolan/libbluray.git#tag=${pkgver}
  git+https://code.videolan.org/videolan/libudfread.git
)
sha256sums=(
  SKIP
  SKIP
)
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd libbluray

  for submodule in contrib/libudfread; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../${submodule#*/}
    git submodule update ${submodule}
  done

  autoreconf -fiv
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/libbluray/build-${_arch} && cd ${srcdir}/libbluray/build-${_arch}

    ${_arch}-configure \
      --disable-bdjava-jar
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/libbluray/build-${_arch}

    make DESTDIR="$pkgdir" install
    ${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}

# vim:set ts=2 sw=2 et:
