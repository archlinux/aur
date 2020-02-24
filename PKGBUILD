# Maintainer: Millian Poquet <millian.poquet@gmail.com>
pkgname=redox-pkgconfig
pkgver=0.3
pkgrel=1
pkgdesc='Redis library for C++11. Fork with pkg-config support.'
arch=('x86_64' 'i686')
url='https://github.com/mpoquet/redox'
license=('APACHE')
conflicts=('redox')
makedepends=('cmake' 'ninja')
depends=('hiredis' 'libev' 'gcc-libs')
_commit='e7904da79d5360ba22fbab64b96be167b6dda5f6'
source=("https://github.com/mpoquet/redox/archive/${_commit}.tar.gz")
md5sums=('0d7ed59369d4a42adbf9749d604cdb44')

prepare() {
  # Use /usr/lib instead of /usr/lib64.
  # Setting LIB_PREFIX to nothing does not work.
  sed 's/64//g' -i "${srcdir}/redox-${_commit}/CMakeLists.txt"
}

build() {
  cd "${srcdir}/redox-${_commit}"
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -G Ninja
  ninja
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}/redox-${_commit}/build" install
}
