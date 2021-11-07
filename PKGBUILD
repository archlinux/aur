# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=elpa
PkgName=ELPA
pkgver=2021.05.002
_pkgver=${pkgver}_bugfix
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Eigenvalue SoLvers for Petaflop-Applications"
url="https://elpa.mpcdf.mpg.de"
license=("LGPL3")
depends=('scalapack')
makedepends=('gcc-fortran' 'python' 'vim')
provides=('elpa')
source=("$url/software/tarball-archive/Releases/$_pkgver/$pkgname-$_pkgver.tar.gz")
sha256sums=('deabc48de5b9e4b2f073d749d335c8f354a7ce4245b643a23b7951cd6c90224b')
options=(!makeflags !buildflags)

prepare() {
  export CC=mpicc
  export FC=mpifort
  unset FCFLAGS

  # Detecting AVX compatibility
  _AVXCOMP=$( gcc -march=native -dM -E - < /dev/null \
      | egrep "AVX" | sort | tail -n 1 | awk -F'_' '{print $3}' )
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

  # Checking CPU architecture
  if [ $CARCH == 'aarch64' ];
  then
    _SSE=no
    _AVX=no
    _AVX2=no
    _AVX512=no
    echo "No vectorization is enabled"
  fi
}

build() {
  cd "$srcdir/$pkgname-$_pkgver"
   ./configure --prefix=/usr                      \
               --enable-openmp                    \
               --enable-sse=$_SSE                 \
               --enable-sse-assembly=$_SSE        \
               --enable-avx=$_AVX                 \
               --enable-avx2=$_AVX2               \
               --enable-avx512=$_AVX512           \
               CFLAGS="-O2 -march=native"         \
               FCFLAGS="-O2 -march=native"        \
               LIBS='-lscalapack -lblas -llapack'
  make
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  make DESTDIR="$pkgdir" install
}
