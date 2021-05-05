# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Cong Gu <gucong43216@gmail.com>
pkgname=zoltan
pkgver=3.90
pkgrel=1
pkgdesc="Parallel Partitioning, Load Balancing and Data-Management Services"
arch=('x86_64')
url="https://cs.sandia.gov/Zoltan"
license=('LGPL')
depends=('scotch' 'parmetis' 'openmpi')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/sandialabs/${pkgname}/tar.gz/refs/tags/v${pkgver}")
sha256sums=('30a470af4d97cf03aa5434eb0a095f627a3a8096ecdb17f4f6b9ce58e832d28b')
b2sums=('28a08120afefba4ebd498b60a4de884347c52a37559e85af3387ba5e37c791d8b705f94d26775d96c5ae04f3a102d64419d87fdf160389270bfc59a3f71b5ed4')

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

# vim:set ts=2 sw=2 et:
