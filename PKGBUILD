# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Valentín Kivachuk <vk18496@gmail.com>

_target=mips64-linux-gnu
pkgname="${_target}-glibc"
pkgver=2.36
pkgrel=1
pkgdesc='GNU C library for the MIPS64 target with multilib ABI'
arch=('any')
url='https://www.gnu.org/software/libc/'
license=('GPL' 'LGPL')
depends=("${_target}-linux-api-headers")
makedepends=("${_target}-gcc-bootstrap" 'python')
options=('!emptydirs' '!strip' 'staticlibs' '!lto')
source=("https://ftp.gnu.org/gnu/glibc/glibc-${pkgver}.tar.xz"{,.sig}
        'sdt-config.h'
        'sdt.h')
sha256sums=('1c959fea240906226062cb4b1e7ebce71a9f0e3c0836c09e7e3423d434fcfe75'
            'SKIP'
            'cdc234959c6fdb43f000d3bb7d1080b0103f4080f5e67bcfe8ae1aaf477812f0'
            '774061aff612a377714a509918a9e0e0aafce708b87d2d7e06b1bd1f6542fe70')
validpgpkeys=('7273542B39962DF7B299931416792B4EA25340F8'  # Carlos O'Donell
              'BC7C7372637EC10C57D7AA6579C43DFBF1CF2187') # Siddhesh Poyarekar

_ABIS=('64' 'n32' '32')

prepare() {
    local _abi
    for _abi in "${_ABIS[@]}"
    do
        mkdir -p "build-abi-${_abi}"
        printf '%s\n' "slibdir=/lib/${pkgname##*-}/abi-${_abi}" > "build-abi-${_abi}/configparms"
        printf '%s\n' "rtlddir=/lib/${pkgname##*-}/abi-${_abi}" >> "build-abi-${_abi}/configparms"
        printf '%s\n' 'rootsbindir=/bin' >> "build-abi-${_abi}/configparms"
        printf '%s\n' 'sbindir=/bin' >> "build-abi-${_abi}/configparms"
    done
    
    install -d -m755 sys
    ln -sf ../sdt.h sys/sdt.h
    ln -sf ../sdt-config.h sys/sdt-config.h
}

build() {
    # when using --enable-static-pie:
    # configure: error: the architecture does not support static PIE
    # (independently if gcc/gcc-bootstrap was configured with or wihtout default-pie)
    
    local _configure_flags=(
        "--build=${CHOST}"
        "--host=${_target}"
        "--target=${_target}"
        '--prefix=/usr'
        '--includedir=/include'
        "--with-headers=/usr/${_target}/include"
        '--enable-add-ons'
        '--enable-bind-now'
        '--disable-cet'
        '--enable-kernel=4.4'
        '--enable-lock-elision'
        '--disable-multi-arch'
        '--enable-stack-protector=strong'
        '--enable-stackguard-randomization'
        '--disable-static-pie'
        '--enable-systemtap'
        '--disable-profile'
        '--disable-werror')
    
    # remove fortify for building libraries
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=2/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=2/}"
    
    # build fixes
    export CFLAGS="$(sed -E 's/\-fno\-plt//;s/\-fcf\-protection//' <<< "$CFLAGS")"
    export CXXFLAGS="$(sed -E 's/\-fno\-plt//;s/\-fcf\-protection//' <<< "$CXXFLAGS")"
    export CFLAGS="$(sed -E 's/\-m(arch|tune|cpu|fpu|abi)(=|[[:space:]]*)[[:alnum:]\-]*//g' <<< "$CFLAGS")"
    export CXXFLAGS="$(sed -E 's/\-m(arch|tune|cpu|fpu|abi)(=|[[:space:]]*)([[:alnum:]\-]*)//g' <<< "$CXXFLAGS")"
    export LDFLAGS="${LDFLAGS/,-z,now/}"
    
    export BUILD_CC='gcc'
    export AR="${_target}-ar"
    export RANLIB="${_target}-ranlib"
    
    local _abi
    for _abi in "${_ABIS[@]}"
    do
        cd "${srcdir}/build-abi-${_abi}"
        export CC="${_target}-gcc -mabi=${_abi} -I${srcdir}"
        export CXX="${_target}-g++ -mabi=${_abi} -I${srcdir}"
        
        "${srcdir}/glibc-${pkgver}/configure" \
            --libdir="/lib/${pkgname##*-}/abi-${_abi}" \
            --libexecdir="/lib/${pkgname##*-}/abi-${_abi}" \
            "${_configure_flags[@]}"
        
        printf '%s\n' 'build-programs=no' >> configparms
        make
    done
}

package() {
    local _abi
    for _abi in "${_ABIS[@]}"
    do
        make -C "build-abi-${_abi}" install_root="${pkgdir}/usr/${_target}" install
        
        find "${pkgdir}/usr/${_target}/lib/${pkgname##*-}/abi-${_abi}" -name '*.a' -type f \
            -exec "${_target}-strip" "$STRIP_STATIC" {} + 2> /dev/null || true
        
        # do not strip these for gdb and valgrind functionality, but strip the rest
        find "${pkgdir}/usr/${_target}/lib/${pkgname##*-}/abi-${_abi}" \
            -not -name 'ld-*.so' \
            -not -name 'libc-*.so' \
            -not -name 'libpthread-*.so' \
            -not -name 'libthread_db-*.so' \
            -name '*-*.so' -type f -exec "${_target}-strip" "$STRIP_SHARED" {} + 2> /dev/null || true
    done
    
    # provide tracing probes to libstdc++ for exceptions, possibly for other
    # libraries too. Useful for gdb's catch command.
    install -D -m644 sdt{,-config}.h -t "${pkgdir}/usr/${_target}/include/sys"
    
    # remove unneeded files
    rm -r "${pkgdir}/usr/${_target}"/{etc,usr/share,var}
}
