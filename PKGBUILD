# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Pellegrino Prevete <pellegrinoprevete at gmail dot com>
# Contributor: elliotwutingfeng
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Daniel Kozak <kozzi11@gmail.com>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->glibc->binutils->gcc
# NOTE: libtool requires rebuilt with each new gcc version

set -u
pkgbase='gcc13'
pkgname=("${pkgbase}" "${pkgbase}-libs" "${pkgbase}-fortran")
pkgver=13.4.1+r80+gd6ebfe4
_majorver="${pkgver%%.*}"
_commit='d6ebfe490b856673c31ab2be5b311f3df370eca0'
pkgrel=1
pkgdesc="The GNU Compiler Collection (${_majorver}.x.x)"
arch=('x86_64')
url='https://gcc.gnu.org'
license=('GPL-3.0-with-GCC-exception' 'GFDL-1.3-or-later')
makedepends=('binutils' 'doxygen' 'gcc-ada' 'gcc-d' 'git' 'libisl' 'libmpc' 'python' 'zstd')
checkdepends=('dejagnu' 'expect' 'inetutils' 'python-pytest' 'tcl')
options=('!emptydirs' '!strip' '!buildflags')
options+=('!lto')
source=(
  "git+https://sourceware.org/git/gcc.git#commit=${_commit}"
  #"https://sourceware.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz"
  'c89'
  'c99'
  'fix-asan-allocator-aslr.patch'
  '0000-kernel-7.1-remove-linux-scc.patch'
)
validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # foutrelis@archlinux.org
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62) # Jakub Jelinek <jakub@redhat.com>
sha256sums=('7b47ce30b7eb91793bd393d8ae639d526903860bda317bfa9e91442623d2aa2a'
            'de48736f6e4153f03d0a5d38ceb6c6fdb7f054e8f47ddd6af0a3dbf14f27b931'
            '2513c6d9984dd0a2058557bf00f06d8d5181734e41dcfe07be7ed86f2959622a'
            '7a3ae47af2e888e7fed329e8ecaab47a26143ccb0edede4c397791d6d22b8043'
            '0d89650effbd0572ece8c23761e7f736a172d57609633b60e861e8b79679e429')

if [ -n "${_snapshot:-}" ]; then
  _basedir="gcc-${_snapshot}"
elif [ -n "${_commit:-}" ]; then
  _basedir='gcc'
else
  _basedir="gcc-${pkgver}"
fi

_fn_setlibdir() {
  _libdir="usr/lib/gcc/${CHOST}/${pkgver%%+*}"
}

pkgver() {
  local -
  set -u
  cd "${_basedir}"
  echo "$(cat gcc/BASE-VER)+$(git describe --long --tags --abbrev=7 | sed 's/[^-]*-[^-]*-//;s/[^-]*-/r&/;s/-/+/g;s/_/./')"
}

prepare() {
  local -
  set -u
  cd "${_basedir}"

  # Do not run fixincludes
  sed -e 's@\./fixinc\.sh@-c true@' -i 'gcc/Makefile.in'

  # Arch Linux installs x86_64 libraries /lib
  sed -e '/m64=/s/lib64/lib/' -i 'gcc/config/i386/t-linux64'

  #ASan: move allocator base to avoid conflict with high-entropy ASLR for x86-64 Linux'
  #patch -Np3 < "${srcdir}/fix-asan-allocator-aslr.patch" -d 'libsanitizer/'

  # Apply patches
  local _pt
  for _pt in "${source[@]%%::*}"; do
    _pt="${_pt##*/}"
    case "${_pt}" in
    *.patch)
      set +u; msg2 "*** Applying patch ${_pt}"; set -u
      patch --no-backup-if-mismatch -Np1 -i "${srcdir}/${_pt}"
      ;;
    esac
  done

  rm -rf 'gcc-build'
  mkdir 'gcc-build'
}

build() {
  local -
  set -u
  cd "${_basedir}/gcc-build"

  if [ ! -s 'Makefile' ]; then
    # The following options are one per line, mostly sorted so they are easy to diff compare to other gcc packages.
    local _conf=(
      --disable-libssp
      --disable-libstdcxx-pch
      --disable-multilib
      --disable-werror
      --enable-bootstrap
      --enable-__cxa_atexit
      --enable-cet='auto'
      --enable-checking='release'
      --enable-clocale='gnu'
      --enable-default-pie
      --enable-default-ssp
      --enable-gnu-indirect-function
      --enable-gnu-unique-object
      --enable-languages='c,c++,fortran'
      --enable-libstdcxx-backtrace
      --enable-linker-build-id
      --enable-link-serialization='1'
      --enable-lto
      --enable-plugin
      --enable-shared
      --enable-threads='posix'
      --enable-version-specific-runtime-libs
      --infodir='/usr/share/info'
      --libdir='/usr/lib'
      --libexecdir='/usr/lib'
      --mandir='/usr/share/man'
      --program-suffix="-${_majorver}"
      --with-bugurl="https://aur.archlinux.org/packages/${pkgname}/"
      --with-build-config='bootstrap-lto'
      --with-linker-hash-style='gnu'
      --with-system-zlib
      --prefix='/usr'
    )

if ! :; then
  # Credits @allanmcrae
  # https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/gcc/PKGBUILD
  # TODO: properly deal with the build issues resulting from this
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}
fi

    ../configure "${_conf[@]}"
  fi

if ! :; then
  # see https://bugs.archlinux.org/task/71777 for rationale re *FLAGS handling
  make -O STAGE1_CFLAGS="-O2" \
          BOOT_CFLAGS="$CFLAGS" \
          BOOT_LDFLAGS="$LDFLAGS" \
          LDFLAGS_FOR_TARGET="$LDFLAGS" \
          bootstrap
fi

  # Work-around `msgfmt: /build/gcc11/src/gcc-build/x86_64-pc-linux-gnu/libstdc++-v3/src/.libs/libstdc++.so.6: version `GLIBCXX_3.4.30' not found (required by /usr/lib/libicuuc.so.72)`
  # The trick is borrowed from https://aur.archlinux.org/packages/gcc49
  #LD_PRELOAD='/usr/lib/libstdc++.so' \ 
  nice -n1 make -s

  set +u; msg 'Compile complete'; set -u

  # make documentation
  make -s -j1 -C "${CHOST}/libstdc++-v3/doc" 'doc-man-doxygen'
}

check_disabled() {
  local -
  set -u
  cd "${_basedir}/gcc-build"

  # do not abort on error as some are "expected"
  make -O -k check || true
  ../contrib/test_summary
}

package_gcc13-libs() {
  local -
  set -u
  pkgdesc="Runtime libraries shipped by GCC (${_majorver}.x.x)"
  depends=('glibc>=2.27')
  options=('!emptydirs' '!strip')

  cd "${_basedir}/gcc-build"
  make -j1 -s -C "${CHOST}/libgcc" DESTDIR="${pkgdir}" 'install-shared'
  local _libdir; _fn_setlibdir
  mv "${pkgdir}/${_libdir}/../lib"/* "${pkgdir}/${_libdir}"
  rmdir "${pkgdir}/${_libdir}/../lib"
  rm -f "${pkgdir}/${_libdir}/libgcc_eh.a"

  local _lib _libs=(
    libasan
    libatomic
    libgfortran
    libgomp
    libitm
    liblsan
    libquadmath
    libstdc++
    libtsan
    libubsan
  )
  for _lib in "${_libs[@]}"; do
    ln -s "/usr/lib/${_lib}.so" "${pkgdir}/${_libdir}/${_lib}.so"
  done

  make -j1 -s -C "${CHOST}/libstdc++-v3/po" DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/${_libdir}/include/d/"
  rm -f "${pkgdir}/usr/lib/libgphobos.spec"

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/${pkgbase}-libs/RUNTIME.LIBRARY.EXCEPTION"

  # remove conflicting files
  rm -rf "${pkgdir}/usr/share/locale"
}

package_gcc13() {
  local -
  set -u
  pkgdesc="The GNU Compiler Collection - C and C++ frontends (${_majorver}.x.x)"
  depends=("${pkgbase}-libs=${pkgver}-${pkgrel}" 'binutils>=2.28' 'libmpc' 'zstd')
  depends+=('libisl.so')
  options=('!emptydirs' 'staticlibs')

  cd "${_basedir}/gcc-build"

  make -j1 -s -C 'gcc' DESTDIR="${pkgdir}" 'install-driver' 'install-cpp' 'install-gcc-ar' \
    'c++.install-common' 'install-headers' 'install-plugin' 'install-lto-wrapper'

  local _libdir; _fn_setlibdir
  install -m755 -t "${pkgdir}/${_libdir}/" gcc/{cc1,cc1plus,collect2,lto1,gcov{,-tool}}

  make -j1 -s -C "${CHOST}/libgcc" DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/${_libdir}"/../lib/libgcc_s.so*
  rmdir "${pkgdir}/${_libdir}"/../lib

  make -j1 -s -C "${CHOST}/libstdc++-v3/src" DESTDIR="${pkgdir}" install
  make -j1 -s -C "${CHOST}/libstdc++-v3/include" DESTDIR="${pkgdir}" install
  make -j1 -s -C "${CHOST}/libstdc++-v3/libsupc++" DESTDIR="${pkgdir}" install
  make -j1 -s -C "${CHOST}/libstdc++-v3/python" DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/${_libdir}/"libstdc++.so*

  make -j1 -s DESTDIR="${pkgdir}" 'install-fixincludes'
  make -j1 -s -C 'gcc' DESTDIR="${pkgdir}" 'install-mkheaders'

  make -j1 -s -C 'lto-plugin' DESTDIR="${pkgdir}" install
  install -dm755 "${pkgdir}/${_libdir}/bfd-plugins/"
  ln -s "/${_libdir}/liblto_plugin.so" \
    "${pkgdir}/${_libdir}/bfd-plugins/"

  make -j1 -s -C "${CHOST}/libgomp" DESTDIR="${pkgdir}" install-nodist_{libsubinclude,toolexeclib}HEADERS
  make -j1 -s -C "${CHOST}/libitm" DESTDIR="${pkgdir}" 'install-nodist_toolexeclibHEADERS'
  make -j1 -s -C "${CHOST}/libquadmath" DESTDIR="${pkgdir}" 'install-nodist_libsubincludeHEADERS'
  make -j1 -s -C "${CHOST}/libsanitizer" DESTDIR="${pkgdir}" install-nodist_{saninclude,toolexeclib}HEADERS
  make -j1 -s -C "${CHOST}/libsanitizer/asan" DESTDIR="${pkgdir}" 'install-nodist_toolexeclibHEADERS'
  make -j1 -s -C "${CHOST}/libsanitizer/tsan" DESTDIR="${pkgdir}" 'install-nodist_toolexeclibHEADERS'
  make -j1 -s -C "${CHOST}/libsanitizer/lsan" DESTDIR="${pkgdir}" 'install-nodist_toolexeclibHEADERS'

  make -j1 -s -C 'libcpp' DESTDIR="${pkgdir}" install
  make -j1 -s -C 'gcc' DESTDIR="${pkgdir}" 'install-po'

  # many packages expect this symlink
  ln -s "gcc-${_majorver}" "${pkgdir}/usr/bin/cc-${_majorver}"

  # create cc-rs compatible symlinks
  # https://github.com/rust-lang/cc-rs/blob/1.0.73/src/lib.rs#L2578-L2581
  local _binary
  for _binary in {c++,g++,gcc,gcc-ar,gcc-nm,gcc-ranlib}; do
    ln -s "/usr/bin/${_binary}-${_majorver}" "${pkgdir}/usr/bin/x86_64-linux-gnu-${_binary}-${_majorver}"
  done

  # POSIX conformance launcher scripts for c89 and c99
  install -Dm755 "${srcdir}/c89" "${pkgdir}/usr/bin/c89-${_majorver}"
  install -Dm755 "${srcdir}/c99" "${pkgdir}/usr/bin/c99-${_majorver}"

  # byte-compile python libraries
  python -m 'compileall' "${pkgdir}/usr/share/gcc-${pkgver%%+*}/"
  python -O -m 'compileall' "${pkgdir}/usr/share/gcc-${pkgver%%+*}/"

  # Install Runtime Library Exception
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/share/licenses/${pkgbase}-libs/RUNTIME.LIBRARY.EXCEPTION" \
    "${pkgdir}/usr/share/licenses/${pkgname}/"

  # Remove conflicting files
  rm -rf "${pkgdir}/usr/share/locale"
}

package_gcc13-fortran() {
  local -
  set -u
  pkgdesc="Fortran front-end for GCC (${_majorver}.x.x)"
  depends=("${pkgbase}=${pkgver}-${pkgrel}")
  depends+=('libisl.so')

  cd "${_basedir}/gcc-build"
  make -j1 -s -C "${CHOST}/libgfortran" DESTDIR="${pkgdir}" 'install-cafexeclibLTLIBRARIES' \
    install-{toolexeclibDATA,nodist_fincludeHEADERS,gfor_cHEADERS}
  make -j1 -s -C "${CHOST}/libgomp" DESTDIR="${pkgdir}" 'install-nodist_fincludeHEADERS'
  make -j1 -s -C 'gcc' DESTDIR="${pkgdir}" 'fortran.install-common'
  local _libdir; _fn_setlibdir
  install -Dm755 'gcc/f951' "${pkgdir}/${_libdir}/f951"

  ln -s "gfortran-${_majorver}" "${pkgdir}/usr/bin/f95-${_majorver}"

  # Install Runtime Library Exception
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/share/licenses/${pkgbase}-libs/RUNTIME.LIBRARY.EXCEPTION" \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}
set +u
