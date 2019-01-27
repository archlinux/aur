# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Ivan Semkin <ivan at semkin dot ru>
# Contributor: Martin Weinelt <hexa at darmstadt dot ccc dot de>
 
appname=Quaternion
pkgname=quaternion
libname=libQMatrixClient
_libname=libqmatrixclient
pkgver=0.0.9.3
_libqmatrixclient_pkgver=0.4.0
pkgrel=1
pkgdesc='Qt5-based IM client for the Matrix protocol'
url='https://matrix.org/docs/projects/client/quaternion.html'
arch=('i686' 'x86_64')
license=(GPL3)
depends=('qt5-tools' 'qt5-declarative')
makedepends=('cmake')
provides=('quaternion')
conflicts=('quaternion-git')
source=("https://github.com/QMatrixClient/Quaternion/archive/v$pkgver.tar.gz"
        "https://github.com/QMatrixClient/libqmatrixclient/archive/v${_libqmatrixclient_pkgver}.tar.gz")
sha256sums=('7f92c3acc73bb7e44efe94bd1085ae9fd5b58efa51efc28a931cace131c22230'
            '8c0a1e0c52e9be06a9883487893cff005287fb199e378033182b681949c521c3')

prepare() {
  cp -r ${_libname}-${_libqmatrixclient_pkgver}/* ${srcdir}/${appname}-${pkgver}/lib/
  # INSTALL rule also installs libqmatrixclient
  sed -i 's/EXCLUDE_FROM_ALL//' ${appname}-${pkgver}/CMakeLists.txt
}

build() {
  cd ${appname}-${pkgver}
  cmake -H. -Bbuild \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DUSE_INTREE_LIBQMC=ON

  cmake --build build
}

package() {
  cd ${appname}-${pkgver}
  cmake --build build -- DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
