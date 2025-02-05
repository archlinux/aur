# Maintainer: simark (https://aur.archlinux.org/account/simark)
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Bet4 (https://aur.archlinux.org/account/bet4it)

pkgname=libipt
pkgver=2.1.2
pkgrel=1
pkgdesc='An Intel(R) Processor Trace decoder library'
arch=('x86_64')
url='https://github.com/intel/libipt'
license=('BSD-3-Clause')
depends=(
  'glibc'
  'intelxed' # Required for ptxed.
)
makedepends=(
  'cmake'
  'git'
  'pandoc'   # Required for building the manpage.
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/intel/libipt/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ceb4e60594b4f4d24f8037b55b0a02ab94d851ae7dfc153b53ada98226c865d4b2b953d8e63f037c5d1f3737b13a59cacd389aaae7c291f8906f35e39926b4b6')

build() {
  cd "${pkgname}-${pkgver}"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DDEVBUILD=OFF \
    -DFEATURE_THREADS=ON \
    -DCOV=OFF \
    -DMAN=ON \
    -DPTDUMP=ON \
    -DPTSEG=ON \
    -DPTTC=ON \
    -DPTUNIT=ON \
    -DPTXED=ON \
    -DXED_INCLUDE=/usr/include/xed \
    -DXED_LIBDIR=/usr/lib \
    -DSIDEBAND=ON \
    .

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -D -v -m644 README "${pkgdir}/usr/share/doc/libipt/README"
  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
