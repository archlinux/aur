# Maintainer: Bart De Vries <bart at mogwai dot be>

# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->glibc->binutils->gcc
# NOTE: valgrind requires rebuilt with each major glibc version

# ALARM: Kevin Mihelich <kevin@archlinuxarm.org>
#  - Specify our build host type
#  - Disabled distcc
#  - Strip out Arch x86 multilib
#  - Don't --enable-cet, x86 only

pkgname=glibc-widevine
provides=("glibc=2.35")
conflicts=("glibc")
pkgver=2.35
_commit=28ea43f8d64f0dd1f2de75525157730e1532e600
pkgrel=5.2
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.gnu.org/software/libc'
license=(GPL LGPL)
makedepends=(git gd python)
options=(debug staticlibs !lto !distcc)
source=(git+https://sourceware.org/git/glibc.git#commit=${_commit}
        locale.gen.txt
        locale-gen
        sdt.h sdt-config.h
        disable-clone3.diff
        0001-sys-libs-glibc-add-support-for-SHT_RELR-sections.patch
        0002-tls-libwidevinecdm.so-since-4.10.2252.0-has-TLS-with.patch
        0003-glibc-2.35-make-4.4-MAKEFLAGS.patch
       )
validpgpkeys=(7273542B39962DF7B299931416792B4EA25340F8 # Carlos O'Donell
              BC7C7372637EC10C57D7AA6579C43DFBF1CF2187) # Siddhesh Poyarekar

b2sums=('SKIP'
        '46d533d25c7a2ce4ae75d452eee7ebb8e3ce4d191af9be3daa43718b78cb81d33cfd8046a117a15d87de9f5e940448c66005b0490515bf731c9e4691c53908d6'
        '1f6d927b4972220b1c00abee5329c5d6bc01ed5bee57b20db0c7d7433292f7d666b02baf9968267f8e378b1f3bb273e8eef0ccbf22d21400ac36949d7615a474'
        'a6a5e2f2a627cc0d13d11a82458cfd0aa75ec1c5a3c7647e5d5a3bb1d4c0770887a3909bfda1236803d5bc9801bfd6251e13483e9adf797e4725332cd0d91a0e'
        '214e995e84b342fe7b2a7704ce011b7c7fc74c2971f98eeb3b4e677b99c860addc0a7d91b8dc0f0b8be7537782ee331999e02ba48f4ccc1c331b60f27d715678'
        'edef5f724f68ea95c6b0127bd13a10245f548afc381b2d0a6d1d06ee9f87b7dd89c6becd35d5ae722bf838594eb870a747f67f07f46e7d63f8c8d1a43cce4a52'
        '7da85639771d4972e913b0458906bbccf1b30143940669e1b58b0ceab2e8dffc3a6c4b641a842e63b49a9b7ff01dddc3f1296d35ab505f67b6e625e208d01a8c'
        'b10f7479a283fdb1916f72e9d8cc9304e068d87f3805a9d2c51e748c79c9547735405e1e86a438ffe87d5ba0adece555740c221fe3bf84990c21e2737d3bb197'
        '7b5d512df13ba1747a5a099bc7b9ff7d44ba94176c18d65fe37ab0145214f43949597bdffb3ee8c46954f7cedd0d1e708a237ccdb491a163493f5b43eac7bdda')

prepare() {
  mkdir -p glibc-build

  [[ -d glibc-$pkgver ]] && ln -s glibc-$pkgver glibc
  cd glibc

  # Disable clone3 syscall for now
  # Can be removed when eletron{9,11,12} and discord are removed or patched:
  # https://github.com/electron/electron/commit/993ecb5bdd5c57024c8718ca6203a8f924d6d574
  # Patch src: https://patchwork.ozlabs.org/project/glibc/patch/87eebkf8ph.fsf@oldenburg.str.redhat.com/
  patch -Np1 -i "${srcdir}"/disable-clone3.diff

  # sys-libs: Add support for SHT_RELR sections
  patch -p1 -i "$srcdir"/0001-sys-libs-glibc-add-support-for-SHT_RELR-sections.patch

  # dl-tls: libwidevinecdm 64Byte alignment
  patch -p1 -i "$srcdir"/0002-tls-libwidevinecdm.so-since-4.10.2252.0-has-TLS-with.patch

  # patch for make-4.4 in combination with older glibc
  patch -p1 -i "$srcdir"/0003-glibc-2.35-make-4.4-MAKEFLAGS.patch
}

build() {
  local _configure_flags=(
      --prefix=/usr
      --with-headers=/usr/include
      --with-bugurl=https://github.com/archlinuxarm/PKGBUILDs/issues
      --enable-bind-now
      --disable-multi-arch
      --enable-stack-protector=strong
      --enable-systemtap
      --disable-profile
      --disable-crypt
      --disable-werror
  )

  cd "$srcdir/glibc-build"

  # ALARM: Specify build host types
  [[ $CARCH == "armv7h" ]] && _configure_flags+=(--host=armv7l-unknown-linux-gnueabihf --build=armv7l-unknown-linux-gnueabihf)
  [[ $CARCH == "aarch64" ]] && _configure_flags+=(--host=aarch64-unknown-linux-gnu --build=aarch64-unknown-linux-gnu --enable-memory-tagging)

  echo "slibdir=/usr/lib" >> configparms
  echo "rtlddir=/usr/lib" >> configparms
  echo "sbindir=/usr/bin" >> configparms
  echo "rootsbindir=/usr/bin" >> configparms

  # Credits @allanmcrae
  # https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/glibc/PKGBUILD
  # remove fortify for building libraries
  CFLAGS=${CFLAGS/-Wp,-D_FORTIFY_SOURCE=2/}

  "$srcdir/glibc/configure" \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      "${_configure_flags[@]}"

  # build libraries with fortify disabled
  echo "build-programs=no" >> configparms
  make -O

  # re-enable fortify for programs
  sed -i "/build-programs=/s#no#yes#" configparms
  echo "CFLAGS += -Wp,-D_FORTIFY_SOURCE=2" >> configparms
  make -O

  # build info pages manually for reproducibility
  make info
}

# Credits for skip_test() and check() @allanmcrae
# https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/glibc/PKGBUILD
skip_test() {
  test=$1
  file=$2
  sed -i "s/\b$test\b//" $srcdir/glibc/$file
}

check() {
  cd glibc-build

  # adjust/remove buildflags that cause false-positive testsuite failures
  sed -i '/FORTIFY/d' configparms                                     # failure to build testsuite
  sed -i 's/-Werror=format-security/-Wformat-security/' config.make   # failure to build testsuite
  sed -i '/CFLAGS/s/-fno-plt//' config.make                           # 16 failures
  sed -i '/CFLAGS/s/-fexceptions//' config.make                       # 1 failure
  LDFLAGS=${LDFLAGS/,-z,now/}                                         # 10 failures

  # The following tests fail due to restrictions in the Arch build system
  # The correct fix is to add the following to the systemd-nspawn call:
  # --system-call-filter="@clock @memlock @pkey"
  skip_test test-errno-linux sysdeps/unix/sysv/linux/Makefile
  skip_test tst-ntp_gettime  sysdeps/unix/sysv/linux/Makefile
  skip_test tst-ntp_gettimex sysdeps/unix/sysv/linux/Makefile
  skip_test tst-mlock2       sysdeps/unix/sysv/linux/Makefile
  skip_test tst-pkey         sysdeps/unix/sysv/linux/Makefile
  skip_test tst-adjtime      time/Makefile
  skip_test tst-clock2       time/Makefile

  make -O check || true      # do not crash on failed tests
}

package() {
  pkgdesc='GNU C Library'
  depends=('linux-api-headers>=4.10' tzdata filesystem)
  optdepends=('gd: for memusagestat'
              'perl: for mtrace')
  install=glibc.install
  backup=(etc/gai.conf
          etc/locale.gen
          etc/nscd.conf)

  make -C glibc-build install_root="$pkgdir" install
  rm -f "$pkgdir"/etc/ld.so.cache

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

  # Provide tracing probes to libstdc++ for exceptions, possibly for other
  # libraries too. Useful for gdb's catch command.
  install -Dm644 "$srcdir/sdt.h" "$pkgdir/usr/include/sys/sdt.h"
  install -Dm644 "$srcdir/sdt-config.h" "$pkgdir/usr/include/sys/sdt-config.h"
}
