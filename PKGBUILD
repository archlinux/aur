# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Daniel Kozak (kozzi) <kozzi11@gmail.com>
# Contributor: Mihails Strasuns <public@dicebot.lv>
# Contributor: Moritz Maxeiner <moritz@ucworks.org>
# Contributor: Jerome Berger <jeberger@free.fr>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Elijah Stone <elronnd@elronnd.net>

pkgbase=gdc-git
pkgname=('gdc-git' 'libgphobos-git')
pkgver=8.2.0+2.081.2
_branch=gdc-8 # Change here! pkgver/_gccver/_d_ver will be automatically updated.
_islver=0.19 # Change here!
_gccver=$(curl https://raw.githubusercontent.com/D-Programming-GDC/GDC/$_branch/gcc.version)
_d_ver=''
pkgrel=1
arch=('x86_64' 'i686')
license=('GPL3')
url="https://github.com/D-Programming-GDC/GDC"
pkgdesc="GCC based D compiler"
groups=('dlang' 'dlang-dmd')
makedepends=('git' 'gdc')
source=("ftp://gcc.gnu.org/pub/gcc/snapshots/${_gccver#gcc-}/$_gccver.tar.xz"
        "http://isl.gforge.inria.fr/isl-$_islver.tar.bz2"
        'gdc::git+https://github.com/D-Programming-GDC/GDC.git'
        'git+https://github.com/D-Programming-GDC/GDMD.git'
        'paths.diff')
sha512sums=('SKIP'
            '08f4db964d9e02ec8aa9779378ed76e0ddf1d56f81f87664dbf787555ce496cdc87e836f8a51ae137f45e648c604870cce07ee45919eafb549e404afb8f27083'
            'SKIP'
            'SKIP'
            '841504e9dffe718f7e5a5fbbf03299f2b51acd783d47f99894aa5d411abcc56aedfffd4b16595e3a9446f2206f9eb29cb01e235e82c211796cd24dc23c02b578')

pkgver() {
  echo "$(cat gdc/gcc.version | sed -e 's|gcc-||' -e 's|-.*||')$_d_ver"
}

prepare() {
  # Setup paths
  ln -sf "$srcdir"/$_gccver "$srcdir"/gcc
  ln -sf "$srcdir"/isl-$_islver "$srcdir"/gcc/isl

  # Setup gcc
  cd "$srcdir"/gcc

  sed -i 's|\./fixinc\.sh|-c true|' gcc/Makefile.in # Do not run fixincludes
  sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64 # Fix lib64 path
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure # hack! - some configure tests for header files using "$CPP $CPPFLAGS"

  # Seup gdc
  cd "$srcdir"/gdc

  git checkout $_branch
  git apply "$srcdir"/paths.diff
  ./setup-gcc.sh ../gcc

  mkdir "$srcdir"/gcc-build

  if [ -f gcc/d/verstr.h ]; then
    _d_ver="+$(cat gcc/d/verstr.h | sed 's|\"||g')"
  elif [ -f gcc/d/VERSION ]; then
    _d_ver="+$(cat gcc/d/VERSION | sed 's|\"||g')"
  fi
}

build() {
  cd "$srcdir"/gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  export CFLAGS="${CFLAGS/-pipe/} -O2"
  export CXXFLAGS="${CXXFLAGS/-pipe/} -O2"

  "$srcdir"/gcc/configure --prefix=/usr \
                          --libdir=/usr/lib \
                          --libexecdir=/usr/lib \
                          --mandir=/usr/share/man \
                          --infodir=/usr/share/info \
                          --enable-languages=d \
                          --enable-shared \
                          --enable-static \
                          --enable-threads=posix \
                          --enable-libmpx \
                          --with-system-zlib \
                          --with-isl \
                          --enable-__cxa_atexit \
                          --disable-libunwind-exceptions \
                          --enable-clocale=gnu \
                          --disable-libstdcxx-pch \
                          --disable-libssp \
                          --enable-gnu-unique-object \
                          --enable-linker-build-id \
                          --enable-plugin \
                          --enable-install-libiberty \
                          --with-linker-hash-style=gnu \
                          --enable-gnu-indirect-function \
                          --disable-multilib \
                          --disable-werror \
                          --disable-bootstrap \
                          --enable-default-pie \
                          --enable-default-ssp \
                          --with-bugurl=https://bugs.archlinux.org/ \
                          --with-pkgversion="GDC ${pkgver%+*} based on D v$_d_ver built with ISL $_isl for Arch Linux"
                          gdc_include_dir=/usr/include/dlang/gdc

                          #--enable-gold \ 


  make
}

package_gdc-git() {
  depends=('gcc' 'perl' 'binutils' 'libgphobos')
  provides=("d-compiler=${pkgver#*+}" 'gdc')
  conflicts=('gdc')
  pkgdesc="Compiler for D programming language which uses gcc backend"

  _libdir=usr/lib/gcc/$CHOST/${pkgver%+*}

  # Binaries
  install -Dm 755 gcc-build/gcc/gdc "$pkgdir"/usr/bin/gdc
  install -Dm 755 gcc-build/gcc/cc1d "$pkgdir"/$_libdir/cc1d
  install -Dm 755 GDMD/dmd-script "$pkgdir"/usr/bin/gdmd

  # Doc
  install -Dm 644 "$srcdir"/GDMD/dmd-script.1 "$pkgdir"/usr/share/man/man1/gdmd.1
}


package_libgphobos-git() {
  pkgdesc="Standard library for D programming language, GDC port"
  provides=('d-runtime' 'd-stdlib' 'libgphobos')
  conflicts=('libgpgobos')
  options=('staticlibs')

  cd "$srcdir"/gcc-build
  make -C $CHOST/libphobos DESTDIR="$pkgdir" install
}
