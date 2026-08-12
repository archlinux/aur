# Maintainer: Based on core/glibc, synced on 2026-08-12
export LDFLAGS+=" -Wl,--hash-style=both"

# toolchain build order: linux-api-headers->glibc->binutils->gcc->glibc->binutils->gcc
# NOTE: valgrind requires rebuilt with each major glibc version

pkgbase=glibc-eac
pkgname=(glibc-eac lib32-glibc-eac)
pkgver=2.44+r24+g16be1518495f
_commit=16be1518495f1fa05481b0182c4e4c24927c62df
pkgrel=1
arch=(x86_64 aarch64)
url='https://www.gnu.org/software/libc'
license=(GPL-2.0-or-later LGPL-2.1-or-later)
makedepends=(
  gd
  git
  python
)
makedepends_x86_64=(
  lib32-gcc-libs
)
options=(
  staticlibs
  !lto
)
source=(
  glibc::git+https://forge.sourceware.org/glibc/glibc-mirror#commit=${_commit}
  locale.gen.txt
  locale-gen
  lib32-glibc.conf
  sdt.h
  sdt-config.h
  tunables.conf
  shstk.conf
  10-glibc-locale-gen.hook
  10-glibc-remove-locale-archive.hook
  11-glibc-ldconfig.hook
  11-glibc-remove-ldconfig-cache.hook
  12-glibc-iconvconfig.hook
  12-glibc-remove-iconvconfig-cache.hook
  12-lib32-glibc-iconvconfig.hook
  12-lib32-glibc-remove-iconvconfig-cache.hook
)
validpgpkeys=(7273542B39962DF7B299931416792B4EA25340F8 # Carlos O'Donell
              BC7C7372637EC10C57D7AA6579C43DFBF1CF2187) # Siddhesh Poyarekar
b2sums=('df2b52cfca4b4a7ad04db0c3c47ef4d65f0053a5a2d137aa06e660615f70e30a53c9375c2975c9d2c81eaff80e968b468e90fcf7f917b0802af16cf60c417003'
        'c859bf2dfd361754c9e3bbd89f10de31f8e81fd95dc67b77d10cb44e23834b096ba3caa65fbc1bd655a8696c6450dfd5a096c476b3abf5c7e125123f97ae1a72'
        'bdc313a77d7158768b06864fdee6419b25f9eda5b942a394713bf61e289a37993d003c779761be4a70d9febeee2377ba2912f459e879801e3d80f4d0550a2592'
        '7c265e6d36a5c0dff127093580827d15519b6c7205c2e1300e82f0fb5b9dd00b6accb40c56581f18179c4fbbc95bd2bf1b900ace867a83accde0969f7b609f8a'
        'a6a5e2f2a627cc0d13d11a82458cfd0aa75ec1c5a3c7647e5d5a3bb1d4c0770887a3909bfda1236803d5bc9801bfd6251e13483e9adf797e4725332cd0d91a0e'
        '214e995e84b342fe7b2a7704ce011b7c7fc74c2971f98eeb3b4e677b99c860addc0a7d91b8dc0f0b8be7537782ee331999e02ba48f4ccc1c331b60f27d715678'
        '315cf92976714d88c60d23a3114e172f26ade1c1461bd2939b6842b03cd76ec63a3c867af5eab56f8c61d3f011158d69194ef1495e28ac47fd60b9f8bd76673c'
        '9725f12fce07b9f5bc413c6d8a3fa7887d4531e499bb0d56588791be74219ae978b60688ad61a7ffca1d4915ba191cd98ddaaa8931f7c72176086de6d4b50948'
        '88b36b26d8ee8ac0d2034106d3ba9595296e6d474d5b892f165701865ff790515f979693897b6c23bb421e7e091b3e7367ec1065a7e9dbaab3b0546e1b037009'
        '9aea685518e63377b745c83ce51c36434f2a3c181440d108ecad915ec6162087302710c1bd95a1097af4ad66468a7fae485881fb030bc2dd886882864b36bdfe'
        'a5884949727babde41941ba276b696f2f473fb4936ade4da7f7f376cddd1ba189efc1b24fa5b8f4861d3988c3e22404ba5806fa8b67437635eaa73df0c0dc13c'
        'c18f52b188ecde915a0d3b69fd87391fdf4a8800a3cd5332456f3009d5c1161944d7ab10a7f2a68fb0b035b69ae1576cb80c1a81ce94ae410066ad19f3d5c196'
        '8537d5d673e73c3656c474ad46d30fce23a317ee6758e304875e3099f1a2250da8a7fb358fb1785dfde704d06c5ab7cdf18e213f7906cdcafa586d3d7b60d085'
        '55ca66ad10e5e8ecb7f205acd009a3ca945c27894047e1ace20866a14d5dd9f2b97e23e6da678877363c2963a6fc2ef83030b4f5de6d7bf84da88bd7434c5596'
        'a6fa4b559b4b701b8fcee294d0a30371de233ba5cb3a08f915b9aa9be42e08e70814a71f74b9e87e8936a847b621fac0b282e8260ea3d728a26ce879953ff17f'
        '8836f747a59cab143679eb751bc67f79b2bd1057f2108a984e63905b8404caeeec5f2e01bfbb42e83e1c7d24e2b10731a9abab4b8b472588e9196c1d519ac3e2')

pkgver() {
  cd glibc
  git describe --abbrev=12 --tags | sed 's/[^-]*-//;s/[^-]*-/&r/;s/-/+/g'
}

prepare() {
  mkdir -p glibc-build lib32-glibc-build

  [[ -d glibc-$pkgver ]] && ln -s glibc-$pkgver glibc
  cd glibc
}

build() {
  local _configure_flags=(
      --prefix=/usr
      --with-headers=/usr/include
      --with-bugurl=https://gitlab.archlinux.org/archlinux/packaging/packages/glibc/-/issues
      --enable-bind-now
      --enable-fortify-source
      --enable-kernel=4.4
      --enable-multi-arch
      --enable-stack-protector=strong
      --enable-systemtap
      --disable-nscd
      --disable-profile
      --disable-werror
  )

  # _FORTIFY_SOURCE=3 causes testsuite build failure and is unnecessary during
  # actual builds (support is built-in via --enable-fortify-source).
  CFLAGS=${CFLAGS/-Wp,-D_FORTIFY_SOURCE=3/}

  # ldconfig segfaults without this on glibc 2.44
  if [[ ${CARCH} = "aarch64" ]]; then
     CFLAGS=${CFLAGS/-fno-plt/}
  fi

  (
    cd glibc-build

    echo "slibdir=/usr/lib" >> configparms
    echo "rtlddir=/usr/lib" >> configparms
    echo "sbindir=/usr/bin" >> configparms
    echo "rootsbindir=/usr/bin" >> configparms

    "${srcdir}"/glibc/configure \
        --libdir=/usr/lib \
        --libexecdir=/usr/lib \
        --enable-cet \
        --enable-sframe \
        "${_configure_flags[@]}"

    make -O

    # build info pages manually for reproducibility
    make info
  )

 if [[ ${CARCH} == x86_64* ]]; then (
    cd lib32-glibc-build
    export CC="gcc -m32 -mstackrealign"
    export CXX="g++ -m32 -mstackrealign"

    # remove frame pointer flags due to crashes of nvidia driver on steam starts
    # See https://gitlab.archlinux.org/archlinux/packaging/packages/glibc/-/issues/10
    CFLAGS=${CFLAGS/-fno-omit-frame-pointer -mno-omit-leaf-frame-pointer/}

    echo "slibdir=/usr/lib32" >> configparms
    echo "rtlddir=/usr/lib32" >> configparms
    echo "sbindir=/usr/bin" >> configparms
    echo "rootsbindir=/usr/bin" >> configparms

    "${srcdir}"/glibc/configure \
        --host=i686-pc-linux-gnu \
        --libdir=/usr/lib32 \
        --libexecdir=/usr/lib32 \
        "${_configure_flags[@]}"

    make -O
  )
 fi
  # pregenerate locales here instead of in package
  # functions because localedef does not like fakeroot
  make -C "${srcdir}"/glibc/localedata objdir="${srcdir}"/glibc-build \
    DESTDIR="${srcdir}"/locales install-locale-files
}

# Credits for _skip_test() and check() @allanmcrae
# https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/glibc/PKGBUILD
_skip_test() {
  test=${1}
  file=${2}
  sed -i "/\b${test} /d" "${srcdir}/glibc/${file}"
}

_check() (
  cd glibc-build

  # adjust/remove buildflags that cause false-positive testsuite failures
  sed -i 's/-Werror=format-security/-Wformat-security/' config.make   # failure to build testsuite
  sed -i '/CFLAGS/s/-fno-plt//' config.make                           # 27 failures
  sed -i '/CFLAGS/s/-fexceptions//' config.make                       # 1 failure

  # The following tests fail due to restrictions in the Arch build system
  # The correct fix is to add the following to the systemd-nspawn call:
  # --system-call-filter="@clock @memlock @pkey"
  _skip_test tst-ldconfig-cache             elf/Makefile
  _skip_test tst-pthread-gdb-attach         nptl/Makefile
  _skip_test tst-pthread-gdb-attach-static  nptl/Makefile
  _skip_test test-errno-linux               sysdeps/unix/sysv/linux/Makefile
  _skip_test tst-mlock2                     sysdeps/unix/sysv/linux/Makefile
  _skip_test tst-ntp_gettime                sysdeps/unix/sysv/linux/Makefile
  _skip_test tst-ntp_gettimex               sysdeps/unix/sysv/linux/Makefile
  _skip_test tst-pkey                       sysdeps/unix/sysv/linux/Makefile
  _skip_test tst-mseal-pkey                 sysdeps/unix/sysv/linux/Makefile
  _skip_test tst-process_mrelease           sysdeps/unix/sysv/linux/Makefile
  _skip_test tst-shstk-legacy-1g            sysdeps/x86_64/Makefile
  _skip_test tst-adjtime                    time/Makefile

  make -O check
)

package_glibc-eac() {
  provides=("glibc=$pkgver")
  conflicts=(glibc)
  pkgdesc='GNU C Library with DT_HASH enabled'
  depends=('linux-api-headers>=4.10' tzdata filesystem)
  optdepends=(
    'gd: for memusagestat'
    'perl: for mtrace'
  )
  backup=(
    etc/gai.conf
    etc/locale.gen
    etc/tunables.conf
    etc/tunables.conf.d/shstk.conf
  )

  make -C glibc-build DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}"/etc/ld.so.cache

  # Shipped in tzdata
  rm -f "${pkgdir}"/usr/bin/{tzselect,zdump,zic}

  cd glibc

  install -dm755 "${pkgdir}"/usr/lib/locale

  install -m644 posix/gai.conf "${pkgdir}"/etc/gai.conf

  install -m755 "${srcdir}"/locale-gen "${pkgdir}"/usr/bin

  # Create /etc/locale.gen
  install -m644 "${srcdir}"/locale.gen.txt "${pkgdir}"/etc/locale.gen
  sed -e '1,3d' -e 's|/| |g' -e 's|\\| |g' -e 's|^|#|g' \
    localedata/SUPPORTED >> "${pkgdir}"/etc/locale.gen

  # Add SUPPORTED file to pkg
  sed -e '1,3d' -e 's|/| |g' -e 's| \\||g' \
    localedata/SUPPORTED > "${pkgdir}"/usr/share/i18n/SUPPORTED

  # install C.UTF-8 so that it is always available
  # should be built into glibc eventually
  # https://sourceware.org/glibc/wiki/Proposals/C.UTF-8
  # https://bugs.archlinux.org/task/74864
  install -dm755 "${pkgdir}"/usr/lib/locale
  cp -r "${srcdir}"/locales/usr/lib/locale/C.utf8 -t "${pkgdir}"/usr/lib/locale
  sed -i '/#C\.UTF-8 /d' "${pkgdir}"/etc/locale.gen

  # Provide tracing probes to libstdc++ for exceptions, possibly for other
  # libraries too. Useful for gdb's catch command.
  install -Dm644 "${srcdir}"/sdt.h "${pkgdir}"/usr/include/sys/sdt.h
  install -Dm644 "${srcdir}"/sdt-config.h "${pkgdir}"/usr/include/sys/sdt-config.h

  # Install relevant pre- and post-transaction hooks.
  install -vDm 644 ../10-glibc-locale-gen.hook -t "${pkgdir}"/usr/share/libalpm/hooks/
  install -vDm 644 ../10-glibc-remove-locale-archive.hook -t "${pkgdir}"/usr/share/libalpm/hooks/
  install -vDm 644 ../11-glibc-ldconfig.hook -t "${pkgdir}"/usr/share/libalpm/hooks/
  install -vDm 644 ../11-glibc-remove-ldconfig-cache.hook -t "${pkgdir}"/usr/share/libalpm/hooks/
  install -vDm 644 ../12-glibc-iconvconfig.hook -t "${pkgdir}"/usr/share/libalpm/hooks/
  install -vDm 644 ../12-glibc-remove-iconvconfig-cache.hook -t "${pkgdir}"/usr/share/libalpm/hooks/

  # Install tunables.conf
  install -vDm 644 ../tunables.conf -t "${pkgdir}"/etc/
  install -vDm 644 ../shstk.conf -t "${pkgdir}"/etc/tunables.conf.d/
}

package_lib32-glibc-eac() {
  provides=("lib32-glibc=$pkgver")
  conflicts=(lib32-glibc)
  pkgdesc='GNU C Library with DT_HASH enabled (32-bit)'
  depends=("glibc=$pkgver")
  options+=('!emptydirs')
  arch=(x86_64)

  cd lib32-glibc-build

  make DESTDIR="${pkgdir}" install
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

  # Install relevant pre- and post-transaction hooks.
  install -vDm 644 ../12-lib32-glibc-iconvconfig.hook -t "${pkgdir}"/usr/share/libalpm/hooks/
  install -vDm 644 ../12-lib32-glibc-remove-iconvconfig-cache.hook -t "${pkgdir}"/usr/share/libalpm/hooks/
}

_package_glibc-locales() {
  provides=("glibc-locales=$pkgver")
  conflicts=(glibc-locales)
  pkgdesc='Pregenerated locales for GNU C Library with DT_HASH enabled'
  depends=("glibc=$pkgver")

  cp -r locales/* -t "${pkgdir}"
  rm -r "${pkgdir}"/usr/lib/locale/C.utf8

  # deduplicate locale data
  hardlink -c "${pkgdir}"/usr/lib/locale
}
