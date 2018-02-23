# Maintainer: Lukas Spies <luspi (AT) gmx _DOT_ de>
pkgname=mingw-w64-graphicsmagick
pkgver=1.3.28
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
depends=('mingw-w64-crt' 'mingw-w64-freetype2' 'mingw-w64-lcms2' 'mingw-w64-bzip2' 'mingw-w64-xz')
options=('!strip' '!buildflags' 'staticlibs')
source=("ftp://ftp.graphicsmagick.org/pub/GraphicsMagick/1.3/GraphicsMagick-$pkgver.tar.xz")
md5sums=('aec23df5ad1a5bf8f8e1b392f95eed55')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {

  cd "${srcdir}/GraphicsMagick-$pkgver/"

  for _arch in ${_architectures}; do

    mkdir -p build-${_arch} && pushd build-${_arch}

    ### NOTE ###
    # if you manage to get libltdl installed, you can add the flag '--with-modules' for support of synamically loaded modules
    # 1.3.28 doesn't compile with JPEG-2000 support (problems with jasper)
    ${_arch}-configure --enable-shared --without-x --with-quantum-depth=16 --with-threads --without-jp2

    sed -i "s/\/usr\/include/\/usr\/${_arch}\/include/g" Makefile
    sed -i "s/\/usr\/lib/\/usr\/${_arch}\/lib/g" Makefile

    make
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
