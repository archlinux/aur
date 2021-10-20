# Maintainer:  Dakkshesh <dakkshesh5@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: valgrind requires rebuilt with each major glibc version

pkgbase=glibc-x86_64
pkgname=(glibc-x86_64 lib32-glibc-x86_64)
pkgver=2.34
pkgrel=1
arch=(x86_64)
url='https://www.gnu.org/software/libc'
license=(GPL LGPL)
makedepends=(git gd lib32-gcc-libs python)
optdepends=('perl: for mtrace')
options=(!strip staticlibs)
source=("https://ftp.gnu.org/gnu/glibc/glibc-$pkgver.tar.xz"
        locale.gen.txt
        locale-gen
        lib32-glibc.conf
        sdt.h sdt-config.h)
md5sums=('31998b53fb39cb946e96abc310af1c89'
         '07ac979b6ab5eeb778d55f041529d623'
         '476e9113489f93b348b21e144b6a8fcf'
         '6e052f1cb693d5d3203f50f9d4e8c33b'
         '91fec3b7e75510ae2ac42533aa2e695e'
         '680df504c683640b02ed4a805797c0b2')

prepare() {
  mkdir -p glibc-build lib32-glibc-build

  [[ -d glibc-$pkgver ]] && ln -s glibc-$pkgver glibc 
  cd glibc
}

build() {

  cd "$srcdir/glibc-build"
  echo "slibdir=/usr/lib" >> configparms
  echo "rtlddir=/usr/lib" >> configparms
  echo "sbindir=/usr/bin" >> configparms
  echo "rootsbindir=/usr/bin" >> configparms

  unset CFLAGS
  unset CXXFLAGS
  "$srcdir/glibc/configure" \
        --host=x86_64-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib \
        --libexecdir=/usr/lib \
        --with-headers=/usr/include \
        --with-bugurl=https://bugs.archlinux.org/ \
        --enable-add-ons \
        --enable-bind-now \
        --enable-cet \
        --enable-kernel=4.4 \
        --enable-lock-elision \
        --enable-multi-arch \
        --enable-stack-protector=strong \
        --enable-stackguard-randomization \
        --disable-profile \
        --enable-static-pie \
        --enable-systemtap \
        --disable-werror

  # build libraries with fortify disabled
  echo "build-programs=no" >> configparms
  make CFLAGS="-O2 -pipe -U_FORTIFY_SOURCE -ffunction-sections -fdata-sections" CXXFLAGS="-O2 -pipe -U_FORTIFY_SOURCE -ffunction-sections -fdata-sections" -j$(($(nproc --all) + 2))

  # re-enable fortify for programs
  sed -i "/build-programs=/s#no#yes#" configparms

  unset CFLAGS
  unset CXXFLAGS
  "$srcdir/glibc/configure" \
      --host=x86_64-pc-linux-gnu \
      --prefix=/usr \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --with-headers=/usr/include \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-add-ons \
      --enable-bind-now \
      --enable-cet \
      --enable-kernel=4.4 \
      --enable-lock-elision \
      --enable-multi-arch \
      --enable-stack-protector=strong \
      --enable-stackguard-randomization \
      --disable-profile \
      --enable-static-pie \
      --enable-systemtap \
      --disable-werror

  echo "CC += -D_FORTIFY_SOURCE=2" >> configparms
  echo "CXX += -D_FORTIFY_SOURCE=2" >> configparms
  make CFLAGS="-O2 -pipe -D_FORTIFY_SOURCE=2 -ffunction-sections -fdata-sections" CXXFLAGS="-O2 -pipe -D_FORTIFY_SOURCE=2 -ffunction-sections -fdata-sections" -j$(($(nproc --all) + 2))

  # build info pages manually for reprducibility
  make info -j$(($(nproc --all) + 2))

  cd "$srcdir/lib32-glibc-build"
  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"

  echo "slibdir=/usr/lib32" >> configparms
  echo "rtlddir=/usr/lib32" >> configparms
  echo "sbindir=/usr/bin" >> configparms
  echo "rootsbindir=/usr/bin" >> configparms

  unset CFLAGS
  unset CXXFLAGS
  "$srcdir/glibc/configure" \
      --host=i686-pc-linux-gnu \
      --prefix=/usr \
      --libdir=/usr/lib32 \
      --libexecdir=/usr/lib32 \
      --with-headers=/usr/include \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-add-ons \
      --enable-bind-now \
      --enable-cet \
      --enable-kernel=4.4 \
      --enable-lock-elision \
      --enable-multi-arch \
      --enable-stack-protector=strong \
      --enable-stackguard-randomization \
      --disable-profile \
      --enable-static-pie \
      --enable-systemtap \
      --disable-werror

  # build libraries with fortify disabled
  echo "build-programs=no" >> configparms
  make CFLAGS="-mno-tls-direct-seg-refs -O2 -pipe -U_FORTIFY_SOURCE -ffunction-sections -fdata-sections" CXXFLAGS="-mno-tls-direct-seg-refs -O2 -pipe -U_FORTIFY_SOURCE -ffunction-sections -fdata-sections" -j$(($(nproc --all) + 2))

  # re-enable fortify for programs
  sed -i "/build-programs=/s#no#yes#" configparms

  unset CFLAGS
  unset CXXFLAGS
  "$srcdir/glibc/configure" \
      --host=i686-pc-linux-gnu \
      --prefix=/usr \
      --libdir=/usr/lib32 \
      --libexecdir=/usr/lib32 \
      --with-headers=/usr/include \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-add-ons \
      --enable-bind-now \
      --enable-cet \
      --enable-kernel=4.4 \
      --enable-lock-elision \
      --enable-multi-arch \
      --enable-stack-protector=strong \
      --enable-stackguard-randomization \
      --disable-profile \
      --enable-static-pie \
      --enable-systemtap \
      --disable-werror

  echo "CC += -D_FORTIFY_SOURCE=2" >> configparms
  echo "CXX += -D_FORTIFY_SOURCE=2" >> configparms
  make CFLAGS="-mno-tls-direct-seg-refs -O2 -pipe -D_FORTIFY_SOURCE=2 -ffunction-sections -fdata-sections" CXXFLAGS="-mno-tls-direct-seg-refs -O2 -pipe -D_FORTIFY_SOURCE=2 -ffunction-sections -fdata-sections" -j$(($(nproc --all) + 2))

}

check() {
  cd glibc-build

  #remove fortify in preparation to run test-suite
  sed -i '/FORTIFY/d' configparms

  #some failures are "expected"
  make check || true
}

package_glibc-x86_64() {
  pkgdesc='GNU C Library'
  depends=('linux-api-headers>=4.10' tzdata filesystem)
  provides=("glibc=${pkgver}")
  conflicts=('glibc')
  optdepends=('gd: for memusagestat')
  install=glibc.install
  backup=(etc/gai.conf
          etc/locale.gen
          etc/nscd.conf)

  install -dm755 "$pkgdir/etc"
  touch "$pkgdir/etc/ld.so.conf"

  make -C glibc-build install_root="$pkgdir" install -j$(($(nproc --all) + 2))
  rm -f "$pkgdir"/etc/ld.so.{cache,conf}

  # Shipped in tzdata
  rm -f "$pkgdir"/usr/bin/{tzselect,zdump,zic}

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

  # Provide tracing probes to libstdc++ for exceptions, possibly for other
  # libraries too. Useful for gdb's catch command.
  install -Dm644 "$srcdir/sdt.h" "$pkgdir/usr/include/sys/sdt.h"
  install -Dm644 "$srcdir/sdt-config.h" "$pkgdir/usr/include/sys/sdt-config.h"

  # Provided by libxcrypt; keep the old shared library for backwards compatibility
  rm -f "$pkgdir"/usr/include/crypt.h "$pkgdir"/usr/lib/libcrypt.{a,so}
}

package_lib32-glibc-x86_64() {
  pkgdesc='GNU C Library (32-bit)'
  depends=("glibc=$pkgver")
  provides=("lib32-glibc=${pkgver}")
  conflicts=('lib32-glibc')
  options+=('!emptydirs')

  cd lib32-glibc-build

  make install_root="$pkgdir" install -j$(($(nproc --all) + 2))
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

  # Provided by lib32-libxcrypt; keep the old shared library for backwards compatibility
  rm -f "$pkgdir"/usr/lib32/libcrypt.{a,so}
}
