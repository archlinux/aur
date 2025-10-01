# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

pkgbase=gcc-snapshot
pkgname=({gcc,gcc-libs,lib32-gcc-libs,gcc-ada,gcc-gcobol,gcc-d,gcc-fortran,gcc-go,gcc-m2,gcc-objc,gcc-rust,lto-dump,libgccjit}-snapshot)
pkgver=16.0.0.snapshot20250928
_pkgver=16-20250928
_majorver=${_pkgver//-*}
_snapshot=${_pkgver#*-}
_realver=${pkgver//.s*}
_gmpver=6.3.0
_mpcver=1.3.1
_mpfrver=4.2.2
pkgrel=1
pkgdesc='The GNU Compiler Collection (snapshot)'
arch=(x86_64)
license=(GPL-3.0-with-GCC-exception GFDL-1.3-or-later)
url='https://gcc.gnu.org'
makedepends=(binutils doxygen gcc-ada gcc-d git lib32-glibc lib32-gcc-libs python rust zstd)
checkdepends=(dejagnu expect inetutils python-pytest tcl)
options=(!emptydirs !lto)
_libdir=usr/lib/gcc/${CHOST}/${_realver}
source=(https://ftp.fu-berlin.de/unix/languages/gcc/snapshots/${_pkgver}/gcc-${_pkgver}.tar.xz
        git+https://repo.or.cz/isl.git#branch=maint
        https://gmplib.org/download/gmp/gmp-${_gmpver}.tar.xz{,.sig}
        https://ftp.gnu.org/gnu/mpc/mpc-${_mpcver}.tar.gz
        https://www.mpfr.org/mpfr-${_mpfrver}/mpfr-${_mpfrver}.tar.xz{,.asc}
        0002-libgccjit-Remove-obsolete-texinfo-statements.patch
        c89
        c99
        gcc-ada-repro.patch)
validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # Jakub Jelinek <jakub@redhat.com>
              343C2FF0FBEE5EC2EDBEF399F3599FF828C67298  # nisse@lysator.liu.se
              A534BE3F83E241D918280AEB5831D11A0D4DB02A) # vincent@vinc17.net
sha256sums=('cc0709722224a378d0b99b1c720eed539b92566205742429b717f4df7d6c5f4a'
            'SKIP'
            'a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898'
            'SKIP'
            'ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8'
            'b67ba0383ef7e8a8563734e2e889ef5ec3c3b898a01d00fa0a6869ad81c6ce01'
            'SKIP'
            '08ee6d267261aeaeadc117b7fc1cdfcbb60ffb9ae76728f33d6fcc60b0e8f240'
            'de48736f6e4153f03d0a5d38ceb6c6fdb7f054e8f47ddd6af0a3dbf14f27b931'
            '2513c6d9984dd0a2058557bf00f06d8d5181734e41dcfe07be7ed86f2959622a'
            '1773f5137f08ac1f48f0f7297e324d5d868d55201c03068670ee4602babdef2f')

prepare() {
  if [ ! -d gcc ]; then
    ln -s gcc-${_pkgver} gcc
  fi

  cd gcc
  mv ../isl isl
  mv ../gmp-${_gmpver} gmp
  mv ../mpc-${_mpcver} mpc
  mv ../mpfr-${_mpfrver} mpfr
  echo "${_realver}" >gcc/BASE-VER

  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in
  sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  patch -Np0 -i ${srcdir}/gcc-ada-repro.patch
  patch -Np1 -i ${srcdir}/0002-libgccjit-Remove-obsolete-texinfo-statements.patch

  mkdir -p ${srcdir}/gcc-build ${srcdir}/libgccjit-build
}

build() {
  local _confflags=(
    --prefix=/usr
    --libdir=/usr/lib
    --libexecdir=/usr/lib
    --mandir=/usr/share/man
    --infodir=/usr/share/info
    --with-bugurl=https://aur.archlinux.org/packages/gcc-snapshot
    --with-build-config=bootstrap-lto
    --with-linker-hash-style=gnu
    --with-system-zlib
    --with-isl-include=${srcdir}/gcc-${_pkgver}/isl/include
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

  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  ${srcdir}/gcc/configure \
    --enable-languages=ada,c,c++,cobol,d,fortran,go,lto,m2,rust,objc,obj-c++ \
    --enable-offload-targets=amdgcn-amdhsa,nvptx-none \
    --enable-bootstrap \
    "${_confflags[@]:?_confflags unset}"

  make -O "STAGE1_CFLAGS=-Os" "STAGE2_CFLAGS=-Os" "STAGE3_CFLAGS=-Os" "STAGE4_CFLAGS=-Os" \
          "BOOT_CFLAGS=${CFLAGS}" "BOOT_LDFLAGS=${LDFLAGS}" "LDFLAGS_FOR_TARGET=${LDFLAGS}" \
          bootstrap

  make -O -C ${CHOST}/libstdc++-v3/doc doc-man-doxygen

  cd ${srcdir}/libgccjit-build

  ${srcdir}/gcc/configure \
    --enable-languages=jit \
    --disable-bootstrap \
    --enable-host-shared \
    "${_confflags[@]:?_confflags unset}"

  make -O "STAGE1_CFLAGS=-Os" "STAGE2_CFLAGS=-Os" "STAGE3_CFLAGS=-Os" "STAGE4_CFLAGS=-Os" \
          "BOOT_CFLAGS=${CFLAGS}" "BOOT_LDFLAGS=${LDFLAGS}" "LDFLAGS_FOR_TARGET=${LDFLAGS}" \
          all-gcc

  cp -a gcc/libgccjit.so* ../gcc-build/gcc/
}

check() {
  cd gcc-build

  sed -i '/maybe-check-target-libphobos \\/d' Makefile

  make -O -k check || true
  ${srcdir}/gcc/contrib/test_summary
}

package_gcc-libs-snapshot() {
  pkgdesc='Runtime libraries shipped by GCC (snapshot)'
  depends=("glibc>=2.40")
  options=(!emptydirs lto strip)
  provides=(${pkgname}-multilib gcc-libs-multilib "gcc-libs=${pkgver}-${pkgrel}" libgcobol.so
            libgfortran.so libgo.so libgphobos.so libubsan.so libasan.so libtsan.so liblsan.so)
  replaces=(${pkgname}-multilib gcc-libs-multilib gcc-libs libgphobos)
  conflicts=(gcc-libs-multilib gcc-libs)

  cd gcc-build

  make -C ${CHOST}/libgcc DESTDIR=${pkgdir} install-shared

  rm -f ${pkgdir}/${_libdir}/libgcc_eh.a

  for lib in libatomic libgcobol libgfortran libgo libgomp libitm libquadmath \
             libsanitizer/{a,l,ub,t}san libstdc++-v3/src libvtv
  do
    make -C ${CHOST}/${lib} DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES
  done

  make -C ${CHOST}/libobjc DESTDIR=${pkgdir} install-libs
  make -C ${CHOST}/libgm2 DESTDIR=${pkgdir} install
  make -C ${CHOST}/libstdc++-v3/po DESTDIR=${pkgdir} install
  make -C ${CHOST}/libphobos DESTDIR=${pkgdir} install

  rm -rf ${pkgdir}/${_libdir}/include/d/ ${pkgdir}/usr/lib/libgphobos.spec

  for lib in libgomp libitm libquadmath
  do
    make -C ${CHOST}/${lib} DESTDIR=${pkgdir} install-info
  done

  rm -rf ${pkgdir}/usr/{lib32,lib/gcc}

  install -Dm644 ${srcdir}/gcc/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-snapshot() {
  pkgdesc='The GNU Compiler Collection - C and C++ frontends (snapshot)'
  depends=("gcc-libs-snapshot=${pkgver}-${pkgrel}" "binutils>=2.40" zstd)
  optdepends=("lib32-gcc-libs-snapshot: for generating code for 32-bit ABI")
  provides=(${pkgname}-multilib gcc-multilib gcc)
  replaces=(${pkgname}-multilib gcc-multilib gcc)
  conflicts=(gcc-multilib gcc)
  options=(!emptydirs lto strip staticlibs)

  cd gcc-build

  make -C gcc DESTDIR=${pkgdir} install-driver install-cpp install-gcc-ar c++.install-common \
                                install-headers install-plugin install-lto-wrapper

  install -m755 -t ${pkgdir}/usr/bin/ gcc/gcov{,-tool}
  install -m755 -t ${pkgdir}/${_libdir}/ gcc/{cc1,cc1plus,collect2,lto1}

  make -C ${CHOST}/libgcc DESTDIR=${pkgdir} install
  make -C ${CHOST}/32/libgcc DESTDIR=${pkgdir} install

  rm -f ${pkgdir}/usr/lib{,32}/libgcc_s.so*

  make -C ${CHOST}/libstdc++-v3/src DESTDIR=${pkgdir} install
  make -C ${CHOST}/libstdc++-v3/include DESTDIR=${pkgdir} install
  make -C ${CHOST}/libstdc++-v3/libsupc++ DESTDIR=${pkgdir} install
  make -C ${CHOST}/libstdc++-v3/python DESTDIR=${pkgdir} install
  make -C ${CHOST}/32/libstdc++-v3/src DESTDIR=${pkgdir} install
  make -C ${CHOST}/32/libstdc++-v3/include DESTDIR=${pkgdir} install
  make -C ${CHOST}/32/libstdc++-v3/libsupc++ DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} install-libcc1

  install -d ${pkgdir}/usr/share/gdb/auto-load/usr/lib
  mv ${pkgdir}/usr/lib/libstdc++.so.6.*-gdb.py ${pkgdir}/usr/share/gdb/auto-load/usr/lib/

  rm -f ${pkgdir}/usr/lib{,32}/libstdc++.so*

  make DESTDIR=${pkgdir} install-fixincludes
  make -C gcc DESTDIR=${pkgdir} install-mkheaders
  make -C lto-plugin DESTDIR=${pkgdir} install

  install -dm755 ${pkgdir}/usr/lib/bfd-plugins/
  ln -s /${_libdir}/liblto_plugin.so ${pkgdir}/usr/lib/bfd-plugins/

  make -C ${CHOST}/libgomp DESTDIR=${pkgdir} install-nodist_{libsubinclude,toolexeclib}HEADERS
  make -C ${CHOST}/libitm DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C ${CHOST}/libquadmath DESTDIR=${pkgdir} install-nodist_libsubincludeHEADERS
  make -C ${CHOST}/libsanitizer DESTDIR=${pkgdir} install-nodist_{saninclude,toolexeclib}HEADERS
  make -C ${CHOST}/libsanitizer/asan DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C ${CHOST}/libsanitizer/tsan DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C ${CHOST}/libsanitizer/lsan DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C ${CHOST}/32/libgomp DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C ${CHOST}/32/libitm DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C ${CHOST}/32/libsanitizer DESTDIR=${pkgdir} install-nodist_{saninclude,toolexeclib}HEADERS
  make -C ${CHOST}/32/libsanitizer/asan DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C gcc DESTDIR=${pkgdir} install-man install-info

  rm -f ${pkgdir}/usr/share/man/man1/{gcobol,gccgo,gfortran,lto-dump,gdc,gm2}*
  rm -f ${pkgdir}/usr/share/man/man3/gcobol*
  rm -f ${pkgdir}/usr/share/info/{gccgo,gfortran,gnat-style,gnat_rm,gnat_ugn,gdc,m2}*

  make -C libcpp DESTDIR=${pkgdir} install
  make -C gcc DESTDIR=${pkgdir} install-po

  ln -s gcc ${pkgdir}/usr/bin/cc

  for binary in {c++,g++,gcc,gcc-ar,gcc-nm,gcc-ranlib}
  do
    ln -s /usr/bin/${binary} ${pkgdir}/usr/bin/x86_64-linux-gnu-${binary}
  done

  install -Dm755 ${srcdir}/c89 ${pkgdir}/usr/bin/c89
  install -Dm755 ${srcdir}/c99 ${pkgdir}/usr/bin/c99

  make -C ${CHOST}/libstdc++-v3/doc DESTDIR=${pkgdir} doc-install-man

  rm -f ${pkgdir}/usr/lib32/lib{stdc++,gcc_s}.so

  python -m compileall ${pkgdir}/usr/share/gcc-${pkgver%%+*}/
  python -O -m compileall ${pkgdir}/usr/share/gcc-${pkgver%%+*}/

  install -d ${pkgdir}/usr/share/licenses/${pkgname}/
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    ${pkgdir}/usr/share/licenses/${pkgname}/
}

package_gcc-fortran-snapshot() {
  pkgdesc='Fortran front-end for GCC (snapshot)'
  depends=("gcc-snapshot=${pkgver}-${pkgrel}")
  provides=(${pkgname}-multilib gcc-fortran-multilib gcc-fortran)
  replaces=(${pkgname}-multilib gcc-fortran-multilib gcc-fortran)
  conflicts=(gcc-fortran-multilib gcc-fortran)
  options=(lto strip staticlibs)

  cd gcc-build

  make -C ${CHOST}/libgfortran DESTDIR=${pkgdir} install-cafexeclibLTLIBRARIES \
    install-{toolexeclibDATA,nodist_fincludeHEADERS,gfor_cHEADERS}
  make -C ${CHOST}/32/libgfortran DESTDIR=${pkgdir} install-cafexeclibLTLIBRARIES \
    install-{toolexeclibDATA,nodist_fincludeHEADERS,gfor_cHEADERS}
  make -C ${CHOST}/libgomp DESTDIR=${pkgdir} install-nodist_fincludeHEADERS
  make -C gcc DESTDIR=${pkgdir} fortran.install-{common,man,info}

  install -Dm755 gcc/f951 ${pkgdir}/${_libdir}/f951
  ln -s gfortran ${pkgdir}/usr/bin/f95
  install -d ${pkgdir}/usr/share/licenses/${pkgname}/
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    ${pkgdir}/usr/share/licenses/${pkgname}/
}

package_gcc-objc-snapshot() {
  pkgdesc='Objective-C front-end for GCC (snapshot)'
  depends=("gcc-snapshot=${pkgver}-${pkgrel}")
  provides=(${pkgname}-multilib gcc-objc-multilib gcc-objc)
  replaces=(${pkgname}-multilib gcc-objc-multilib gcc-objc)
  conflicts=(gcc-objc-multilib gcc-objc)
  options=(lto strip staticlibs)

  cd gcc-build

  make DESTDIR=${pkgdir} -C ${CHOST}/libobjc install-headers

  install -dm755 ${pkgdir}/${_libdir}
  install -m755 gcc/cc1obj{,plus} ${pkgdir}/${_libdir}/
  install -d ${pkgdir}/usr/share/licenses/${pkgname}/
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    ${pkgdir}/usr/share/licenses/${pkgname}/
}

package_gcc-ada-snapshot() {
  pkgdesc='Ada front-end for GCC (snapshot)'
  depends=("gcc-snapshot=${pkgver}-${pkgrel}")
  provides=(${pkgname}-multilib gcc-ada-multilib gcc-ada)
  replaces=(${pkgname}-multilib gcc-ada-multilib gcc-ada)
  conflicts=(gcc-ada-multilib gcc-ada)
  options=(!emptydirs lto strip staticlibs)

  cd gcc-build/gcc

  make DESTDIR=${pkgdir} ada.install-{common,info}
  install -m755 gnat1 ${pkgdir}/${_libdir}

  cd ${srcdir}/gcc-build/${CHOST}/libada
  make DESTDIR=${pkgdir} INSTALL=install INSTALL_DATA="install -m644" install-libada

  cd ${srcdir}/gcc-build/${CHOST}/32/libada
  make DESTDIR=${pkgdir} INSTALL=install INSTALL_DATA="install -m644" install-libada

  ln -s gcc ${pkgdir}/usr/bin/gnatgcc

  mv ${pkgdir}/${_libdir}/adalib/libgna{rl,t}-${_majorver}.so ${pkgdir}/usr/lib
  ln -s libgnarl-${_majorver}.so ${pkgdir}/usr/lib/libgnarl.so
  ln -s libgnat-${_majorver}.so ${pkgdir}/usr/lib/libgnat.so

  rm -f ${pkgdir}/${_libdir}/adalib/libgna{rl,t}.so

  install -d ${pkgdir}/usr/lib32/
  mv ${pkgdir}/${_libdir}/32/adalib/libgna{rl,t}-${_majorver}.so ${pkgdir}/usr/lib32
  ln -s libgnarl-${_majorver}.so ${pkgdir}/usr/lib32/libgnarl.so
  ln -s libgnat-${_majorver}.so ${pkgdir}/usr/lib32/libgnat.so

  rm -f ${pkgdir}/${_libdir}/32/adalib/libgna{rl,t}.so

  install -d ${pkgdir}/usr/share/licenses/${pkgname}/
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    ${pkgdir}/usr/share/licenses/${pkgname}/
}

package_gcc-gcobol-snapshot() {
  pkgdesc='Cobol front-end for GCC (snapshot)'
  depends=("gcc-snapshot=${pkgver}-${pkgrel}")
  provides=(${pkgname}-multilib gcc-gcobol-multilib gcc-gcobol)
  replaces=(${pkgname}-multilab gcc-gcobol-multilib gcc-gcobol)
  conflicts=(gcc-gcobol-multilib gcc-gcobol)
  options=(!emptydirs lto strip staticlibs)

  cd gcc-build

  make -C gcc DESTDIR=${pkgdir} cobol.install-{common,man,info}
  make -C ${CHOST}/libgcobol DESTDIR=${pkgdir} install

  rm -f ${pkgdir}/usr/lib{,32}/libgcobol*.so*

  install -Dm755 gcc/cobol1 ${pkgdir}/${_libdir}/cobol1
  install -d ${pkgdir}/usr/share/licenses/${pkgname}/
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    ${pkgdir}/usr/share/licenses/${pkgname}/
}

package_gcc-go-snapshot() {
  pkgdesc='Go front-end for GCC (snapshot)'
  depends=("gcc-snapshot=${pkgver}-${pkgrel}")
  provides=("go=1.18" ${pkgname}-multilib gcc-go-multilib gcc-go)
  replaces=(${pkgname}-multilib gcc-go-multilib gcc-go)
  conflicts=(go)
  options=(lto strip staticlibs)

  cd gcc-build

  make -C ${CHOST}/libgo DESTDIR=${pkgdir} install-exec-am
  make -C ${CHOST}/32/libgo DESTDIR=${pkgdir} install-exec-am
  make DESTDIR=${pkgdir} install-gotools
  make -C gcc DESTDIR=${pkgdir} go.install-{common,man,info}

  rm -f ${pkgdir}/usr/lib{,32}/libgo.so*

  install -Dm755 gcc/go1 ${pkgdir}/${_libdir}/go1
  install -d ${pkgdir}/usr/share/licenses/${pkgname}/
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    ${pkgdir}/usr/share/licenses/${pkgname}/
}

package_lib32-gcc-libs-snapshot() {
  pkgdesc='32-bit runtime libraries shipped by GCC (snapshot)'
  depends=("lib32-glibc>=2.40")
  provides=(lib32-gcc-libs libgcobol.so libgfortran.so libgo.so libubsan.so libasan.so)
  replaces=(lib32-gcc-libs)
  conflicts=(lib32-gcc-libs)
  options=(!emptydirs lto strip)

  cd gcc-build

  make -C ${CHOST}/32/libgcc DESTDIR=${pkgdir} install-shared
  for lib in libatomic libgcobol libgfortran libgo libgomp libitm libquadmath \
             libsanitizer/{a,l,ub}san libstdc++-v3/src libvtv
  do
    make -C ${CHOST}/32/${lib} DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES
  done
  make -C ${CHOST}/32/libgcobol DESTDIR=${pkgdir} install
  make -C ${CHOST}/32/libobjc DESTDIR=${pkgdir} install-libs
  make -C ${CHOST}/32/libgm2 DESTDIR=${pkgdir} install
  make -C ${CHOST}/libphobos DESTDIR=${pkgdir} install

  rm -rf ${pkgdir}/${_libdir}/32/libgcc_eh.a ${pkgdir}/usr/lib32/libgphobos.spec ${pkgdir}/usr/lib

  install -Dm644 ${srcdir}/gcc/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/lib32-gcc-libs/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-d-snapshot() {
  pkgdesc='D frontend for GCC (snapshot)'
  depends=("gcc-snapshot=${pkgver}-${pkgrel}")
  provides=(gcc-d gdc)
  replaces=(gcc-d gdc)
  conflicts=(gcc-d gdc)
  options=(lto strip staticlibs)

  cd gcc-build

  make -C gcc DESTDIR=${pkgdir} d.install-{common,man,info}

  install -Dm755 gcc/gdc ${pkgdir}/usr/bin/gdc
  install -Dm755 gcc/d21 ${pkgdir}/${_libdir}/d21

  make -C ${CHOST}/libphobos DESTDIR=${pkgdir} install

  rm -f ${pkgdir}/usr/lib{,32}/lib{gphobos,gdruntime}.so*

  install -d ${pkgdir}/usr/share/licenses/${pkgname}/
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    ${pkgdir}/usr/share/licenses/${pkgname}/
}

package_gcc-m2-snapshot() {
  pkgdesc='Modula-2 frontend for GCC (snapshot)'
  depends=("gcc-snapshot=${pkgver}-${pkgrel}")
  provides=(${pkgname}-multilib gcc-m2-multilib gcc-m2)
  replaces=(${pkgname}-multilib gcc-m2-multilib gcc-m2)
  conflicts=(gcc-m2-multilib gcc-m2)
  options=(lto strip staticlibs)

  cd gcc-build

  make -C gcc DESTDIR=${pkgdir} m2.install-{common,man,info}

  install -Dm755 gcc/cc1gm2 ${pkgdir}/${_libdir}/cc1gm2
  install -Dm755 gcc/gm2 ${pkgdir}/usr/bin/gm2

  make -C ${CHOST}/libgm2 DESTDIR=${pkgdir} install

  rm -f ${pkgdir}/usr/lib{,32}/libm2*.so*

  install -d ${pkgdir}/usr/share/licenses/${pkgname}/
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    ${pkgdir}/usr/share/licenses/${pkgname}/
}

package_gcc-rust-snapshot() {
  pkgdesc='Rust frontend for GCC (snapshot)'
  depends=("gcc-snapshot=${pkgver}-${pkgrel}")
  provides=(${pkgname}-multilib gcc-rust-multilib gcc-rust)
  replaces=(${pkgname}-multilib gcc-rust-multilib gcc-rust)
  conflicts=(gcc-rust-multilib gcc-rust)
  options=(lto strip staticlibs)

  cd gcc-build

  make -C gcc DESTDIR=${pkgdir} rust.install-{common,man,info}

  install -Dm755 gcc/gccrs ${pkgdir}/usr/bin/gccrs
  install -Dm755 gcc/crab1 ${pkgdir}/usr/bin/crab1
  install -d ${pkgdir}/usr/share/licenses/${pkgname}/
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    ${pkgdir}/usr/share/licenses/${pkgname}/
}

package_lto-dump-snapshot() {
  pkgdesc='Dump link time optimization object files (snapshot)'
  depends=("gcc-snapshot=${pkgver}-${pkgrel}")
  provides=(lto-dump)
  replaces=(lto-dump)
  conflicts=(lto-dump)
  options=(lto strip staticlibs)

  cd gcc-build

  make -C gcc DESTDIR=${pkgdir} lto.install-{common,man,info}

  install -d ${pkgdir}/usr/share/licenses/${pkgname}/
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    ${pkgdir}/usr/share/licenses/${pkgname}/
}

package_libgccjit-snapshot() {
  pkgdesc='Just-In-Time Compilation with GCC backend (snapshot)'
  depends=("gcc-snapshot=${pkgver}-${pkgrel}")
  provides=(libgccjit)
  replaces=(libgccjit)
  conflicts=(libgccjit)
  options=(lto strip staticlibs)

  cd gcc-build

  make -C gcc DESTDIR=${pkgdir} jit.install-common jit.install-info

  install -d ${pkgdir}/usr/share/licenses/${pkgname}/
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    ${pkgdir}/usr/share/licenses/${pkgname}/
}
