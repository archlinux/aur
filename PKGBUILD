# Contributor: Davorin Učakar <davorin.ucakar@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Mihai Militaru <mihai.militaru@gmx.com>
# Contributor: scippio <scippio@berounet.cz>

pkgname=mingw-w64-freeimage
pkgver=3.17.0
pkgrel=1
pkgdesc="Library project for developers who would like to support popular graphics image formats (mingw-w64)"
arch=(any)
license=("GPL" "custom:FIPL")
url="http://freeimage.sourceforge.net/"
depends=(mingw-w64-crt)
makedepends=(mingw-w64-gcc)
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/sourceforge/freeimage/FreeImage${pkgver//./}.zip")
md5sums=('459e15f0ec75d6efa3c7bd63277ead86')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd FreeImage
  sed -i "s|IMPORTLIB = \$(TARGET).lib|IMPORTLIB = \$(TARGET).dll.a|g" Makefile.mingw
  sed -i 's/#include "..\\x86\\x86.h"/#include "..\/x86\/x86.h"/' Source/LibJXR/image/sys/strcodec.h
  rm Source/LibJXR/common/include/guiddef.h
  sed -i "s,WIN32_CFLAGS =,WIN32_CFLAGS = -fpermissive -D__MINGW64_TOOLCHAIN__," Makefile.mingw
  sed -i -e "s,#ifdef __GNUC__,#ifdef WHATEVER," -e "s,_MSC_VER,WINVER," Source/OpenEXR/IlmImf/ImfSystemSpecific.h
}

build() {
  for _arch in ${_architectures}; do
    rm -rf FreeImage-${_arch}
    cp -r FreeImage FreeImage-${_arch}
    pushd FreeImage-${_arch}
  
		make \
			CC=${_arch}-gcc \
			CXX=${_arch}-g++ \
			LD=${_arch}-g++ \
			RC=${_arch}-windres \
			AR=${_arch}-ar \
			DLLTOOL=${_arch}-dlltool \
			FREEIMAGE_LIBRARY_TYPE="STATIC" \
			-f Makefile.mingw
		make \
			CC=${_arch}-gcc \
			CXX=${_arch}-g++ \
			LD=${_arch}-g++ \
			RC=${_arch}-windres \
			AR=${_arch}-ar \
			DLLTOOL=${_arch}-dlltool \
			FREEIMAGE_LIBRARY_TYPE="SHARED" \
			-f Makefile.mingw
    popd
  done  

}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/FreeImage-${_arch}
    install -d "${pkgdir}"/usr/${_arch}/lib
    install -d "${pkgdir}"/usr/${_arch}/bin
    install -d "${pkgdir}"/usr/${_arch}/include
    install -m755 Dist/FreeImage.dll "${pkgdir}"/usr/${_arch}/bin/
    install -m644 Dist/FreeImage.dll.a "${pkgdir}"/usr/${_arch}/lib/libFreeImage.dll.a
    install -m644 Dist/libFreeImage.a "${pkgdir}"/usr/${_arch}/lib/
    install -m644 Dist/FreeImage.h   "${pkgdir}"/usr/${_arch}/include/
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
