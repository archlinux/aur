# Maintainer: Luchesar V. ILIEV <luchesar%2eiliev%40gmail%2ecom>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Anders Bergh <anders@archlinuxppc.org>
# Contributor: Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>

pkgbase=lib32-llvm-svn

pkgname=(
    'lib32-llvm-svn'
    'lib32-llvm-libs-svn'
    'lib32-clang-svn'
)
_pkgname='llvm'

pkgver=3.8.0svn_r246942
pkgrel=1

arch=('x86_64')
url='http://llvm.org/'
license=('custom:University of Illinois')

makedepends=(
    'cmake'
    'gcc-multilib'
    'lib32-libffi'
    'lib32-libxml2'
    'python2'
    'subversion'
)

# this is always the latest svn so debug info can be useful
options=('staticlibs' '!strip')

source=(
    "${_pkgname}::svn+http://llvm.org/svn/llvm-project/llvm/trunk"
    'clang::svn+http://llvm.org/svn/llvm-project/cfe/trunk'
    'compiler-rt::svn+http://llvm.org/svn/llvm-project/compiler-rt/trunk'
)

sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

#
# BEGIN INTERNAL VARIABLES AND FUNCTIONS
#

# Install the license file for a package
# Arguments: NONE
_install_license() {
    install -D -m 0644 "${srcdir}/${_pkgname}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

#
# END INTERNAL VARIABLES AND FUNCTIONS
#

pkgver() {
    cd "${srcdir}/${_pkgname}"

    # This will almost match the output of `llvm-config --version` when the
    # LLVM_APPEND_VC_REV cmake flag is turned on. The only difference is
    # dash being replaced with underscore because of Pacman requirements.
    echo $(sed -n '/^AC_INIT/s|^.*,\[\([[:digit:]\.]\+svn\)\],.*$|\1|p' \
        autoconf/configure.ac)_r$(svnversion | tr -d [A-z])
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    svn export --force "${srcdir}/clang" tools/clang
    svn export --force "${srcdir}/compiler-rt" projects/compiler-rt

    mkdir -p "${srcdir}/build"
}

build() {
    cd "${srcdir}/build"

    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    # LLVM_BUILD_LLVM_DYLIB: Build the dynamic runtime libraries (e.g. libLLVM.so).
    # LLVM_DYLIB_EXPORT_ALL: Export all symbols in the dynamic libs, not just the C API.
    # LLVM_LINK_LLVM_DYLIB:  Link our own tools against the libLLVM dynamic library, too.
    # LLVM_BINUTILS_INCDIR:  Set to binutils' plugin-api.h location in order to build LLVMgold.
    # LLVM_TARGET_ARCH:      Theoretically, LLVM_BUILD_32_BITS should be used instead, which
    #                        would also make CMAKE_C{,XX}_FLAGS redundant, but that option
    #                        makes linking fail, because of incompatible architectures.
    cmake -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DLLVM_LIBDIR_SUFFIX:STRING=32 \
        -DCMAKE_C_FLAGS:STRING=-m32 \
        -DCMAKE_CXX_FLAGS:STRING=-m32 \
        -DLLVM_APPEND_VC_REV:BOOL=ON \
        -DLLVM_ENABLE_RTTI:BOOL=ON \
        -DLLVM_TARGET_ARCH:STRING=i386 \
        -DLLVM_ENABLE_FFI:BOOL=ON \
        -DFFI_INCLUDE_DIR:PATH="$(pkg-config --variable=includedir libffi)" \
        -DFFI_LIBRARY_DIR:PATH="$(pkg-config --variable=libdir libffi)" \
        -DLLVM_BUILD_LLVM_DYLIB:BOOL=ON \
        -DLLVM_DYLIB_EXPORT_ALL:BOOL=ON \
        -DLLVM_LINK_LLVM_DYLIB:BOOL=ON \
        -DLLVM_BINUTILS_INCDIR:PATH=/usr/include \
        "../${_pkgname}"
 
    # Must run this target independently, or else docs/cmake_install.cmake will fail.
    #
    # NOTICE: We don't need the documentation for the multilib package, but running
    # this target is still required if ocaml-{ctypes,findlib} happen to be installed.
    # While it's always a good idea to build the packages in a clean chroot, let's be
    # a bit more user friendly (and reduce the number of complaints).
    [[ $(pacman -Qq ocaml-{ctypes,findlib} 2>/dev/null | wc -l) -eq 2 ]] && make ocaml_doc

    make
}

package_lib32-llvm-svn() {
    pkgdesc='The LLVM Compiler Infrastructure (32-bit)'
    depends=(
        "lib32-llvm-libs-svn=${pkgver}-${pkgrel}"
        'llvm-svn'
    )
    provides=('lib32-llvm')
    replaces=('lib32-llvm')
    conflicts=('lib32-llvm')

    cd "${srcdir}/build"

    # Exclude the clang directory, since it'll be installed in a separate package
    sed -i \
        "s|^\([[:blank:]]*include(\"${srcdir}/build/tools/clang/cmake_install.cmake\")\)$|#\1|" \
        tools/cmake_install.cmake

    make DESTDIR="${pkgdir}" install

    # The runtime libraries get installed in llvm-libs-svn
    rm -f "${pkgdir}"/usr/lib32/lib{LLVM,LTO}.so{,.*}
    mv -f "${pkgdir}"/usr/lib32/{BugpointPasses,LLVMgold}.so "${srcdir}/"

    # Clang libraries go to a separate package
    rm -rf "${srcdir}/clang"
    mv "${pkgdir}/usr/lib32/clang" "${srcdir}/clang"

    # Get rid of example Hello transformation
    rm -f "${pkgdir}"/usr/lib32/*LLVMHello.*

    # Remove all bits that we don't need in multilib
    # Note that `find` will always fail because of the non-empty directories
    echo 'NOTE: The errors "find: cannot delete ... Directory not empty"'
    echo '      that immediately follow are harmless and safe to ignore.'
    find "${pkgdir}/usr/" \
        -not -path "${pkgdir}/usr/bin/llvm-config" \
        -not -path "${pkgdir}/usr/include/llvm/Config/llvm-config.h" \
        -not -path "${pkgdir}/usr/lib32/*" \
        -delete || true

    # Fix names for multilib
    mv "${pkgdir}"/usr/bin/llvm-config{,32}
    mv "${pkgdir}"/usr/include/llvm/Config/llvm-config{,-32}.h

    _install_license
}

package_lib32-llvm-libs-svn() {
    pkgdesc='The LLVM Compiler Infrastructure (runtime libraries, 32-bit)'
    depends=(
        'lib32-gcc-libs'
        'lib32-libffi'
        'lib32-ncurses'
        'lib32-zlib'
    )
    provides=('lib32-llvm-libs')
    replaces=('lib32-llvm-libs')
    conflicts=('lib32-llvm-libs')

    cd "${srcdir}/build"

    make DESTDIR="${pkgdir}" install-{LLVM,LTO}

    # Moved from the llvm-svn package here
    mv "${srcdir}"/{BugpointPasses,LLVMgold}.so "${pkgdir}/usr/lib32/"

    # Ref: http://llvm.org/docs/GoldPlugin.html
    install -m755 -d "${pkgdir}/usr/lib32/bfd-plugins"
    ln -s {/usr/lib32,"${pkgdir}/usr/lib32/bfd-plugins"}/LLVMgold.so

    # Must have a symlink that corresponds to the output of `llvm-config --version`.
    # Without it, some builds, e.g. Mesa, might fail for "lack of shared libraries".
    for _shlib in lib{LLVM,LTO} ; do
        # libLLVM.so.3.8.0svn-r123456
        ln -s "${_shlib}.so.$(echo ${pkgver} | cut -d _ -f 1)" \
            "${pkgdir}/usr/lib32/${_shlib}.so.$(echo ${pkgver} | tr _ -)"
        # libLLVM-3.8.0svn-r123456.so
        ln -s "${_shlib}.so.$(echo ${pkgver} | cut -d _ -f 1)" \
            "${pkgdir}/usr/lib32/${_shlib}-$(echo ${pkgver} | tr _ -).so"
    done

    _install_license
}

package_lib32-clang-svn() {
    pkgdesc='C language family frontend for LLVM (32-bit)'
    url='http://clang.llvm.org/'
    depends=(
        'clang'
        "lib32-llvm-svn=${pkgver}-${pkgrel}"
    )
    provides=('lib32-clang')
    replaces=('lib32-clang')
    conflicts=('lib32-clang')

    cd "${srcdir}/build/tools/clang"

    make DESTDIR="${pkgdir}" install

    # Remove all bits that we don't need in multilib
    rm -rf "${pkgdir}"/usr/{bin,include,share/clang}

    _install_license
}

# vim:set ts=4 sts=4 sw=4 et:
