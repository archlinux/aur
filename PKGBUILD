# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: jimmy-6
# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=lib32-libnoise
pkgver=1.0.0
pkgrel=1
pkgdesc="A portable, open-source, coherent noise-generating library for C++"
arch=('i686' 'x86_64')
url="http://libnoise.sourceforge.net/"
license=('LGPL')
depends=('lib32-gcc-libs')
makedepends=('cmake' 'unzip')
source=("http://prdownloads.sourceforge.net/libnoise/libnoisesrc-${pkgver}.zip"
        'CMakeLists.txt'
	'COPYING')
md5sums=('fc0d9b4f6477397568c3a9d5294b3b8c'
         '913a4145cdc7c38d43698386321ea85b'
	 'ff2016bd98a6368367edf64aabab0939')

prepare() {
  cp CMakeLists.txt noise
}

build() {
  rm -rf build && mkdir build && cd build

  cmake \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_C_FLAGS="-march=i686 -m32 ${CFLAGS/-march=x86_64}" \
    -D CMAKE_CXX_FLAGS="-march=i686 -m32 ${CXXFLAGS/-march=x86_64}" \
    ../noise
  make
}

package() {
  cd ${srcdir}/build

  make DESTDIR=${pkgdir} install

  rm -rf ${pkgdir}/usr/include
  mv ${pkgdir}/usr/lib ${pkgdir}/usr/lib32

  install -Dm 644 ${srcdir}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
