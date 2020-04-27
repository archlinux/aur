# Maintainer: Jakub Okoński <jakub@okonski.org>
pkgname=miopen
pkgver=3.3.0
pkgrel=1
pkgdesc="AMD's Machine Intelligence Library"
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/MIOpen"
license=('custom:NCSAOSL')
depends=('ocl-icd' 'hip' 'hcc' 'rocblas' 'boost>=1.58' 'rocm-clang-ocl')
makedepends=('opencl-headers' 'cmake' 'half' 'miopengemm')
source=("https://github.com/ROCmSoftwarePlatform/MIOpen/archive/roc-$pkgver.tar.gz")
sha256sums=('ab056f7921c2e4a7932225409b836258327f5ec5e3ee513726a114cd303d9b59')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  # compile with HCC
  export CXX="/opt/rocm/hcc/bin/hcc"

  # TODO: fix libMIOpen.so, it contains references to $srcdir
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/miopen \
        -DMIOPEN_BACKEND=HIP \
        -DCMAKE_PREFIX_PATH="/opt/rocm/hcc;/opt/rocm/hip" \
        -DHALF_INCLUDE_DIR=/usr/include/half \
        -DBoost_NO_BOOST_CMAKE=ON \
        "$srcdir/MIOpen-roc-$pkgver"

  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/miopen.conf"
/opt/rocm/miopen/lib
EOF
}
