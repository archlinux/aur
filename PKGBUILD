# Maintainer:  Rod Kay 

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname=gcc-ada-debug
pkgver=11.1.0
_majorver=${pkgver%%.*}
_islver=0.24
pkgrel=1
provides=(gcc-ada)
conflicts=(gcc-ada)
pkgdesc='Ada front-end for GCC (GNAT) with an unstripped runtime for effective debugging with gdb'
arch=(x86_64)
license=(GPL LGPL FDL custom)
url='https://gcc.gnu.org'
makedepends=(binutils libmpc gcc-ada doxygen lib32-glibc lib32-gcc-libs python git libxcrypt)
checkdepends=(dejagnu inetutils)
options=(!emptydirs)
_libdir=usr/lib/gcc/$CHOST/${pkgver%%+*}
# _commit=6beb39ee6c465c21d0cc547fd66b445100cdcc35
# source=(git://gcc.gnu.org/git/gcc.git#commit=$_commit
source=(https://sourceware.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz{,.sig}
        http://isl.gforge.inria.fr/isl-${_islver}.tar.xz
        c89 c99
        gdc_phobos_path.patch
        fs64270.patch
        ipa-fix-bit-CPP-when-combined-with-IPA-bit-CP.patch
        ipa-fix-ICE-in-get_default_value.patch
        gcc-ada-repro.patch
        gcc11-Wno-format-security.patch
        ada-strippers-binaries
        ada-strippers-libraries
)
validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62) # Jakub Jelinek <jakub@redhat.com>
sha256sums=('4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f076957afa1cc9ddf'
            'SKIP'
            '043105cc544f416b48736fff8caf077fb0663a717d06b1113f16e391ac99ebad'
            'de48736f6e4153f03d0a5d38ceb6c6fdb7f054e8f47ddd6af0a3dbf14f27b931'
            '2513c6d9984dd0a2058557bf00f06d8d5181734e41dcfe07be7ed86f2959622a'
            'c86372c207d174c0918d4aedf1cb79f7fc093649eb1ad8d9450dccc46849d308'
            '1ef190ed4562c4db8c1196952616cd201cfdd788b65f302ac2cc4dabb4d72cee'
            'fcb11c9bcea320afd202b031b48f8750aeaedaa4b0c5dddcd2c0a16381e927e4'
            '42865f2af3f48140580c4ae70b6ea03b5bdca0f29654773ef0d42ce00d60ea16'
            '1773f5137f08ac1f48f0f7297e324d5d868d55201c03068670ee4602babdef2f'
            '504e4b5a08eb25b6c35f19fdbe0c743ae4e9015d0af4759e74150006c283585e'
            'a321eb17edd27c18229cbe7d757ad48751c02eee676e3ded65f99fdef5d67779'
            '6a2dc45dd3d0b6c0ab07d222c3a4223afe09cc24ee67a77a470a9194b4cd237e')

prepare() {
  [[ ! -d gcc ]] && ln -s gcc-${pkgver/+/-} gcc
  cd gcc

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  # D hacks
  patch -p1 -i "$srcdir/gdc_phobos_path.patch"

  # Reproducible gcc-ada
  patch -Np0 < "$srcdir/gcc-ada-repro.patch"

  # configure.ac: When adding -Wno-format, also add -Wno-format-security
  patch -Np0 < "$srcdir/gcc11-Wno-format-security.patch"

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
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=ada \
      --with-isl \
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
      --enable-multilib \
      --enable-plugin \
      --enable-shared \
      --enable-threads=posix \
      --disable-libssp \
      --disable-libstdcxx-pch \
      --disable-libunwind-exceptions \
      --disable-werror \
      gdc_include_dir=/usr/include/dlang/gdc

  make
}

package() {
  depends=("gcc=$pkgver-$pkgrel")
#  provides=($pkgname-multilib)
#  replaces=($pkgname-multilib)
  options+=(staticlibs !strip)

  cd gcc-build/gcc
  make DESTDIR="$pkgdir" ada.install-{common,info}
  install -m755 gnat1 "$pkgdir/${_libdir}"

  cd "$srcdir"/gcc-build/$CHOST/libada
  make DESTDIR="${pkgdir}" INSTALL="install" \
    INSTALL_DATA="install -m644" install-libada

  cd "$srcdir"/gcc-build/$CHOST/32/libada
  make DESTDIR="${pkgdir}" INSTALL="install" \
    INSTALL_DATA="install -m644" install-libada

  ln -s gcc "$pkgdir/usr/bin/gnatgcc"

  # insist on dynamic linking, but keep static libraries because gnatmake complains
  mv "$pkgdir"/${_libdir}/adalib/libgna{rl,t}-${_majorver}.so "$pkgdir/usr/lib"
  ln -s libgnarl-${_majorver}.so "$pkgdir/usr/lib/libgnarl.so"
  ln -s libgnat-${_majorver}.so "$pkgdir/usr/lib/libgnat.so"
  rm -f "$pkgdir"/${_libdir}/adalib/libgna{rl,t}.so

  install -d "$pkgdir/usr/lib32/"
  mv "$pkgdir"/${_libdir}/32/adalib/libgna{rl,t}-${_majorver}.so "$pkgdir/usr/lib32"
  ln -s libgnarl-${_majorver}.so "$pkgdir/usr/lib32/libgnarl.so"
  ln -s libgnat-${_majorver}.so "$pkgdir/usr/lib32/libgnat.so"
  rm -f "$pkgdir"/${_libdir}/32/adalib/libgna{rl,t}.so

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"

  # Strip binaries and libraries.
  cd "$pkgdir"
  strip    @"$srcdir"/ada-strippers-binaries
  strip -S @"$srcdir"/ada-strippers-libraries
}
