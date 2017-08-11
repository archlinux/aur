# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_setPrefix="/usr"
_setLibdir="lib32"
_setFullLibdir="${_setPrefix}/${_setLibdir}"
_pkgbase=openjpeg2

pkgname=${_setLibdir}-${_pkgbase}
pkgver=2.2.0
pkgrel=1
pkgdesc="An open source JPEG 2000 codec, version ${pkgver}"
arch=('x86_64')
license=('BSD')
url="http://www.openjpeg.org"
makedepends=('cmake' 'gcc-multilib')
depends=("${_pkgbase}" 'lib32-glibc' 'lib32-libpng' 'lib32-zlib' 'lib32-libtiff' 'lib32-lcms2')
source=("https://github.com/uclouvain/openjpeg/archive/v${pkgver}.tar.gz")
md5sums=("269bb0b175476f3addcc0d03bd9a97b6")

build() {
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"
  export PKG_CONFIG_PATH="${_setFullLibdir}/pkgconfig"

  cd "${srcdir}"
  mkdir -p build
  cd build
  cmake "../openjpeg-$pkgver" -DCMAKE_INSTALL_PREFIX=${_setPrefix} -DOPENJPEG_INSTALL_LIB_DIR=${_setLibdir} -DBUILD_DOC=off
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install

  # removing unneeded files and folders
  rm -rf "${pkgdir}/${_setPrefix}"/{bin,include}
  rm -fr "${pkgdir}/${_setFullLibdir}"/openjpeg-2.2

  # installing license
  mkdir -p "${pkgdir}/${_setPrefix}"/share/licenses/openjpeg-2.2
  cp LICENSE.txt "${pkgdir}/${_setPrefix}"/share/licenses/openjpeg-2.2/LICENSE

  mkdir -p "${pkgdir}/${_setPrefix}"/share/licenses/${pkgname}
  ln -s ../openjpeg-2.2/LICENSE "${pkgdir}/${_setPrefix}"/share/licenses/${pkgname}/LICENSE
}
