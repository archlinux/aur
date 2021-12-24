# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# this package is the bootstrap (stage1) cross  compiler, used
# to build the first cross C library on the system only during
# the first creation of the toolchain. It cannot build regular
# software, since a cross C library will  not be  present yet.
# When  the final  cross compiler is  installed, this  package
# is not needed to be built anymore for  building new versions
# of the cross C library and the cross compiler.

_target=mips64-linux-gnu
pkgname="${_target}-gcc-bootstrap"
pkgver=11.2.0
_islver=0.24
_majorver="${pkgver%%.*}"
pkgrel=2
pkgdesc='The GNU Compiler Collection - bootstrap/stage1 cross compiler for the MIPS64 target (for the toolchain with GNU C library and multilib ABI)'
arch=('x86_64')
url='https://gcc.gnu.org/'
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('gmp' 'libmpc' "${_target}-binutils" 'mpfr' 'sh' 'zlib' 'zstd')
makedepends=("${_target}-linux-api-headers")
provides=('mips64-linux-gnuabi64-gcc-bootstrap' 'mips64-linux-gnuabi32-gcc-bootstrap'
          'mips64-linux-gnuabin32-gcc-bootstrap')
conflicts=('mips64-linux-gnuabi64-gcc-bootstrap' 'mips64-linux-gnuabi32-gcc-bootstrap'
           'mips64-linux-gnuabin32-gcc-bootstrap')
options=('!emptydirs')
source=("https://sourceware.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz"{,.sig}
        #"http://isl.gforge.inria.fr/isl-${_islver}.tar.xz"
        "https://sourceforge.net/projects/libisl/files/isl-${_islver}.tar.xz"
        '010-gcc-fix-build.patch'
        '020-gcc11-Wno-format-security.patch')
sha256sums=('d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b'
            'SKIP'
            '043105cc544f416b48736fff8caf077fb0663a717d06b1113f16e391ac99ebad'
            '6b3a5608bcb7bba042b25aab518c7f8dc50180174d53d5f4bbe381c9b0132e27'
            '504e4b5a08eb25b6c35f19fdbe0c743ae4e9015d0af4759e74150006c283585e')
validpgpkeys=('13975A70E63C361C73AE69EF6EEB81F8981C74C7'  # Richard Guenther <richard.guenther@gmail.com>
              '33C235A34C46AA3FFB293709A328C3A2C3C45C06') # Jakub Jelinek <jakub@redhat.com>

_ABIS=('64' 'n32' '32')
_DEFAULT_ABI='64' # gcc defaults to 'n32' ABI for MIPS64

prepare() {
    mkdir -p build
    
    # link isl for in-tree build
    ln -s "../isl-${_islver}" "gcc-${pkgver}/isl"
    
    patch -d "gcc-${pkgver}" -Np1 -i "${srcdir}/010-gcc-fix-build.patch"
    patch -d "gcc-${pkgver}" -Np0 -i "${srcdir}/020-gcc11-Wno-format-security.patch"
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
        --with-newlib \
        --with-gnu-as \
        --with-gnu-ld \
        --enable-languages='c,c++' \
        --with-isl \
        --with-linker-hash-style='gnu' \
        --with-system-zlib \
        --enable-__cxa_atexit \
        --enable-cet='auto' \
        --enable-checking='release' \
        --enable-clocale='newlib' \
        --disable-default-pie \
        --enable-default-ssp \
        --enable-gnu-indirect-function \
        --enable-gnu-unique-object \
        --enable-install-libiberty \
        --enable-linker-build-id \
        --enable-lto \
        --enable-multilib \
        --enable-plugin \
        --disable-shared \
        --disable-threads \
        --disable-libssp \
        --disable-libstdcxx-pch \
        --disable-libunwind-exceptions \
        --disable-werror
    make all-gcc all-target-libgcc
}

check() {
    # disable libphobos test to avoid segfaults and other possible problems
    sed -i '/maybe-check-target-libphobos \\/d' build/Makefile 
    
    # do not abort on error as some are "expected"
    make -C build -k check || true
    "gcc-${pkgver}/contrib/test_summary"
}

package() {
    make -C build DESTDIR="$pkgdir" install-gcc install-target-libgcc
    
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
    rm -r "${pkgdir}/usr/share"/{info,locale,man/man7}
    
    # strip target binaries
    find "${pkgdir}/usr/lib/gcc/${_target}" \
         -type f -and \( -name \*.a -or -name \*.o \) \
         -exec "${_target}-objcopy" -R .comment -R .note -R .debug_info -R .debug_aranges \
             -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line \
             -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;
    
    # strip host binaries
    find "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/gcc/${_target}" -type f -and \( -executable \) -exec strip '{}' \;
}
