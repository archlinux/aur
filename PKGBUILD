# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-wineditline
pkgver=2.205
pkgrel=1
pkgdesc="port of the NetBSD Editline library (mingw-w64)"
arch=('any')
url="https://mingweditline.sourceforge.io/"
license=('BSD')
makedepends=('mingw-w64-cmake' 'dos2unix')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://sourceforge.net/projects/mingweditline/files/wineditline-${pkgver}.tar.bz2"
        '001-fix-installing.patch'
        '002-fix-exports.patch'
        '003-dont-link-with-def.patch'
        'wineditline-fix-case.patch')
sha256sums=('dc8b25cbd503dd41241b8de0146af20182b552ac31cf0fc7e103b83aec25e448'
            '821d0a36115832a76497dc6d7ea4b6e45e4ce73621030a59865f851309f8db34'
            '38e779fbdebf2f29038b598920e733a4a51638834013c3cc73fb85a7d50cffd2'
            '19077726758de7780cd68f3f47d8353516fd864ede1903d55280a1fb3dbe408d'
            'b86e7672f32b143c05ae08d4dddf267ad8e08ee27aac7374d107ff021e51abcf')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/wineditline-${pkgver}
  
  # Get rid of crlf endings
  find . -type f -exec dos2unix {} \;
  
  patch -Np1 -i ${srcdir}/001-fix-installing.patch
  patch -Np1 -i ${srcdir}/002-fix-exports.patch
  patch -Np1 -i ${srcdir}/003-dont-link-with-def.patch
  patch -Np1 -i ${srcdir}/wineditline-fix-case.patch

  rm -rf bin32 bin64 lib32 lib64
}

build() {
  cd ${srcdir}/wineditline-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/wineditline-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
