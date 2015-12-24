# Maintainer: Lukas Spies <luspi (AT) gmx _DOT_ de>
pkgname=mingw-w64-graphicsmagick
pkgver=1.3.23
pkgrel=1
pkgdesc="Image processing system (mingw-w64)"
arch=('any')
url="http://www.graphicsmagick.org"
license=('GPL')
optdepends=('mingw-w64-jasper: jp2 module'
		'mingw-w64-libpng: png module'
		'mingw-w64-libxml2: msl, svg, url modules'
		'mingw-w64-libtiff: ps2, ps3, tiff modules'
		'mingw-w64-ghostscript: pdf, ps modules')
makedepends=('mingw-w64-configure' 'mingw-w64-pcre' 'mingw-w64-libpng' 'mingw-w64-libxml2' 'mingw-w64-libtiff')
depends=('mingw-w64-crt' 'mingw-w64-freetype' 'mingw-w64-lcms2' 'mingw-w64-libltdl' 'mingw-w64-bzip2' 'mingw-w64-xz')
options=('!strip' '!buildflags' 'staticlibs')
source=("ftp://ftp.graphicsmagick.org/pub/GraphicsMagick/1.3/GraphicsMagick-$pkgver.tar.xz")
md5sums=('9885ff5d91bc215a0adb3be1185e9777')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {

  cd "${srcdir}/GraphicsMagick-$pkgver/"

  for _arch in ${_architectures}; do

    mkdir -p build-${_arch} && pushd build-${_arch}

    ### NOTE ###
    # if you manage to get libltdl installed, you can add the flag '--with-modules' for support of synamically loaded modules
    ${_arch}-configure --enable-shared --without-x --with-quantum-depth=16 --with-threads

    sed -i "s/\/usr\/include/\/usr\/${_arch}\/include/g" Makefile
    sed -i "s/\/usr\/lib/\/usr\/${_arch}\/lib/g" Makefile

    make -j4
    popd

  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/GraphicsMagick-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
