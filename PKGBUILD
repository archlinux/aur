# Maintainer: Armin K. <krejzi at email dot com>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Anders Bergh <anders@archlinuxppc.org>
# Contributor: Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>

pkgbase=lib32-llvm-svn
pkgname=('lib32-llvm-svn' 'lib32-llvm-libs-svn' 'lib32-clang-svn')
_pkgname='llvm'
pkgver=224989
pkgrel=1
arch=('x86_64')
url="http://llvm.org"
license=('custom:University of Illinois')
makedepends=('subversion' 'lib32-libffi' 'lib32-zlib' 'python2' 'gcc-multilib')

# this is always the latest svn so debug info can be useful
options=('staticlibs' '!strip')

source=("${_pkgname}::svn+http://llvm.org/svn/llvm-project/llvm/trunk"
        "clang::svn+http://llvm.org/svn/llvm-project/cfe/trunk"
        "compiler-rt::svn+http://llvm.org/svn/llvm-project/compiler-rt/trunk")
sha256sums=('SKIP'
            'SKIP'    
            'SKIP')

pkgver()
{
    cd "${srcdir}/${_pkgname}"
    svnversion | tr -d [A-z]
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    svn export "${srcdir}/clang" tools/clang
    svn export "${srcdir}/compiler-rt" projects/compiler-rt

    # Fix installation directories, ./configure doesn't seem to set them right
    sed -e 's:\$(PROJ_prefix)/lib:$(PROJ_prefix)/lib32:' \
        -e 's:\$(PROJ_prefix)/docs/llvm:$(PROJ_prefix)/share/doc/llvm:' \
        -i Makefile.config.in
    sed -e '/ActiveLibDir = ActivePrefix/s:lib:lib32:' \
        -i tools/llvm-config/llvm-config.cpp
    sed -e 's:LLVM_LIBDIR="${prefix}/lib":LLVM_LIBDIR="${prefix}/lib32":' \
        -i autoconf/configure.ac \
        -i configure
}

build() {
    cd "${srcdir}/${_pkgname}"

    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    # Apply strip option to configure
    _optimized_switch="enable"
    [[ $(check_option strip) == n ]] && _optimized_switch="disable"

    # Include location of libffi headers in CPPFLAGS
    CPPFLAGS+=" $(pkg-config --cflags libffi)"

    # We had to force host and target to get
    # a proper triplet reported by llvm

    ./configure \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --sysconfdir=/etc \
        --enable-shared \
        --enable-libffi \
        --enable-targets=all \
        --disable-expensive-checks \
        --disable-debug-runtime \
        --disable-assertions \
        --with-binutils-include=/usr/include \
        --with-python=/usr/bin/python2 \
        --build=i686-pc-linux-gnu \
        --host=i686-pc-linux-gnu \
        --$_optimized_switch-optimized \
        --disable-bindings

    make REQUIRES_RTTI=1
}

package_lib32-llvm-svn() {
    pkgdesc="Low Level Virtual Machine (32-bit)"
    depends=("lib32-llvm-libs-svn=$pkgver-$pkgrel" 'llvm')
    provides=('lib32-llvm')
    replaces=('lib32-llvm')
    conflicts=('lib32-llvm')

    cd "${srcdir}/${_pkgname}"

    make DESTDIR="${pkgdir}" install

    rm -rf "${srcdir}"/*.so
    mv "${pkgdir}"/usr/lib32/libLLVM-*.so "${srcdir}/"

    # Fix permissions of static libs
    chmod -x "${pkgdir}"/usr/lib32/*.a

    mv "${pkgdir}/usr/bin/llvm-config" "${pkgdir}/usr/lib32/llvm-config"

    rm -rf "${pkgdir}"/usr/lib32/*LLVMHello.*

    # Symlink LLVMgold.so into /usr/lib32/bfd-plugins
    # https://bugs.archlinux.org/task/28479
    install -m755 -d "${pkgdir}/usr/lib32/bfd-plugins"
    ln -s ../LLVMgold.so "${pkgdir}/usr/lib32/bfd-plugins/LLVMgold.so"

    mv "${pkgdir}"/usr/include/llvm/Config/*config.h "${pkgdir}/"
    rm -rf "${pkgdir}"/usr/{bin,include,share/{doc,man,llvm}}

    # remove conflicting clang files
    rm -rf "${pkgdir}"/usr/lib
    rm -rf "${pkgdir}"/usr/lib32/libclang*
  
    install -m755 -d "${pkgdir}/usr/include/llvm/Config"
    mv "${pkgdir}/config.h" "${pkgdir}/usr/include/llvm/Config/config-32.h"
    mv "${pkgdir}/llvm-config.h" "${pkgdir}/usr/include/llvm/Config/llvm-config-32.h"

    install -m755 -d "${pkgdir}/usr/bin"
    mv "${pkgdir}/usr/lib32/llvm-config" "${pkgdir}/usr/bin/llvm-config32"

    install -Dm644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_lib32-llvm-libs-svn() {
    pkgdesc="Low Level Virtual Machine (runtime library) (32-bit)"
    depends=('lib32-libffi' 'lib32-zlib' 'lib32-gcc-libs')
    provides=('lib32-llvm-libs')
    replaces=('lib32-llvm-libs')
    conflicts=('lib32-llvm-libs')

    install -m755 -d "${pkgdir}"/usr/lib32/

    mv "${srcdir}"/libLLVM-*.so "${pkgdir}/usr/lib32/"

    for _shlib in "${pkgdir}"/usr/lib32/*.so
    do
      test -L "${_shlib}" && ln -sf $(basename $(readlink ${_shlib})) ${_shlib}
    done

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_lib32-clang-svn() {
    pkgdesc="C language family frontend for LLVM"
    url="http://clang.llvm.org/"
    depends=("lib32-llvm-svn=$pkgver-$pkgrel" 'clang' 'gcc-multilib')
    provides=('lib32-clang')
    replaces=('lib32-clang')
    conflicts=('lib32-clang')

    cd "${srcdir}/${_pkgname}/tools/clang"

    make DESTDIR="${pkgdir}" install

    mv "${pkgdir}"/usr/lib/* "${pkgdir}/usr/lib32/"
    rm -rf "${pkgdir}"/usr/{bin,include,lib,share}
  
    # Fix permissions of static libs
    chmod -x "${pkgdir}"/usr/lib32/*.a

    install -Dm644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
