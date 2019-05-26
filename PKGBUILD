# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Ivan Semkin <ivan at semkin dot ru>
# Contributor: Martin Weinelt <hexa at darmstadt dot ccc dot de>
 
_appname=Quaternion
pkgname=quaternion
_libname=libQuotient
pkgver=0.0.9.4b
_libquotient_pkgver=0.5.2
pkgrel=1
pkgdesc='Qt5-based IM client for the Matrix protocol'
url='https://matrix.org/docs/projects/client/quaternion.html'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt5-tools' 'qt5-multimedia' 'qt5-quickcontrols' 'qt5-quickcontrols2')
makedepends=('cmake')
provides=('quaternion')
conflicts=('quaternion-git')
source=("https://github.com/quotient-im/Quaternion/archive/$pkgver.tar.gz"
        "https://github.com/quotient-im/libQuotient/archive/${_libquotient_pkgver}.tar.gz")
sha256sums=('fc3634a02d12070290c42dc21746ca8e51303eb3ed1cc5e3f6bebf1096b75d1f'
            '1848bc0af53ce42c2b1a1a4fdeccb054af1f9e0f765cadf609f62727ce23dfd2')

prepare() {
  cp -r ${_libname}-${_libquotient_pkgver}/* ${srcdir}/${_appname}-${pkgver}/lib/
  # INSTALL rule also installs libqmatrixclient
  sed -i 's/EXCLUDE_FROM_ALL//' ${_appname}-${pkgver}/CMakeLists.txt
}

build() {
  cd ${_appname}-${pkgver}
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
  cd ${_appname}-${pkgver}
  cmake --build build -- DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
