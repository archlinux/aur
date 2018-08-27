# Maintainer: mikezackles
# Contributor: Luchesar V. ILIEV <luchesar%2eiliev%40gmail%2ecom>
# Contributor: Anders Bergh <anders@archlinuxppc.org>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Hesiod (https://github.com/hesiod)
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>

pkgname=clang-trunk
_pkgname='llvm'
provides=(
    'llvm'
    'llvm-libs'
    'lld'
    'lldb'
    'libc++'
    'libc++abi'
    'libc++experimental'
    'clang'
    'clang-analyzer'
    'clang-compiler-rt'
    'clang-tools-extra'
    'templight'
)
conflicts=(
    'llvm'
    'llvm-libs'
    'lld'
    'lldb'
    'libc++'
    'libc++abi'
    'libc++experimental'
    'clang'
    'clang-analyzer'
    'clang-compiler-rt'
    'clang-tools-extra'
    'templight'
)
pkgdesc='A collection of LLVM-based C++ dev tools'

pkgver=8.0.0svn_r340760
pkgrel=1

arch=('i686' 'x86_64')
url='https://llvm.org/'
license=('custom:University of Illinois')

depends=(
    'python2-six' # for lldb
)
makedepends=(
    'cmake'
    'libedit'
    'libffi'
    'ninja'
    'python'
    'python2'
    'python-recommonmark'
    'python-requests'
    'python-sphinx'
    'subversion'
    'swig'
)

# this is always the latest svn so debug info can be useful
options=('staticlibs' '!strip')

source=(
    "${_pkgname}::svn+https://llvm.org/svn/llvm-project/llvm/trunk"
    'clang::svn+https://llvm.org/svn/llvm-project/cfe/trunk'
    'clang-tools-extra::svn+https://llvm.org/svn/llvm-project/clang-tools-extra/trunk'
    'compiler-rt::svn+https://llvm.org/svn/llvm-project/compiler-rt/trunk'
    'lld::svn+https://llvm.org/svn/llvm-project/lld/trunk'
    'lldb::svn+https://llvm.org/svn/llvm-project/lldb/trunk'
    'polly::svn+https://llvm.org/svn/llvm-project/polly/trunk'
    'libcxx::svn+https://llvm.org/svn/llvm-project/libcxx/trunk'
    'libcxxabi::svn+https://llvm.org/svn/llvm-project/libcxxabi/trunk'
    'templight::git+https://github.com/mikael-s-persson/templight'
    'templight.patch'
    'llvm-Config-llvm-config.h'
)

sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'dbc8086e8c2f05ddd4128fd3a0d39261eed19ffd0c9509a50ad656a8a5936c1f'
    '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48'
)

#
# BEGIN INTERNAL VARIABLES AND FUNCTIONS
#

pkgver() {
    cd "${srcdir}/${_pkgname}"

    # This will almost match the output of `llvm-config --version` when the
    # LLVM_APPEND_VC_REV cmake flag is turned on. The only difference is
    # dash being replaced with underscore because of Pacman requirements.
    echo $(awk -F 'MAJOR |MINOR |PATCH |SUFFIX |)' \
            'BEGIN { ORS="." ; i=0 } \
             /set\(LLVM_VERSION_/ { print $2 ; i++ ; if (i==2) ORS="" } \
             END { print "\n" }' \
        CMakeLists.txt)_r$(svnversion | tr -d [A-z])
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    # Anything added here and packaged separately should be pruned in _install_licenses() above.
    svn export --force "${srcdir}/clang" tools/clang
    svn export --force "${srcdir}/clang-tools-extra" tools/clang/tools/extra
    svn export --force "${srcdir}/compiler-rt" projects/compiler-rt
    svn export --force "${srcdir}/libcxx" projects/libcxx
    svn export --force "${srcdir}/libcxxabi" projects/libcxxabi
    svn export --force "${srcdir}/lld" tools/lld
    svn export --force "${srcdir}/lldb" tools/lldb
    svn export --force "${srcdir}/polly" tools/polly
    git clone "${srcdir}/templight" tools/clang/tools/templight
    echo "add_clang_subdirectory(templight)" >> tools/clang/tools/CMakeLists.txt

    cd "${srcdir}/${_pkgname}/tools/clang/tools/templight"
    git apply "${srcdir}/templight.patch"

    mkdir -p "${srcdir}/build"
}

build() {
    cd "${srcdir}/build"

    export PKG_CONFIG_PATH='/usr/lib/pkgconfig'

    # LLVM_BUILD_LLVM_DYLIB: Build the dynamic runtime libraries (e.g. libLLVM.so).
    # LLVM_LINK_LLVM_DYLIB:  Link our own tools against the libLLVM dynamic library, too.
    # LLVM_BINUTILS_INCDIR:  Set to binutils' plugin-api.h location in order to build LLVMgold.
    cmake -G 'Ninja' \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DLLVM_APPEND_VC_REV:BOOL=ON \
        -DLLVM_ENABLE_RTTI:BOOL=ON \
        -DLLVM_ENABLE_FFI:BOOL=ON \
        -DFFI_INCLUDE_DIR:PATH="$(pkg-config --variable=includedir libffi)" \
        -DFFI_LIBRARY_DIR:PATH="$(pkg-config --variable=libdir libffi)" \
        -DLLVM_BUILD_DOCS:BOOL=ON \
        -DLLVM_ENABLE_SPHINX:BOOL=ON \
        -DPOLLY_ENABLE_GPGPU_CODEGEN:BOOL=ON \
        -DLINK_POLLY_INTO_TOOLS:BOOL=ON \
        -DSPHINX_OUTPUT_HTML:BOOL=ON \
        -DSPHINX_OUTPUT_MAN:BOOL=ON \
        -DSPHINX_WARNINGS_AS_ERRORS:BOOL=OFF \
        -DLLVM_BUILD_LLVM_DYLIB:BOOL=ON \
        -DLLVM_LINK_LLVM_DYLIB:BOOL=ON \
        -DLLVM_BINUTILS_INCDIR:PATH=/usr/include \
        -DLIBCXX_ENABLE_EXPERIMENTAL_LIBRARY=On \
        "../${_pkgname}"

    ninja
}

check() {
    cd "${srcdir}/build"
    # Dirty fix for unittests failing because the shared lib is not in the library path.
    # Also, disable the LLVM tests on i686 as they seem to fail too often there.
    [[ "${CARCH}" == "i686" ]] || LD_LIBRARY_PATH="${srcdir}/build/lib" ninja check
    ninja check-clang
    ninja check-polly
}

package() {
    cd "${srcdir}/build"
    DESTDIR=${pkgdir} ninja install
    rm "${pkgdir}/usr/lib/python2.7/site-packages/six.py"
}

# vim:set ts=4 sts=4 sw=4 et:
