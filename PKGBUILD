# Maintainer: Ali Zain <alizain.x404@gmail.com>

pkgname=gazebo
pkgver=11.14.0
pkgrel=3
pkgdesc="A multi-robot simulator for outdoor environments"
arch=('x86_64')
url="https://classic.gazebosim.org/"
license=('Apache')
depends=('boost' 'curl' 'freeglut' 'freeimage' 'tbb' 'libccd' 'libltdl' 'graphviz'
         'libtar' 'libxml2' 'ogre-1.9' 'protobuf' 'sdformat-9' 'ignition-math-6' 'ignition-transport-8'
         'ignition-cmake-2' 'ignition-common-3' 'ignition-fuel_tools-4' 'ignition-msgs-5' 'tinyxml2' 'qwt' 'cppzmq')
makedepends=('cmake' 'doxygen' 'ruby-ronn')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gazebo-classic/archive/${pkgname}11_$pkgver.tar.gz"
        "graphviz9.patch::https://github.com/gazebosim/gazebo-classic/pull/3345.patch")
sha256sums=('6b63d857399ba08190c331b545d24e8e3e308b840ff051bbf39e87879e37af50'
            'SKIP')

_pkgname=gazebo-classic

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgname}11_$pkgver"
  # Patching for Graphviz 9.0 support
  patch -Np1 -i "${srcdir}/graphviz9.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgname}11_$pkgver"
  mkdir -p build && cd build

  export PKG_CONFIG_PATH=/usr/lib/ffmpeg4.4/pkgconfig
  export LDFLAGS="-Wl,--copy-dt-needed-entries"
  
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DPROTOBUF_PROTOC_EXECUTABLE="/usr/bin/protoc"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgname}11_$pkgver/build"
  make DESTDIR="${pkgdir}" install
}
