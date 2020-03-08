# Maintainer: Jakub Okoński <jakub@okonski.org>
pkgname=miopen
# upstream has different versioning, let's keep it at 2.3.0 until they catch up
_pkgver=2.2.1
pkgver=2.3.0.$_pkgver
pkgrel=2
pkgdesc="AMD's Machine Intelligence Library"
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/MIOpen"
license=('custom:NCSAOSL')
depends=('ocl-icd' 'hip' 'hcc' 'rocblas' 'boost>=1.58' 'clang-ocl')
makedepends=('opencl-headers' 'cmake' 'hip' 'hcc' 'rocblas' 'miopengemm')
_halfver="2.1.0"
source=("https://github.com/ROCmSoftwarePlatform/MIOpen/archive/$_pkgver.tar.gz"
        "https://sourceforge.net/projects/half/files/half/$_halfver/half-$_halfver.zip")
sha256sums=('445870318d7abb75a703b1021e8cb198bb64a5e1c9401487db40b5c3a7ae41e4'
            'ad1788afe0300fa2b02b0d1df128d857f021f92ccf7c8bddd07812685fa07a25')

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
        -DHALF_INCLUDE_DIR="$srcdir/include" \
        "$srcdir/MIOpen-$_pkgver"
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
