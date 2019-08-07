# Maintainer:  Daniel Kozak <kozzi11@gmail.com>

pkgname=(gdc-static)
pkgver=9.1.0
_majorver=${pkgver:0:1}
_islver=0.21
pkgrel=1
pkgdesc='The GNU D compiler (part of official gcc distribution with static phobos)'
arch=(x86_64)
license=(GPL LGPL FDL custom)
url='https://gcc.gnu.org'
makedepends=(binutils libmpc python subversion)
checkdepends=(dejagnu inetutils)
options=(!emptydirs)
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz
        http://isl.gforge.inria.fr/isl-${_islver}.tar.xz
        c89 c99
        bz90397.patch
        bz90949.patch
        phobos_path.patch)
sha256sums=('79a66834e96a6050d8fe78db2c3b32fb285b230b855d0a66288235bc04b327a0'
            '777058852a3db9500954361e294881214f6ecd4b594c00da5eee974cd6a54960'
            'de48736f6e4153f03d0a5d38ceb6c6fdb7f054e8f47ddd6af0a3dbf14f27b931'
            '2513c6d9984dd0a2058557bf00f06d8d5181734e41dcfe07be7ed86f2959622a'
            'cc20d05bcc6cb35bf0944b391f0b0380af375f2a8a03ce1cd67835884bc41fac'
            'c860819e730faf1621e1286ebe3a0179df6e25182b81a9ca0a3db02633982a14'
            'c86372c207d174c0918d4aedf1cb79f7fc093649eb1ad8d9450dccc46849d308')

_libdirpath=usr/lib/gdc

_libdir="$_libdirpath"/gcc/$CHOST/${pkgver%%+*}


prepare() {
  [[ ! -d gcc ]] && ln -s gcc-${pkgver/+/-} gcc
  cd gcc

  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90397
  patch -p0 -i "$srcdir/bz90397.patch"

  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90949
  patch -p0 -i "$srcdir/bz90949.patch"

  # Seup gdc include dir path
  patch -p1 -i "$srcdir"/phobos_path.patch

  # link isl for in-tree build
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
      --libdir="/$_libdirpath" \
      --libexecdir="/$_libdirpath" \
      --mandir=/usr/share/man \
      --infodir=/usr/share/info \
      --with-bugurl=https://gcc.gnu.org/bugzilla/ \
      --enable-languages=d \
      --enable-static \
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
      --disable-multilib \
      --disable-werror \
      --disable-bootstrap \
      --enable-checking=release \
      --enable-default-pie \
      --enable-default-ssp \
      --enable-cet=auto \
      --with-target-system-zlib=yes \
      gdc_include_dir=/usr/include/dlang/gdc

  make
}

package_gdc-static() {
  pkgdesc="Compiler for D programming language which uses gcc backend"
  depends=('gcc')
  provides=(d-compiler=2.076.1 gdc libgphobos libgphobos.so libgdruntime.so)
  conflicts=('gdc' 'libgphobos' 'gcc-gdc')
  options=('staticlibs')

  cd gcc-build
  make -C gcc DESTDIR="$pkgdir" d.install-{common,man,info}
  make -C $CHOST/libphobos DESTDIR="$pkgdir" install
  make -C lto-plugin DESTDIR="$pkgdir" install
  make -C $CHOST/libgcc DESTDIR="$pkgdir" install

  # Binaries
  install -Dm 755 gcc/gdc "$pkgdir"/usr/bin/gdc
  install -Dm 755 gcc/d21 "$pkgdir"/"$_libdir"/d21
  #install -Dm 755 ../GDMD/dmd-script "$pkgdir"/usr/bin/gdmd


  # Doc
  #install -Dm 644 "$srcdir"/GDMD/dmd-script.1 "$pkgdir"/usr/share/man/man1/gdmd.1

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"

  mkdir -p -m 755 "$pkgdir"/usr/include/dlang
  ln -s /"${_libdir}"/include/d "$pkgdir"/usr/include/dlang/gdc

  if [ -d "$pkgdir"/usr/lib/lib ]; then
    mv "$pkgdir"/usr/lib/lib/* "$pkgdir"/usr/lib
    rmdir "$pkgdir"/usr/lib/lib
  fi

  rm -f "$pkgdir"/usr/lib{,32}/libgcc_s.so*

}
