# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=elpa
pkgver=2025.01.001
_pkgver=${pkgver}
pkgrel=1
arch=(x86_64 aarch64)
pkgdesc="Eigenvalue SoLvers for Petaflop-Applications"
url="https://elpa.mpcdf.mpg.de"
license=(LGPL-3.0-only)
depends=(blas-openblas scalapack python-numpy python-mpi4py)
makedepends=(gcc-fortran cython vim)
source=($url/software/tarball-archive/Releases/$pkgver/$pkgname-$_pkgver.tar.gz)
sha256sums=('3ef0c6aed9a3e05db6efafe6e14d66eb88b2a1354d61e765b7cde0d3d5f3951e')
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

  # Checking CPU architecture
  if [ $CARCH == 'aarch64' ];
  then
    _SSE=no
    _AVX=no
    _AVX2=no
    _AVX512=no
    echo "No vectorization is enabled"
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
    --enable-sse=$_SSE \
    --enable-sse-assembly=$_SSE \
    --enable-avx=$_AVX \
    --enable-avx2=$_AVX2 \
    --enable-avx512=$_AVX512 \
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
