# Maintainer: Jakub Okoński <jakub@okonski.org>
# Maintainer: Markus Näther <naetherm@cs.uni-freiburg.de>
pkgname=rocfft
_pkgver=3.1
pkgver="$_pkgver.0"
pkgrel=1
pkgdesc="Next generation FFT implementation for ROCm"
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/rocfft"
license=('MIT')
depends=('boost' 'fftw')
makedepends=("hcc>=$pkgver" 'cmake')
source=("https://github.com/ROCmSoftwarePlatform/rocFFT/archive/rocm-$_pkgver.tar.gz")
sha256sums=('dff9274c1d5e30a281861b49ee0c36f786885331627a2c74668fd29e2f6d24c4')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  # build broken with stack protection
  export CFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CFLAGS")"
  export CXXFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CXXFLAGS")"
  export CPPFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CPPFLAGS")"

  # compile with HCC
  export CXX="/opt/rocm/hcc/bin/hcc"

  cmake -DCMAKE_BUILD_TYPE=Release \
        "$srcdir/rocFFT-rocm-$_pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/rocfft.conf"
/opt/rocm/rocfft/lib
EOF
}
