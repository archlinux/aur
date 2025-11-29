pkgname="kst"
pkgrel=1
pkgver=2.1
pkgdesc="Fast real-time large-dataset viewing and plotting tool for KDE"
arch=('i686' 'x86_64')
url="https://kst-plot.kde.org"
license=('GPL-2.0')
depends=('hdf5' 'gsl' 'qt5-base' 'qt5-svg' 'muparser' 'cfitsio' 'libtiff' 'libmatio' 'netcdf-cxx')
makedepends=('git' 'cmake' 'qt5-tools')
source=("git+https://invent.kde.org/graphics/kst-plot.git#tag=v2.1-2024-10-20"
        "cmake4.patch"
        "hdf5_include.patch"
        "hdf5_cpp.patch")
sha256sums=('SKIP'
            'c93de37e5856fc10b4c6aa814f1b477582484c5f34c37af998854112dc1f6ed7'
            '0281a90c1ae5104a2624683d5aa4579fa71659412f61ffd90f29ff39f5bf933b'
            'be92b2a355a5623c0e1213f6ed528363000b481196853dc76f5eec743e41c135')

prepare() {
  cd "${srcdir}/kst-plot"
  patch -Np1 -i  ../cmake4.patch
  patch -Np1 -i  ../hdf5_include.patch
  patch -Np1 -i  ../hdf5_cpp.patch
}

build() {
  cd "${srcdir}/kst-plot"

  cmake ./ \
  -Dkst_release=ON \
  -Dkst_version_string=2.1 \
  -Dkst_install_prefix=/usr \
  -Dkst_install_libdir=/usr/lib \
  -Dkst_qt5=ON \
  -Dkst_merge_files=ON \
  -Dkst_verbose=OFF \
  -Dkst_rpath=OFF

  make -j$(nproc) DESTDIR="${pkgdir}"
}

package() {
  cd "${srcdir}/kst-plot"
  make -j$(nproc) DESTDIR="${pkgdir}" install
}
