# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=elpa
pkgver=2026.02.002
_pkgver=${pkgver}
pkgrel=1
arch=(x86_64 aarch64)
pkgdesc="Eigenvalue SoLvers for Petaflop-Applications"
url="https://elpa.mpcdf.mpg.de"
license=(LGPL-3.0-only)
depends=(blas-openblas scalapack python-numpy python-mpi4py)
makedepends=(gcc-fortran cython vim)
source=($url/software/tarball-archive/Releases/$pkgver/$pkgname-$_pkgver.tar.gz)
sha256sums=('02e3c59fec53cd8eb66a4cc15fa4fbf190cf9654227223fb8ad55713e9427932')
options=(!makeflags !buildflags)

prepare() {
  # Detecting vectorization compatibility
  _AVXCOMP=$( gfortran -march=native -dM -E - < /dev/null \
    | grep -E "AVX" \
    | sort -d \
    | tail -n 1 \
    | awk -F'_' '{print $3}' )

  case $_AVXCOMP in
    AVX512*)
      _AVX=yes
      _AVX2=yes
      _AVX512=yes
      echo "Full vectorization is enabled"
      ;;
    AVX2)
      _AVX=yes
      _AVX2=yes
      _AVX512=no
      echo "Improved vectorization is enabled"
      ;;
    AVX)
      _AVX=yes
      _AVX2=no
      _AVX512=no
      echo "Basic vectorization is enabled"
      ;;
    *)
      _AVX=no
      _AVX2=no
      _AVX512=no
      echo "No advanced vectorization is enabled"
      ;;
  esac

  # SSE is always enabled on x86_64 architecture
  _SSE=yes

  _NEON=no
  _SVE128=no

  # Checking CPU architecture
  if [ $CARCH == 'aarch64' ];
  then
    _SSE=no
    _AVX=no
    _AVX2=no
    _AVX512=no

    _NEON=yes
    echo "NEON vectorization is enabled"

    if gfortran -march=native -dM -E - < /dev/null | grep -q '__ARM_FEATURE_SVE\b'; then
      _SVE128=yes
      echo "SVE128 vectorization is enabled"
    fi
  fi

  # Python version
  _python_version=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')

  # Python 3 semantics
  sed -i "s@cython@cython -3@" "$srcdir/$pkgname-$pkgver/Makefile.am"

  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -if
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --enable-openmp \
    --enable-sse-kernels=$_SSE \
    --enable-sse-assembly-kernels=$_SSE \
    --enable-avx-kernels=$_AVX \
    --enable-avx2-kernels=$_AVX2 \
    --enable-avx512-kernels=$_AVX512 \
    --enable-neon-arch64-kernels=$_NEON \
    --enable-sve128-kernels=$_SVE128 \
    --enable-autotune-redistribute-matrix \
    --enable-python \
    --enable-scalapack-tests \
    --without-threading-support-check-during-build \
    FC="mpifort" \
    CFLAGS="-O2 -march=native" \
    FCFLAGS="-O2 -march=native -fallow-argument-mismatch" \
    LIBS="-lscalapack -lblas -llapack -lmpi" \
    PYTHON_INCLUDE="-I/usr/include/python$_python_version"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
