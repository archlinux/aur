# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>

pkgname=libasl
pkgver=0.1.7
pkgrel=17
pkgdesc='Free and open source hardware accelerated multiphysics simulation platform (Advanced Simulation Library)'
arch=('x86_64')
url='http://asl.org.il/'
license=('AGPL3')
depends=('boost-libs' 'opencl-icd-loader' 'libmatio' 'vtk' 'libjpeg' 'libpng' 'libtiff'
         'freetype2' 'libgl')
# Workaround for https://bugs.archlinux.org/task/57236
depends+=('netcdf')
makedepends=('cmake' 'opencl-headers' 'boost' 'mesa-libgl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AvtechScientific/ASL/archive/v${pkgver}.tar.gz"
        'suppress-deprecated-warnings.patch'
        'vtk-8.0.patch')
sha512sums=('337754adefa8619bbc2ab0e06fc811dd1cc550252b165241a265f87224aa84c5ee69fb3bf60324093df5b21aa87712e2210d4bcdd8593f0740183574528a30bd'
            '6aecf660790ea2ba0d9de48aef4c4a1058b07d04cbc74ad6a9f127a51f02b39fdab5f8faa269d0bbbc003ea5cea6910f54a7d980fbf5e641629869e20528f70a'
            '1e1e679003ae0f750db1728196b7e4a8703304592f05698f24c359f185d8873e2c623b8152a63737b000109d88de38618b984865669652eb23b27396dd7dad79')

prepare() {
  rm -rf "build"
  mkdir "build"

  # patch to suppress 'deprecated' warning messages
  # caused by 'opencl-headers' since update to 2.0
  cd "ASL-${pkgver}"
  patch -p1 -i "${srcdir}/suppress-deprecated-warnings.patch"
  # update cmake to allow vtk>=8.0
  patch -p1 -i "${srcdir}/vtk-8.0.patch"
}

build() {
  cd "build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_SHARED_LIBS=ON \
        -DWITH_EXAMPLES=ON \
        -DWITH_MATIO=ON \
        -DWITH_API_DOC=OFF \
        -DWITH_TESTS=OFF \
        "../ASL-${pkgver}"
  make
}

package() {
  cd "build"
  make DESTDIR="${pkgdir}" install
}
