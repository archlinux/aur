# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Valentín Kivachuk <vk18496@gmail.com>

_target=mips64-linux-gnu
pkgname="${_target}-gcc"
pkgver=12.2.0
_majorver="${pkgver%%.*}"
pkgrel=1
pkgdesc='The GNU Compiler Collection - cross compiler for the MIPS64 target (for the toolchain with GNU C library and with multilib ABI)'
arch=('x86_64')
url='https://gcc.gnu.org/'
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('gmp' 'libmpc' "${_target}-binutils" "${_target}-glibc" 'libisl' 'mpfr' 'sh' 'zlib' 'zstd')
makedepends=("${_target}-linux-api-headers")
provides=('mips64-linux-gnuabi64-gcc' 'mips64-linux-gnuabi32-gcc'
          'mips64-linux-gnuabin32-gcc' "${pkgname}-bootstrap")
conflicts=('mips64-linux-gnuabi64-gcc' 'mips64-linux-gnuabi32-gcc'
           'mips64-linux-gnuabin32-gcc' "${pkgname}-bootstrap")
options=('!emptydirs' '!strip' 'staticlibs' '!lto')
source=("https://sourceware.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz"{,.sig}
        '010-gcc-Wno-format-security.patch'
        '020-gcc-config-mips-multilib.patch'
        '030-gcc-gdc-phobos-path.patch')
sha256sums=('e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39beb4181e06926230ff'
            'SKIP'
            '77e3976bb82a2e47e9334b9b865fd9b2f02e0b726f6489ef890a9b26696b1284'
            '1e3184b9ddacf7ba6a1621f7e1f0aace76d76f791fca8fd3bdd855dc7a43356e'
            'd947bee1fa9325956aac7a0b41f6a6485bc5b6f65b9c2c61b276edfbba5f88f1')
validpgpkeys=('13975A70E63C361C73AE69EF6EEB81F8981C74C7'  # Richard Guenther <richard.guenther@gmail.com>
              'D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62') # Jakub Jelinek <jakub@redhat.com>

_ABIS=('64' 'n32' '32')
_DEFAULT_ABI='64' # gcc defaults to 'n32' ABI for MIPS64

prepare() {
    mkdir -p build
    patch -d "gcc-${pkgver}" -Np1 -i "${srcdir}/010-gcc-Wno-format-security.patch"
    patch -d "gcc-${pkgver}" -Np1 -i "${srcdir}/020-gcc-config-mips-multilib.patch"
    patch -d "gcc-${pkgver}" -Np1 -i "${srcdir}/030-gcc-gdc-phobos-path.patch"
}

build() {
    cd build
    
    # using -pipe causes spurious test-suite failures
    # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
    
    local _opt
    for _opt in '-pipe' '-Werror=format-security' '-fstack-clash-protection' '-fcf-protection'
    do
        export CFLAGS="${CFLAGS/"$_opt"/}"
        export CXXFLAGS="${CXXFLAGS/"$_opt"/}"
    done
	
    # position independent code (PIE) is troublesome in MIPS, as
    # it can cause this error when building software with gcc:
    # cc1: error: position-independent code requires ‘-mabicalls’
    # (this error is not always solved when using '-mabicalls')
    # https://github.com/crosstool-ng/crosstool-ng/issues/948
    # https://gcc.gnu.org/legacy-ml/gcc-patches/2012-08/msg00237.html
    
    "${srcdir}/gcc-${pkgver}/configure" \
        --build="$CHOST" \
        --host="$CHOST" \
        --target="$_target" \
        --prefix='/usr' \
        --libdir='/usr/lib' \
        --libexecdir='/usr/lib' \
        --mandir='/usr/share/man' \
        --with-sysroot="/usr/${_target}" \
        --with-build-sysroot="/usr/${_target}" \
        --with-native-system-header-dir='/include' \
        --with-abi="$_DEFAULT_ABI" \
        --with-gnu-as \
        --with-gnu-ld \
        --enable-languages='c,c++,fortran' \
        --with-isl \
        --with-linker-hash-style='gnu' \
        --with-system-zlib \
        --enable-__cxa_atexit \
        --enable-cet='auto' \
        --enable-checking='release' \
        --enable-clocale='gnu' \
        --disable-default-pie \
        --enable-default-ssp \
        --enable-gnu-indirect-function \
        --enable-gnu-unique-object \
        --enable-install-libiberty \
        --enable-linker-build-id \
        --enable-lto \
        --enable-multilib \
        --enable-plugin \
        --enable-shared \
        --enable-threads='posix' \
        --disable-libssp \
        --disable-libstdcxx-pch \
        --disable-libunwind-exceptions \
        --disable-werror \
        --disable-libsanitizer
    make
}

check() {
    # disable libphobos test to avoid segfaults and other possible problems
    sed -i '/maybe-check-target-libphobos \\/d' build/Makefile 
    
    # do not abort on error as some are "expected"
    make -C build -k check || true
    "gcc-${pkgver}/contrib/test_summary"
}

package() {
    make -C build DESTDIR="$pkgdir" install-gcc install-target-{libgcc,libstdc++-v3,libgomp,libgfortran,libquadmath}
    
    # allow using gnuabi${_abi} executables
    local _abi
    local _bin
    for _abi in "${_ABIS[@]}"
    do
        for _bin in c++ cpp g++ gcc "gcc-${pkgver}"
        do
            if [ "$_abi" = "$_DEFAULT_ABI" ]
            then
                ln -s "${_target}-${_bin}" "${pkgdir}/usr/bin/${_target/gnu/"gnuabi${_abi}"}-${_bin}"
            else
                cat <<- __EOF__ | install -D -m755 /dev/stdin "${pkgdir}/usr/bin/${_target/gnu/"gnuabi${_abi}"}-${_bin}"
				#!/bin/sh
				
				exec ${_target}-${_bin} -mabi='${_abi}' "\$@"
__EOF__
            fi
            
            case "$_bin" in
                cpp|g++|gcc)
                    ln -s "${_target}-${_bin}.1.gz" "${pkgdir}/usr/share/man/man1/${_target/gnu/"gnuabi${_abi}"}-${_bin}.1.gz"
                    ;;
            esac
        done
    done
    
    install -D -m644 "gcc-${pkgver}/COPYING.RUNTIME" \
        "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION"
    
    # remove conflicting files
    rm -r "${pkgdir}/usr/share"/{"gcc-${pkgver}",info,locale,man/man7}
    
    # strip target binaries
    find "${pkgdir}/usr/lib/gcc/${_target}" "${pkgdir}/usr/${_target}/lib" \
         -type f -and \( -name \*.a -or -name \*.o \) \
         -exec "${_target}-objcopy" -R .comment -R .note -R .debug_info -R .debug_aranges \
             -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line \
             -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;
    
    # strip host binaries
    find "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/gcc/${_target}" -type f -and \( -executable \) -exec strip '{}' \;
}
