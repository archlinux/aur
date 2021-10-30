# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>
# Contributor: Peter Jung <admin@ptr1337.dev>

pkgname=(gccrs)
pkgver=11.2.0
_majorver=${pkgver%%.*}
_islver=0.24
pkgrel=1
pkgdesc='Rust Front-End for GCC'
arch=(x86_64)
license=(GPL LGPL FDL custom)
url='https://github.com/Rust-GCC/gccrs'
makedepends=(binutils libmpc gcc-ada doxygen lib32-glibc lib32-gcc-libs python git libxcrypt)
checkdepends=(dejagnu inetutils)
options=(!emptydirs !strip)
provides=(libgccrs.so $pkgname-multilib)
replaces=($pkgname-multilib)
source=(git+https://github.com/Rust-GCC/gccrs.git)

pkgver() {
  cd ${pkgbase%-git}
  echo "$(cat gcc/BASE-VER)_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd gccrs

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir -p "$srcdir/gccrs-build"
}

build() {
  cd gccrs-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  "$srcdir/gccrs/configure" --prefix=/usr \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --mandir=/usr/share/man \
      --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=rust \
      --with-linker-hash-style=gnu \
      --with-system-zlib \
      --enable-__cxa_atexit \
      --enable-cet=auto \
      --enable-checking=release \
      --enable-clocale=gnu \
      --enable-default-pie \
      --enable-default-ssp \
      --enable-gnu-indirect-function \
      --enable-gnu-unique-object \
      --enable-install-libiberty \
      --enable-linker-build-id \
      --enable-lto \
      --disable-multilib \
      --enable-plugin \
      --enable-shared \
      --enable-threads=posix \
      --disable-libssp \
      --disable-libstdcxx-pch \
      --disable-libunwind-exceptions \
      --disable-werror \
      --disable-bootstrap \
      gdc_include_dir=/usr/include/dlang/gdc

  make

}

check() {
  cd gccrs-build

  # disable libphobos test to avoid segfaults and other unfunny ways to waste my time
  sed -i '/maybe-check-target-libphobos \\/d' Makefile

  make check-rust || true
}

package() {
  cd gccrs-build
  make DESTDIR="$pkgdir" install-strip
}
