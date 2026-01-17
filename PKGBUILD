# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=libint
pkgname=libint2
pkgver=2.12.0
pkgrel=1
pkgdesc='A high-performance library for computing Gaussian integrals in quantum mechanics'
url='https://github.com/evaleev/libint'
license=(GPL-3.0-only LGPL-3.0-only)
arch=(x86_64)
depends=(boost)
makedepends=(cmake ninja clang gcc-fortran eigen python pybind11)
source=($pkgname-$pkgver.tar.gz::"https://github.com/evaleev/libint/archive/v$pkgver.tar.gz"
        cmake.patch)
sha256sums=('732988a1ea95eb4eae91bcb2b2a718d95dc5caca41533746fc4111532d55ae74'
            'ec642f0ce40ed833e3c2b70575b7fdfdb4b5858a99cbe80a174c38500cc0396c')
options=(!buildflags)

prepare() {
  cd "$_pkgname-$pkgver"
  ./autogen.sh

  # Detecting FMA support
  if [ $( clang -march=native -dM -E - < /dev/null | egrep "FMA__" | tail -c 2 ) == 1 ]
  then
    FMA=yes
    CXXFLAGS="-O2 -mfma"
    FCFLAGS="-O2 -mfma"
    echo "Support of FMA intrinsics is enabled"
  else
    FMA=no
    CXXFLAGS="-O2"
    FCFLAGS="-O2"
    echo "Support of FMA intrinsics is disabled"
  fi

  # Setting build environment
  export CXXGENFLAGS="$CXXFLAGS"
}

build() {
  ## generating libint library
  tarball_build_dir="$srcdir/prepare_tarball"
  libint_build_dir="$srcdir/build_libint"

  # create dir for building tarball
  mkdir -p "$tarball_build_dir"

  # run conf from building tarball dir
  cd "$tarball_build_dir"
  ../$_pkgname-$pkgver/configure \
    --enable-eri=1 \
    --enable-eri2=1 \
    --enable-eri3=1 \
    --enable-fma=$FMA \
    --with-max-am=5 \
    --with-eri-max-am=5,4 \
    --with-eri2-max-am=7,6 \
    --with-eri3-max-am=7,6 \
    --with-opt-am=3 \
    CC=clang \
    CXX=clang++ \
    CXXFLAGS="$CXXFLAGS" \
    FCFLAGS="$FCFLAGS"
  make export

  ## compiling libint library
  # create dir for building libint
  mkdir -p "$libint_build_dir"

  tar xzf "$tarball_build_dir/$_pkgname-$pkgver.tgz" -C "$libint_build_dir"

  cd "$libint_build_dir/$_pkgname-$pkgver"
  cmake \
    -B build \
    -S . \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_C_COMPILER=clang \
    -D CMAKE_CXX_COMPILER=clang++ \
    -D CMAKE_CXX_FLAGS="$CXXFLAGS" \
    -D CMAKE_Fortran_FLAGS="$FCFLAGS" \
    -D ENABLE_FORTRAN=ON \
    -D LIBINT2_PYTHON=ON \
    -D LIBINT2_BUILD_SHARED_AND_STATIC_LIBS=ON \
    -G Ninja \
    -W no-dev
  cmake --build build
}

check() {
  libint_build_dir="${srcdir}/build_libint"
  cd "$libint_build_dir/${_pkgname}-${pkgver}"
  cmake --build build --target check
}

package() {
  libint_build_dir="${srcdir}/build_libint"
  cd "$libint_build_dir/${_pkgname}-${pkgver}"
  DESTDIR="$pkgdir" cmake --install build

  cd "$pkgdir/usr/lib/cmake"
  patch -p0 < "$srcdir/cmake.patch"
}
