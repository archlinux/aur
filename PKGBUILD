# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: xantares <xantares09 at hotmail dot com>
pkgname=mingw-w64-openjpeg
pkgver=1.5.2
pkgrel=2
pkgdesc="An open source JPEG 2000 codec (mingw-w64)"
arch=(any)
url="http://www.openjpeg.org"
license=("BSD")
depends=('mingw-w64-crt' 'mingw-w64-lcms2' 'mingw-w64-libtiff' 'mingw-w64-libpng' 'mingw-w64-zlib')
makedepends=('mingw-w64-configure' 'dos2unix' 'lib32-glibc')
options=('staticlibs' '!strip' '!buildflags')
source=("http://downloads.sourceforge.net/openjpeg.mirror/openjpeg-${pkgver}.tar.gz"
        'openjpeg-1.5_tiff-pkgconfig.patch'
        'rhbz1037945_CVE-2013-1447.patch'
        'rhbz1037948_CVE-2013-6887.patch'
        'rhbz1082997_CVE-2014-0158.patch'
        'cdecl.patch')
        
md5sums=('c41772c30fb1c272358b3707233134a1'
         '1ec1549edd75de3f5f69275bd4d0adfa'
         '8d6b76c2fe04c5f2ef03cbdc90087ca0'
         'f76f8d2639883e0e91b6c8517557aa95'
         '089dc6f3fb3b43fd533ee6f9ea03cd9a'
         '673edf457f9b4f3fdc9a083e1857a76a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/openjpeg-$pkgver"
  rm -r thirdparty
  dos2unix libopenjpeg/opj_malloc.h
  patch -p1 -i ../openjpeg-1.5_tiff-pkgconfig.patch
  patch -p1 -i ../rhbz1037945_CVE-2013-1447.patch
  patch -p1 -i ../rhbz1037948_CVE-2013-6887.patch
  patch -p1 -i ../rhbz1082997_CVE-2014-0158.patch
  patch -p1 -i ../cdecl.patch
  autoreconf -vfi
}

build() {
  cd "$srcdir/openjpeg-$pkgver"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${_arch%%-*}" && pushd "${_arch%%-*}"
    ${_arch}-configure \
      --disable-doc \
      --enable-jpwl
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/openjpeg-${pkgver}/"${_arch%%-*}""
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
