# $Id: PKGBUILD 323417 2018-05-07 09:03:46Z bpiotrowski $
# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: valgrind requires rebuilt with each major glibc version

pkgbase=glibc
pkgname=(glibc lib32-glibc)
pkgver=2.27
pkgrel=3
arch=(x86_64)
url='http://www.gnu.org/software/libc'
license=(GPL LGPL)
makedepends=(git gd lib32-gcc-libs)
options=(!strip staticlibs)
_commit=23158b08a0908f381459f273a984c6fd328363cb
#source=(git+https://sourceware.org/git/glibc.git#commit=$_commit
source=(https://ftp.gnu.org/gnu/glibc/glibc-$pkgver.tar.xz{,.sig}
        locale.gen.txt
        locale-gen
        lib32-glibc.conf
        bz20338.patch)
validpgpkeys=(7273542B39962DF7B299931416792B4EA25340F8) # Carlos O'Donell
md5sums=('898cd5656519ffbc3a03fe811dd89e82'
         'SKIP'
         '07ac979b6ab5eeb778d55f041529d623'
         '476e9113489f93b348b21e144b6a8fcf'
         '6e052f1cb693d5d3203f50f9d4e8c33b'
         'dc0d3ad59aeaaf591b085a77de6e03e9')

prepare() {
  mkdir -p glibc-build lib32-glibc-build

  [[ -d glibc-$pkgver ]] && ln -s glibc-$pkgver glibc 
  cd glibc

  local i; for i in ${source[@]}; do
    case ${i%::*} in
      *.patch)
        msg2 "Applying ${i}"
        patch -p1 -i "$srcdir/${i}"
        ;;
    esac
  done
}

build() {
  local _configure_flags=(
      --prefix=/usr
      --with-headers=/usr/include
      --with-bugurl=https://bugs.archlinux.org/
      --enable-add-ons
      --enable-bind-now
      --enable-lock-elision
      --enable-multi-arch
      --enable-stack-protector=strong
      --enable-stackguard-randomization
      --enable-static-pie
      --disable-profile
      --disable-werror
  )

  cd "$srcdir/glibc-build"

  echo "slibdir=/usr/lib" >> configparms
  echo "rtlddir=/usr/lib" >> configparms
  echo "sbindir=/usr/bin" >> configparms
  echo "rootsbindir=/usr/bin" >> configparms

  # remove fortify for building libraries
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}

  "$srcdir/glibc/configure" \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      ${_configure_flags[@]}

  # build libraries with fortify disabled
  echo "build-programs=no" >> configparms
  make

  # re-enable fortify for programs
  sed -i "/build-programs=/s#no#yes#" configparms

  echo "CC += -D_FORTIFY_SOURCE=2" >> configparms
  echo "CXX += -D_FORTIFY_SOURCE=2" >> configparms
  make

  cd "$srcdir/lib32-glibc-build"
  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"

  echo "slibdir=/usr/lib32" >> configparms
  echo "rtlddir=/usr/lib32" >> configparms
  echo "sbindir=/usr/bin" >> configparms
  echo "rootsbindir=/usr/bin" >> configparms

  # remove fortify for building libraries
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}
  CFLAGS=${CFLAGS/-fno-plt/}
  CXXFLAGS=${CXXFLAGS/-fno-plt/}

  "$srcdir/glibc/configure" \
      --host=i686-pc-linux-gnu \
      --libdir=/usr/lib32 \
      --libexecdir=/usr/lib32 \
      ${_configure_flags[@]}

  # build libraries with fortify disabled
  echo "build-programs=no" >> configparms
  make

  # re-enable fortify for programs
  sed -i "/build-programs=/s#no#yes#" configparms

  echo "CC += -D_FORTIFY_SOURCE=2" >> configparms
  echo "CXX += -D_FORTIFY_SOURCE=2" >> configparms
  make

}

check() {
  cd glibc-build

  # remove fortify in preparation to run test-suite
  sed -i '/FORTIFY/d' configparms

  # some failures are "expected"
  make check || true
}

package_glibc() {
  pkgdesc='GNU C Library'
  depends=('linux-api-headers>=4.10' tzdata filesystem)
  optdepends=('gd: for memusagestat')
  install=glibc.install
  backup=(etc/gai.conf
          etc/locale.gen
          etc/nscd.conf)
  groups=(base)

  install -dm755 "$pkgdir/etc"
  touch "$pkgdir/etc/ld.so.conf"

  make -C glibc-build install_root="$pkgdir" install
  rm -f "$pkgdir"/etc/ld.so.{cache,conf}

  cd glibc

  install -dm755 "$pkgdir"/usr/lib/{locale,systemd/system,tmpfiles.d}
  install -m644 nscd/nscd.conf "$pkgdir/etc/nscd.conf"
  install -m644 nscd/nscd.service "$pkgdir/usr/lib/systemd/system"
  install -m644 nscd/nscd.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/nscd.conf"
  install -dm755 "$pkgdir/var/db/nscd"

  install -m644 posix/gai.conf "$pkgdir"/etc/gai.conf

  install -m755 "$srcdir/locale-gen" "$pkgdir/usr/bin"

  # Create /etc/locale.gen
  install -m644 "$srcdir/locale.gen.txt" "$pkgdir/etc/locale.gen"
  sed -e '1,3d' -e 's|/| |g' -e 's|\\| |g' -e 's|^|#|g' \
    "$srcdir/glibc/localedata/SUPPORTED" >> "$pkgdir/etc/locale.gen"

  if check_option 'debug' n; then
    find "$pkgdir"/usr/bin -type f -executable -exec strip $STRIP_BINARIES {} + 2> /dev/null || true
    find "$pkgdir"/usr/lib -name '*.a' -type f -exec strip $STRIP_STATIC {} + 2> /dev/null || true

    # Do not strip these for gdb and valgrind functionality, but strip the rest
    find "$pkgdir"/usr/lib \
      -not -name 'ld-*.so' \
      -not -name 'libc-*.so' \
      -not -name 'libpthread-*.so' \
      -not -name 'libthread_db-*.so' \
      -name '*-*.so' -type f -exec strip $STRIP_SHARED {} + 2> /dev/null || true
  fi
}

package_lib32-glibc() {
  pkgdesc='GNU C Library (32-bit)'
  depends=("glibc=$pkgver")

  cd lib32-glibc-build

  make install_root="$pkgdir" install
  rm -rf "$pkgdir"/{etc,sbin,usr/{bin,sbin,share},var}

  # We need to keep 32 bit specific header files
  find "$pkgdir/usr/include" -type f -not -name '*-32.h' -delete

  # Dynamic linker
  install -d "$pkgdir/usr/lib"
  ln -s ../lib32/ld-linux.so.2 "$pkgdir/usr/lib/"

  # Add lib32 paths to the default library search path
  install -Dm644 "$srcdir/lib32-glibc.conf" "$pkgdir/etc/ld.so.conf.d/lib32-glibc.conf"

  # Symlink /usr/lib32/locale to /usr/lib/locale
  ln -s ../lib/locale "$pkgdir/usr/lib32/locale"

  if check_option 'debug' n; then
    find "$pkgdir"/usr/lib32 -name '*.a' -type f -exec strip $STRIP_STATIC {} + 2> /dev/null || true
    find "$pkgdir"/usr/lib32 \
      -not -name 'ld-*.so' \
      -not -name 'libc-*.so' \
      -not -name 'libpthread-*.so' \
      -not -name 'libthread_db-*.so' \
      -name '*-*.so' -type f -exec strip $STRIP_SHARED {} + 2> /dev/null || true
  fi
}
