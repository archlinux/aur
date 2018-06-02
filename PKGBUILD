pkgname=ghdl
pkgver=0.35
pkgrel=3
_gccver=7.3.0
_islver=0.18
arch=('aarch64' 'x86_64')
pkgdesc='VHDL simulator'
url='https://github.com/ghdl/ghdl'
license=('GPLv2')
makedepends=('gcc-ada' 'git')
install=ghdl.install
options=(!emptydirs staticlibs)

# This is the earliest commit that works with gcc-ada 8.1
source=(
  "git+https://github.com/ghdl/ghdl#commit=319092de002423fcd5f624d2f026176503ab6018"
  "https://gcc.gnu.org/pub/gcc/releases/gcc-${_gccver}/gcc-${_gccver}.tar.xz"
  "http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
)
sha256sums=(
  'SKIP'
  '832ca6ae04636adbb430e865a1451adf6979ab44ca1c8374f61fba65645ce15c'
  '6b8b0fd7f81d0a957beb3679c81bbb34ccc7568d5682844d8924424a0dadcb1b'
)

prepare() {
  ln -s gcc-${_gccver/+/-} gcc

  cd ghdl
  ./configure --prefix=/usr --with-gcc="${srcdir}/gcc"
  make copy-sources
  cd ..

  cd gcc

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # Arch Linux ARM installs aarch64 libraries /lib
  sed -i '/lp64=/s/lib64/lib/' gcc/config/aarch64/t-aarch64-linux

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir -p "$srcdir/gcc-build"
}

build() {
  cd gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  "$srcdir/gcc/configure" --prefix=/usr \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --enable-shared \
    --enable-threads=posix \
    --with-system-zlib \
    --with-isl \
    --enable-__cxa_atexit \
    --disable-libunwind-exceptions \
    --enable-clocale=gnu \
    --disable-libstdcxx-pch \
    --disable-libssp \
    --enable-gnu-unique-object \
    --enable-linker-build-id \
    --enable-lto \
    --enable-plugin \
    --enable-install-libiberty \
    --with-linker-hash-style=gnu \
    --enable-gnu-indirect-function \
    --disable-werror \
    --enable-checking=release \
    --enable-default-pie \
    --enable-default-ssp \
    \
    --enable-languages=vhdl \
    --disable-bootstrap \
    --disable-multilib \
    --disable-libgomp \
    --disable-libquadmath

  make

  cd "${srcdir}/ghdl"
  make -j1 \
    GHDL_GCC_BIN="${srcdir}/gcc-build/gcc/ghdl" \
    GHDL1_GCC_BIN="--GHDL1=${srcdir}/gcc-build/gcc/ghdl1" \
    ghdllib
}

package() {
  local _xgcc="${srcdir}/gcc-build/gcc/xgcc"
  local _machine=$(${_xgcc} -dumpmachine)
  local _version=$(${_xgcc} -dumpversion)
  cd "${srcdir}/gcc-build"

  # make a full install ...
  make DESTDIR="${pkgdir}" install

  # and remove files not specific to ghdl
  cd "${pkgdir}"
  rm -rf "usr/"{include,share/{locale,man}}
  find "usr/lib" \
    -maxdepth 1 -mindepth 1 -not -name 'gcc' -not -name 'ghdl' \
    -exec rm -rf {} +
  find "usr/lib/gcc/${_machine}/${_version}" \
    -maxdepth 1 -mindepth 1 -not -name 'ghdl*' \
    -exec rm -rf {} +
  find "usr/bin" "usr/share/info" \
    -maxdepth 1 -mindepth 1 -not -name 'ghdl*' \
    -exec rm -rf {} +

  # install ghdl-lib
  cd "${srcdir}/ghdl"
  make DESTDIR="${pkgdir}" install
}
