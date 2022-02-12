# Contributor: Davorin Učakar <davorin.ucakar@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Mihai Militaru <mihai.militaru@gmx.com>
# Contributor: scippio <scippio@berounet.cz>
# Contributor: Haakon McKay <hagar@iinet.net.au>

pkgname=mingw-w64-freeimage
pkgver=3.18.0
pkgrel=1
pkgdesc="Library project for developers who would like to support popular graphics image formats (mingw-w64)"
arch=(any)
license=("GPL" "custom:FIPL")
url="http://freeimage.sourceforge.net/"
depends=(mingw-w64-crt)
makedepends=(mingw-w64-gcc)
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/sourceforge/freeimage/FreeImage${pkgver//./}.zip")
md5sums=('f8ba138a3be233a3eed9c456e42e2578')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd FreeImage
  sed -i "s|IMPORTLIB = \$(TARGET).lib|IMPORTLIB = \$(TARGET).dll.a|g" Makefile.mingw
  sed -i 's/#include "..\\x86\\x86.h"/#include "..\/x86\/x86.h"/' Source/LibJXR/image/sys/strcodec.h
  rm Source/LibJXR/common/include/guiddef.h
  sed -i "s,WIN32_CFLAGS =,WIN32_CFLAGS = -fpermissive -D__MINGW64_TOOLCHAIN__ -D_USE_MATH_DEFINES," Makefile.mingw
  sed -i "58iWIN32_CXXFLAGS += -std=c++14" Makefile.mingw
  sed -i -e "s,#ifdef __GNUC__,#ifdef WHATEVER," -e "s,_MSC_VER,WINVER," Source/OpenEXR/IlmImf/ImfSystemSpecific.h
}

build() {
  for _arch in ${_architectures}; do
    rm -rf FreeImage-${_arch}
    cp -r FreeImage FreeImage-${_arch}-static
    pushd FreeImage-${_arch}-static
    make libFreeImage.a \
      CC=${_arch}-gcc \
      CXX=${_arch}-g++ \
      LD=${_arch}-g++ \
      RC=${_arch}-windres \
      AR=${_arch}-ar \
      DLLTOOL=${_arch}-dlltool \
      FREEIMAGE_LIBRARY_TYPE="STATIC" \
      LDFLAGS="-static" \
      -f Makefile.mingw
    popd
    cp -r FreeImage FreeImage-${_arch}
    pushd FreeImage-${_arch}
    make FreeImage.dll \
      CC=${_arch}-gcc \
      CXX=${_arch}-g++ \
      LD=${_arch}-g++ \
      RC=${_arch}-windres \
      AR=${_arch}-ar \
      DLLTOOL=${_arch}-dlltool \
      FREEIMAGE_LIBRARY_TYPE="SHARED" \
      LDFLAGS="-shared -Wl,--out-implib,libFreeImage.dll.a" \
      -f Makefile.mingw
    popd
  done  

}

package() {
  for _arch in ${_architectures}; do
    install -d "${pkgdir}"/usr/${_arch}/{lib,bin,include}
    cd ${srcdir}/FreeImage-${_arch}-static
    install -m644 libFreeImage.a "${pkgdir}"/usr/${_arch}/lib/
    cd ${srcdir}/FreeImage-${_arch}
    install -m755 FreeImage.dll "${pkgdir}"/usr/${_arch}/bin/
    install -m644 FreeImage.dll.a "${pkgdir}"/usr/${_arch}/lib/libFreeImage.dll.a
    install -m644 Source/FreeImage.h   "${pkgdir}"/usr/${_arch}/include/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
