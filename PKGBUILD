# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=elpa
PkgName=ELPA
pkgver=2023.05.001
_pkgver=${pkgver}
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Eigenvalue SoLvers for Petaflop-Applications"
url="https://elpa.mpcdf.mpg.de"
license=("LGPL3")
depends=('scalapack' 'python-numpy' 'python-mpi4py')
makedepends=('gcc-fortran' 'vim' 'cython')
provides=('elpa')
source=("$url/software/tarball-archive/Releases/$_pkgver/$pkgname-$_pkgver.tar.gz")
sha256sums=('ec64be5d6522810d601a3b8e6a31720e3c3eb4af33a434d8a64570d76e6462b6')
options=(!makeflags !buildflags)

prepare() {
  export CC=mpicc
  export FC=mpifort
  unset FCFLAGS

  # Detecting vectorization compatibility
  _AVXCOMP=$( $CC -march=native -dM -E - < /dev/null \
    | grep -E "AVX" | sort -d | tail -n 1 | awk -F'_' '{print $3}' )
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

  # Python 3 semantics
  sed -i 's/cython/cython -3/' "$srcdir/$pkgname-$_pkgver/Makefile.am"

  cd "$srcdir/$pkgname-$_pkgver"
  autoreconf -fi
}

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  ./configure \
    --prefix=/usr                                         \
    --enable-openmp                                       \
    --enable-sse=$_SSE                                    \
    --enable-sse-assembly=$_SSE                           \
    --enable-avx=$_AVX                                    \
    --enable-avx2=$_AVX2                                  \
    --enable-avx512=$_AVX512                              \
    --enable-autotune-redistribute-matrix                 \
    --enable-python                                       \
    --enable-scalapack-tests                              \
    --without-threading-support-check-during-build        \
    CFLAGS='-O2 -march=native'                            \
    FCFLAGS='-O2 -march=native -fallow-argument-mismatch' \
    LIBS='-lscalapack -lblas -llapack -lmpi_cxx'          \
    CPP='cpp'
  make
}

check() {
  cd "$srcdir/$pkgname-$_pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  make DESTDIR="$pkgdir" install
}
