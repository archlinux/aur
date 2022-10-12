# Maintainer: Niko Cantero <vextium at gmail dot com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Earnestly <zibeon@googlemail.com>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Dakkshesh <dakkshesh5 at gmail dot com>
# Contributor: Cyber Knight <cyberknight755 at gmail dot com>

# toolchain build order: linux-api-headers->glibc(-git)->binutils->gcc->glibc(-git)->binutils->gcc
# NOTE: valgrind requires rebuilt with each major glibc version

_pkgname='glibc'
_kernelver='5.18.15'
pkgbase="${_pkgname}"-git
pkgname=("${_pkgname}"-git lib32-"${_pkgname}"-git)
pkgver=2.36.r206.gba0ca36132
pkgrel=1
arch=('x86_64')
url='https://www.gnu.org/software/libc/'
license=('GPL' 'LGPL')
groups=('base-git')
makedepends=('git' 'gd' 'lib32-gcc-libs' 'python')
options=('staticlibs')
source=('git+https://sourceware.org/git/glibc.git'
	'locale.gen.txt'        
	'locale-gen'
	'lib32-glibc.conf'
	'sdt.h'
	'sdt-config.h')
b2sums=('SKIP'
	'c859bf2dfd361754c9e3bbd89f10de31f8e81fd95dc67b77d10cb44e23834b096ba3caa65fbc1bd655a8696c6450dfd5a096c476b3abf5c7e125123f97ae1a72'
	'04fbb3b0b28705f41ccc6c15ed5532faf0105370f22133a2b49867e790df0491f5a1255220ff6ebab91a462f088d0cf299491b3eb8ea53534cb8638a213e46e3'
	'7c265e6d36a5c0dff127093580827d15519b6c7205c2e1300e82f0fb5b9dd00b6accb40c56581f18179c4fbbc95bd2bf1b900ace867a83accde0969f7b609f8a'
	'a6a5e2f2a627cc0d13d11a82458cfd0aa75ec1c5a3c7647e5d5a3bb1d4c0770887a3909bfda1236803d5bc9801bfd6251e13483e9adf797e4725332cd0d91a0e'
	'214e995e84b342fe7b2a7704ce011b7c7fc74c2971f98eeb3b4e677b99c860addc0a7d91b8dc0f0b8be7537782ee331999e02ba48f4ccc1c331b60f27d715678')

prepare() {
  mkdir -p glibc-build lib32-glibc-build

  [[ -d glibc-$pkgver ]] && ln -s glibc-$pkgver glibc
  cd glibc
}

pkgver() {
    cd glibc
    # Removes .9000 tag from glibc pkgver.
    git describe --exclude '*.*.9000' | sed 's/^glibc-//; s/-/.r/; s/-/./'
}

build() {
   local _configure_flags=(
        --prefix=/usr
        --with-headers=/usr/include
        --with-bugurl=https://bugs.archlinux.org/
	--enable-memory-tagging        
	--enable-bind-now
        --enable-cet
        --enable-kernel="${_kernelver}"
        --enable-multi-arch
        --enable-stack-protector=strong
        --enable-systemtap
        --disable-crypt
        --disable-profile
        --disable-werror
  )

  unset_flags() {
    unset CFLAGS
    unset CXXFLAGS
  }

  configparms_fortify_source() {
    echo "CFLAGS += -Wp,-D_FORTIFY_SOURCE=2" >> configparms
  }

  configparms_enable_programs() {
    sed -i "/build-programs=/s#no#yes#" configparms
  }

  configparms_disable_programs() {
    echo "build-programs=no" >> configparms
  }

  make_build_64 () {
    make -O CFLAGS="$MAKE_FLAGS_64_FULL" CXXFLAGS="$MAKE_FLAGS_64_FULL" -j$(nproc --all)
  }

  make_build_32 () {
    make -O CFLAGS="$MAKE_FLAGS_32_FULL" CXXFLAGS="$MAKE_FLAGS_32_FULL" -j$(nproc --all)
  }

  MAKE_FLAGS_64="-O2 -pipe"
  MAKE_FLAGS_32="-mno-tls-direct-seg-refs -O2 -pipe"

  cd "${srcdir}"/glibc-build

  echo "slibdir=/usr/lib" >> configparms
  echo "rtlddir=/usr/lib" >> configparms
  echo "sbindir=/usr/bin" >> configparms
  echo "rootsbindir=/usr/bin" >> configparms

  # Credits @dakkshesh07 & @cyberknight777
  # https://github.com/Neutron-Toolchains/glibc-pkgbuild/blob/main/PKGBUILD
  # remove fortify for building libraries & configure glibc (64-bit) to point at lib directories
  unset_flags
  "${srcdir}"/glibc/configure \
      --host=x86_64-pc-linux-gnu \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      "${_configure_flags[@]}"

  # build libraries with fortify disabled
  configparms_disable_programs
  MAKE_FLAGS_64_FULL="$MAKE_FLAGS_64 -U_FORTIFY_SOURCE -ffunction-sections -fdata-sections"
  make_build_64

  # re-enable fortify for programs
  configparms_enable_programs
  unset_flags
  configparms_fortify_source
  MAKE_FLAGS_64_FULL="$MAKE_FLAGS_64 -Wp,-D_FORTIFY_SOURCE=2 -ffunction-sections -fdata-sections"
  make_build_64

  # build info pages manually for reproducibility
  make info -j$(nproc --all)

  cd "${srcdir}"/lib32-glibc-build
  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"

  echo "slibdir=/usr/lib32" >> configparms
  echo "rtlddir=/usr/lib32" >> configparms
  echo "sbindir=/usr/bin" >> configparms
  echo "rootsbindir=/usr/bin" >> configparms
 
  # remove fortify for building libraries & configure glibc (32-bit) to point at lib directories
  unset_flags
  "${srcdir}"/glibc/configure \
      --host=i686-pc-linux-gnu \
      --libdir=/usr/lib32 \
      --libexecdir=/usr/lib32 \
      "${_configure_flags[@]}"

  # build libraries with fortify disabled
  configparms_disable_programs
  MAKE_FLAGS_32_FULL="$MAKE_FLAGS_32 -U_FORTIFY_SOURCE -ffunction-sections -fdata-sections"
  make_build_32

  # re-enable fortify for programs
  configparms_enable_programs
  unset_flags
  configparms_fortify_source
  MAKE_FLAGS_32_FULL="$MAKE_FLAGS_32 -Wp,-D_FORTIFY_SOURCE=2 -ffunction-sections -fdata-sections"
  make_build_32

  # pregenerate C.UTF-8 locale until it is built into glibc
  # (https://sourceware.org/glibc/wiki/Proposals/C.UTF-8, FS#74864)-
  elf/ld.so --library-path "$PWD" locale/localedef -c -f ../glibc/localedata/charmaps/UTF-8 -i ../glibc/localedata/locales/C ../C.UTF-8/
}

# Credits for skip_test() and check() @allanmcrae
# https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/glibc/PKGBUILD
skip_test() {
  test=${1}
  file=${2}
  sed -i "s/\b${test}\b//" "${srcdir}"/glibc/${file}
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
  skip_test test-errno-linux        sysdeps/unix/sysv/linux/Makefile
  skip_test tst-mlock2              sysdeps/unix/sysv/linux/Makefile
  skip_test tst-ntp_gettime         sysdeps/unix/sysv/linux/Makefile
  skip_test tst-ntp_gettimex        sysdeps/unix/sysv/linux/Makefile
  skip_test tst-pkey                sysdeps/unix/sysv/linux/Makefile
  skip_test tst-process_mrelease    sysdeps/unix/sysv/linux/Makefile
  skip_test tst-adjtime             time/Makefile
  skip_test tst-clock2              time/Makefile

  make -O check
}

package_glibc-git() {
  pkgdesc='GNU C Library - git version'
  depends=("linux-api-headers>=${_kernelver}" 'tzdata' 'filesystem')
  optdepends=('gd: for memusagestat'
              'perl: for mtrace')
  # XXX Arch Linux's valgrind package requires an exact version
  provides=("${_pkgname}=${pkgver%%.r*}")
  conflicts=("${_pkgname}")
  install=glibc-git.install
  backup=('etc/gai.conf'
          'etc/locale.gen'
          'etc/nscd.conf')
  
  # We generate these in the post-install with ldconfig -r
  make -C glibc-build install_root="${pkgdir}" install
  rm -f "${pkgdir}"/etc/ld.so.cache

  # Shipped in tzdata
  rm -f "${pkgdir}"/usr/bin/{tzselect,zdump,zic}

  cd glibc

  install -dm755 "${pkgdir}"/usr/lib/{locale,systemd/system,tmpfiles.d}
  install -m644 nscd/nscd.conf "${pkgdir}"/etc/nscd.conf
  install -m644 nscd/nscd.service "${pkgdir}"/usr/lib/systemd/system
  install -m644 nscd/nscd.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/nscd.conf
  install -dm755 "${pkgdir}"/var/db/nscd
  
  install -m644 posix/gai.conf "${pkgdir}"/etc/gai.conf

  install -m755 "${srcdir}"/locale-gen "${pkgdir}"/usr/bin  

  # Create /etc/locale.gen
  install -m644 "${srcdir}"/locale.gen.txt "${pkgdir}"/etc/locale.gen
  sed -e '1,3d' -e 's|/| |g' -e 's|\\| |g' -e 's|^|#|g' \
    "${srcdir}"/glibc/localedata/SUPPORTED >> "${pkgdir}"/etc/locale.gen
    
  # Add SUPPORTED file to pkg
  sed -e '1,3d' -e 's|/| |g' -e 's| \\||g' \
    "${srcdir}"/glibc/localedata/SUPPORTED > "${pkgdir}"/usr/share/i18n/SUPPORTED

  # install C.UTF-8 so that it is always available
  install -dm755 "${pkgdir}"/usr/lib/locale
  cp -r "${srcdir}"/C.UTF-8 -t "${pkgdir}"/usr/lib/locale
  sed -i '/#C\.UTF-8 /d' "${pkgdir}"/etc/locale.gen
  
  # handle selectively stripping unless debug packages are requested
  if check_option 'debug' n; then
  options+=('!strip')
  # I use 2> /dev/null for all of these due to many false-positives as it
  # attempts to strip scripts or other unstrippable files.
  find "$pkgdir"/usr/bin -type f -executable -exec strip $STRIP_BINARIES {} + 2> /dev/null || true
  find "$pkgdir"/usr/lib -name '*.a' -type f -exec strip $STRIP_STATIC {} + 2> /dev/null || true

  # Do not strip these for gdb and valgrind functionality.
  find "$pkgdir"/usr/lib \
      -not -name 'ld-*.so' \
      -not -name 'libc-*.so' \
      -not -name 'libpthread-*.so' \
      -not -name 'libthread_db-*.so' \
      -name '*-*.so' -type f -exec strip $STRIP_SHARED {} + 2> /dev/null || true
  fi
  
  # Provide tracing probes to libstdc++ for exceptions, possibly for other
  # libraries too. Useful for gdb's catch command.
  install -Dm644 "${srcdir}"/sdt.h "${pkgdir}"/usr/include/sys/sdt.h
  install -Dm644 "${srcdir}"/sdt-config.h "${pkgdir}"/usr/include/sys/sdt-config.h
}

package_lib32-glibc-git() {
  pkgdesc='GNU C Library (32-bit) - git version'
  depends=("${_pkgname}=${pkgver%%.r*}")
  optdepends=('perl: for mtrace')
  # XXX Arch Linux's valgrind package requires an exact version
  provides=("lib32-${_pkgname}=${pkgver%%.r*}")
  conflicts=("lib32-${_pkgname}")
  options+=('!emptydirs')

  cd lib32-glibc-build

  make install_root="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,sbin,usr/{bin,sbin,share},var}

  # We need to keep 32 bit specific header files
  find "${pkgdir}"/usr/include -type f -not -name '*-32.h' -delete

  # Dynamic linker
  install -d "${pkgdir}"/usr/lib
  ln -s ../lib32/ld-linux.so.2 "${pkgdir}"/usr/lib/

  # Add lib32 paths to the default library search path
  install -Dm644 "${srcdir}"/lib32-glibc.conf "${pkgdir}"/etc/ld.so.conf.d/lib32-glibc.conf

  # Symlink /usr/lib32/locale to /usr/lib/locale
  ln -s ../lib/locale "${pkgdir}"/usr/lib32/locale

  # handle selectively stripping unless debug packages are requested
  if check_option 'debug' n; then
  options+=('!strip')
  # I use 2> /dev/null for all of these due to many false-positives as it
  # attempts to strip scripts or other unstrippable files.
  find "$pkgdir"/usr/bin -type f -executable -exec strip $STRIP_BINARIES {} + 2> /dev/null || true
  find "$pkgdir"/usr/lib32 -name '*.a' -type f -exec strip $STRIP_STATIC {} + 2> /dev/null || true

  # Do not strip these for gdb and valgrind functionality.
  find "$pkgdir"/usr/lib32 \
      -not -name 'ld-*.so' \
      -not -name 'libc-*.so' \
      -not -name 'libpthread-*.so' \
      -not -name 'libthread_db-*.so' \
      -name '*-*.so' -type f -exec strip $STRIP_SHARED {} + 2> /dev/null || true
  fi
}
