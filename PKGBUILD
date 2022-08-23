# Maintainer:  Rod Kay   <rodakay5 at gmail.com>

#RAK lines are commented out by me (Rod Kay)

# toolchain build order: linux-api-headers->glibc->binutils->gcc->glibc->binutils->gcc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname=gcc-ada-debug
pkgver=12.2.0
_commit=2ee5e4300186a92ad73f1a1a64cb918dc76c8d67
_majorver=${pkgver%%.*}
pkgrel=1
provides=(gcc-ada)
conflicts=(gcc-ada)
pkgdesc='Ada front-end for GCC (GNAT) with an unstripped runtime for effective debugging with gdb'
arch=(x86_64)
license=(GPL3 LGPL FDL custom)
url='https://gcc.gnu.org'
makedepends=(
  binutils
  doxygen
  gcc-ada
#RAK  gcc-d
  git
  lib32-glibc
  lib32-gcc-libs
  libisl
  libmpc
  libxcrypt
  python
  zstd
)
checkdepends=(
  dejagnu
  expect
  inetutils
  python-pytest
  tcl
)
options=(!emptydirs !lto debug)
_libdir=usr/lib/gcc/$CHOST/${pkgver%%+*}
# _commit=6beb39ee6c465c21d0cc547fd66b445100cdcc35
# source=(git://gcc.gnu.org/git/gcc.git#commit=$_commit
source=(git+https://sourceware.org/git/gcc.git#commit=${_commit}
        c89 c99
        gcc-ada-repro.patch
        ada-strippers-binaries
        ada-strippers-libraries
)
validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62) # Jakub Jelinek <jakub@redhat.com>
sha256sums=('SKIP'
            'de48736f6e4153f03d0a5d38ceb6c6fdb7f054e8f47ddd6af0a3dbf14f27b931'
            '2513c6d9984dd0a2058557bf00f06d8d5181734e41dcfe07be7ed86f2959622a'
            '1773f5137f08ac1f48f0f7297e324d5d868d55201c03068670ee4602babdef2f'
            '259f1d6791597ce1383a93611a6bdb21d896fbf63e1503f2549770a656eda413'
            '31e8ee1137195cb9e6eb7655832f0435bb2b2d4e95d387e10cd6560217e107be')

prepare() {
  [[ ! -d gcc ]] && ln -s gcc-${pkgver/+/-} gcc
  cd gcc

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # Reproducible gcc-ada
  patch -Np0 < "$srcdir/gcc-ada-repro.patch"

  mkdir -p "$srcdir/gcc-build"
  mkdir -p "$srcdir/libgccjit-build"
}

build() {
  local _confflags=(
      --prefix=/usr
      --libdir=/usr/lib
      --libexecdir=/usr/lib
      --mandir=/usr/share/man
      --infodir=/usr/share/info
      --with-bugurl=https://bugs.archlinux.org/
      --with-build-config=bootstrap-lto
      --with-linker-hash-style=gnu
      --with-system-zlib
      --enable-__cxa_atexit
      --enable-cet=auto
      --enable-checking=release
      --enable-clocale=gnu
      --enable-default-pie
      --enable-default-ssp
      --enable-gnu-indirect-function
      --enable-gnu-unique-object
      --enable-libstdcxx-backtrace
      --enable-link-serialization=1
      --enable-linker-build-id
      --enable-lto
      --enable-multilib
      --enable-plugin
      --enable-shared
      --enable-threads=posix
      --disable-libssp
      --disable-libstdcxx-pch
      --disable-werror
  )

  cd gcc-build

  # Credits @allanmcrae
  # https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/gcc/PKGBUILD
  # TODO: properly deal with the build issues resulting from this
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  "$srcdir/gcc/configure" \
    --enable-languages=ada \
    --enable-bootstrap \
    "${_confflags[@]:?_confflags unset}"

  # see https://bugs.archlinux.org/task/71777 for rationale re *FLAGS handling
  make -O STAGE1_CFLAGS="-O2" \
          BOOT_CFLAGS="$CFLAGS" \
          BOOT_LDFLAGS="$LDFLAGS" \
          LDFLAGS_FOR_TARGET="$LDFLAGS" \
          bootstrap

  # make documentation
#RAK  make -O -C $CHOST/libstdc++-v3/doc doc-man-doxygen

  # Build libgccjit separately, to avoid building all compilers with --enable-host-shared
  # which brings a performance penalty
#RAK  cd "${srcdir}"/libgccjit-build

#RAK  "$srcdir/gcc/configure" \
#RAK    --enable-languages=jit \
#RAK    --disable-bootstrap \
#RAK    --enable-host-shared \
#RAK    "${_confflags[@]:?_confflags unset}"

  # see https://bugs.archlinux.org/task/71777 for rationale re *FLAGS handling
#RAK  make -O STAGE1_CFLAGS="-O2" \
#RAK          BOOT_CFLAGS="$CFLAGS" \
#RAK          BOOT_LDFLAGS="$LDFLAGS" \
#RAK          LDFLAGS_FOR_TARGET="$LDFLAGS" \
#RAK          all-gcc

#RAK  cp -a gcc/libgccjit.so* ../gcc-build/gcc/
}

#RAK check() {
#RAK   cd gcc-build

  # disable libphobos test to avoid segfaults
#RAK   sed -i '/maybe-check-target-libphobos \\/d' Makefile

  # do not abort on error as some are "expected"
#RAK   make -O -k check || true
#RAK   "$srcdir/gcc/contrib/test_summary"
#RAK }

package() {
#RAK  pkgdesc='Ada front-end for GCC (GNAT)'
  depends=(gcc libisl.so)
#RAK  depends=("gcc=$pkgver-$pkgrel" libisl.so)
#RAK  provides=($pkgname-multilib)
#RAK  replaces=($pkgname-multilib)
  options=(!emptydirs staticlibs debug !strip)

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
