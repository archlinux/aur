# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Cong Gu <gucong43216@gmail.com>
pkgname=zoltan
pkgver=3.90
pkgrel=2
pkgdesc="Parallel Partitioning, Load Balancing and Data-Management Services"
arch=('x86_64')
url="https://github.com/sandialabs/${pkgname}"
license=(LGPL)
depends=(scotch parmetis openmpi)
conflicts=('trilinos')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('29dc42c81db36129b0a97836c9192ef7e7fc86231f2f8224a68a36642042a0d8272e791a10a5907d2e07cac691cf5fc2e7199f92a0a441d4c165eae5c7b692cf')

prepare() {
  rm -rf "${srcdir}/build"
  mkdir -p "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"

  ../Zoltan-${pkgver}/configure \
    --prefix=/usr \
    --enable-mpi --with-mpi-compilers \
    --with-mpi-incdir="/usr/include" \
    --with-mpi-libdir="/usr/lib/openmpi" \
    --with-gnumake \
    --with-scotch \
    --with-scotch-incdir="/usr/include/scotch" \
    --with-scotch-libdir="/usr/lib" \
    --with-parmetis \
    --with-parmetis-incdir="/usr/include" \
    --with-parmetis-libdir="/usr/lib" \
    --with-ar='$(CXX) -shared $(LDFLAGS) -o' \
    --with-cflags="-fPIC" \
    --with-cxxflags="-fPIC" \
    --with-ldflags="-L/usr/lib/openmpi -lptscotch  -lptscotcherr -lptscotcherrexit -lscotch -lscotcherr -lscotcherrexit -lparmetis -lmetis -lmpi  -lm" \
    RANLIB=echo

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install
  install -Dm777 "${pkgdir}/usr/lib/libzoltan.a" "${pkgdir}/usr/lib/libzoltan.so"

  install -Dm644 ${srcdir}/Zoltan-${pkgver}/COPYRIGHT_AND_LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
