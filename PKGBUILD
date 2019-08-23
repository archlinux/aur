# Maintainer: Filipe Laíns (FFY-01) <lains@archlinux.org>
# Maintainer: Daniel Kozak (kozzi) <kozzi11@gmail.com>
# Contributor: Mihails Strasuns <public@dicebot.lv>
# Contributor: Moritz Maxeiner <moritz@ucworks.org>
# Contributor: Jerome Berger <jeberger@free.fr>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Elijah Stone <elronnd@elronnd.net>

pkgbase=gdc-git
pkgname=(gdc-git libgphobos-git)
_gccver=10.0.0
pkgver=10.0.0+v2.086.0

_branch=ibuclaw/gdc # Change here! pkgver/_gccver/_d_ver will be automatically updated.
_islver=0.21 # Change here!
_d_ver=''
pkgrel=2
arch=('x86_64' 'i686')
license=('GPL3')
url="https://gcc.gnu.org/"
pkgdesc="GCC based D compiler"
groups=('dlang')
makedepends=('git' 'gdc')
source=(
        "http://isl.gforge.inria.fr/isl-$_islver.tar.bz2"
        "gcc::git+https://github.com/gcc-mirror/gcc.git#branch=$_branch"
        'git+https://github.com/D-Programming-GDC/GDMD.git')
sha256sums=('d18ca11f8ad1a39ab6d03d3dcb3365ab416720fcb65b42d69f34f51bf0a0e859'
            'SKIP'
            'SKIP')

pkgver() {
  if [ -f gcc/gcc/d/dmd/VERSION ]; then
    _d_ver="+$(cat gcc/gcc/d/dmd/VERSION | sed 's|\"||g')"
  fi
  echo "$(cat gcc/gcc/BASE-VER)$_d_ver"
}

prepare() {
  [[ ! -d gcc ]] && ln -s gcc-$_gccver/+/-} gcc
  cd gcc

  [[ ! -d isl ]] && ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

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
      --with-bugurl=https://gcc.gnu.org/bugzilla/ \
      --with-pkgversion="GDC ${pkgver%+*} based on D ${pkgver#*+} built with ISL $_islver for Arch Linux" \
      --with-system-zlib \
      --enable-languages=d \
      --enable-static \
      --enable-threads=posix \
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
      --disable-multilib \
      --disable-werror \
      --disable-bootstrap \
      --enable-checking=release \
      --enable-default-pie \
      --enable-default-ssp \
      --enable-cet=auto \
      --with-target-system-zlib=yes

  make
}

package_gdc-git() {
  pkgdesc="Compiler for D programming language which uses gcc backend"
  depends=('gcc' 'perl' 'binutils' 'libgphobos')
  provides=("d-compiler=${pkgver#*+}" 'gdc')
  conflicts=('gdc' 'gcc-gdc')

  # Binaries
  install -Dm 755 gcc-build/gcc/gdc "$pkgdir"/usr/bin/gdc
  install -Dm 755 gcc-build/gcc/d21 "$pkgdir"/usr/lib/gcc/$CHOST/${pkgver%+*}/d21
  install -Dm 755 GDMD/dmd-script "$pkgdir"/usr/bin/gdmd

  cd gcc-build
  make -C lto-plugin DESTDIR="$pkgdir" install
  make -C $CHOST/libgcc DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/lib{,32}/libgcc_s.so*

  # Doc
  install -Dm 644 "$srcdir"/GDMD/dmd-script.1 "$pkgdir"/usr/share/man/man1/gdmd.1
}


package_libgphobos-git() {
  pkgdesc="Standard library for D programming language, GDC port"
  provides=('d-runtime' 'd-stdlib' 'libgphobos')
  conflicts=('libgphobos' 'gcc-gdc')
  options=('staticlibs')

  cd "$srcdir"/gcc-build
  make -C $CHOST/libphobos DESTDIR="$pkgdir" install

  mkdir -p -m 755 "$pkgdir"/usr/include/dlang

  ln -s /usr/lib/gcc/$CHOST/${pkgver%+*}/include/d "$pkgdir"/usr/include/dlang/gdc

  if [ -d "$pkgdir"/usr/lib64 ]; then
    mv "$pkgdir"/usr/lib64/* "$pkgdir"/usr/lib
    rmdir "$pkgdir"/usr/lib64
  fi
}
