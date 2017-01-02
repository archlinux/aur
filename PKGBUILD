# Contributor: K0n24d
pkgname=mingw-w64-cximage
major=7
minor=01
pkgver=${major}.${minor}
pkgrel=2
pkgdesc='Another free C++ image processing and conversion library'
arch=(any)
url='http://www.xdp.it/cximage/'
license=('ZLIB')
makedepends=(mingw-w64-configure mingw-w64-gcc mingw-w64-pkg-config dos2unix)
depends=(mingw-w64-jasper mingw-w64-libjpeg-turbo mingw-w64-libpng mingw-w64-libtiff mingw-w64-zlib)
options=(!strip !buildflags staticlibs)
source=("http://sourceforge.net/projects/cximage/files/${major}.${minor}/cximage${major}${minor}_full.7z"
	'cximage-6.0.0-fix-include-name.patch'
	'cximage-7.0.0-disable-some-formats.patch'
	'cximage.pc')

sha1sums=('6138e4babe86b84015df32bf4df814815ffbfecf'
          '39911dc9e8aee7cf473061971445eb246084fc10'
          '52a747bcc1736e3ffa7f193e1c12c113267146af'
          'e505934712252ea05a730c30062ed6017948a25d')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  unix2dos -n cximage-7.0.0-disable-some-formats.patch cximage-7.0.0-disable-some-formats_dos.patch
  patch --binary -p1 < cximage-7.0.0-disable-some-formats_dos.patch
  unix2dos -n cximage-6.0.0-fix-include-name.patch cximage-6.0.0-fix-include-name_dos.patch
  patch --binary -p1 < cximage-6.0.0-fix-include-name_dos.patch 
  $(which rm) -f CxImage/stdint.h
}

build() {
  cximage_cppflags="-D_USRDLL -D_USRCxImageCrtDll -DCxImageCrtDll_EXPORTS -fpermissive"
  cximage_ldflags="-lgdi32 -lws2_32 -ljpeg -ltiff -ljasper"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}

    cximage_pkg_flags=$(${_arch}-pkg-config --cflags --libs libpng16 zlib)

    ${_arch}-c++ ${cximage_cppflags} \
      -shared -o libcximage.dll -Wl,--out-implib,libcximage.dll.a \
      ../CxImage/*.cpp ../CxImage/CxImageDLL/CxImageCrtDll.cpp \
      ${cximage_ldflags} ${cximage_pkg_flags}

    ${_arch}-c++ ${cximage_cppflags} \
      -c ../CxImage/*.cpp ../CxImage/CxImageDLL/CxImageCrtDll.cpp \
      ${cximage_ldflags} ${cximage_pkg_flags}

    ${_arch}-ar -cru libcximage.a *.o

    popd
  done
}

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m0644 "${srcdir}/CxImage/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for _arch in ${_architectures}; do
    install -d "${pkgdir}/usr/${_arch}/lib/pkgconfig"
    install -m0644 "${srcdir}/cximage.pc" "${pkgdir}/usr/${_arch}/lib/pkgconfig"
    sed -i s!@PREFIX@!/usr/${_arch}!g "${pkgdir}/usr/${_arch}/lib/pkgconfig/cximage.pc"

    install -d "${pkgdir}/usr/${_arch}/bin"
    install -m0644 "${srcdir}/build-${_arch}/libcximage.dll" "${pkgdir}/usr/${_arch}/bin/libcximage.dll"

    install -d "${pkgdir}/usr/${_arch}/lib"
    install -m0644 "${srcdir}/build-${_arch}/libcximage.dll.a" "${pkgdir}/usr/${_arch}/lib/libcximage.dll.a"
    install -m0644 "${srcdir}/build-${_arch}/libcximage.a" "${pkgdir}/usr/${_arch}/lib/libcximage.a"

    install -d "${pkgdir}/usr/${_arch}/include/CxImage"
    install -m0644 "${srcdir}/CxImage/"*.h "${pkgdir}/usr/${_arch}/include/CxImage/"

    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
