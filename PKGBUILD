# Maintainer: Ed Branch <brance carp at mail dot utexas dot edu nofish>
pkgbase=libvariant
pkgname=libvariant
pkgver=1.0.1
pkgrel=4
pkgdesc="A C++ dynamically typed composable object library with de/serializers"
arch=('i686' 'x86_64')
url="https://bitbucket.org/gallen/libvariant"
license=('GPL')
depends=('libxml2' 'libyaml' 'curl')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.bz2::https://bitbucket.org/gallen/${pkgname}/get/${pkgver}.tar.bz2")
noextract=("${pkgname}-${pkgver}.tar.bz2")
sha256sums=('004789d04a728f36065ca80ba166d0d897158b4164f2b8e3def0916f8bf509f7')

prepare() {
  tar -x --strip-components=1 --one-top-level -f ${pkgname}-${pkgver}.tar.bz2
  mkdir -p "${pkgname}-${pkgver}/build"
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake -DCMAKE_C_FLAGS:STRING="${CFLAGS} ${CPPFLAGS}" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} ${CPPFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DLIBVARIANT_BUILD_EXAMPLES=off ..
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}

check() {
  cd "${pkgname}-${pkgver}/build"
  make test
}
