# This PKGBUILD build trunk version of clangd, and may apply some non-standard patches
#
# Applying patches controls via enviroment variables:
#
# Show Doxygen comments in hover (D134130)
# CLANGD_DOXYGEN:
#   'n' - do not apply this patch
#   'y' - apply this patch
#   'noast' - apply this patch with parse comments without AST
#
# Support macro evaluation on hover (D148457)
# CLANGD_MACROEVAL:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Resolve forwarded parameters in hover (D130265)
# CLANGD_RESOLVEFWDPARAMS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Implement textDocument/codeLens (D91930)
# It's also required patched `vscode-clangd` extension - https://github.com/lightmelodies/vscode-clangd/commit/46266b4adb106b5080f5c771099c777806a16adc
# CLANGD_CODELENS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Contextual postfix completions (D125224)
# Demo: https://asciinema.org/a/rxyoicX44ya2jLDpdbNj3rVcC
# CLANGD_POSTFIXCOMPLETION:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Extract Function: add hoisting support (D138499)
# CLANGD_EXTRACTFUNC:
#   'n' - do not apply this patch
#   'y' - apply this patch


: ${CLANGD_DOXYGEN:=n}
: ${CLANGD_MACROEVAL:=n}
: ${CLANGD_RESOLVEFWDPARAMS:=n}
: ${CLANGD_CODELENS:=n}
: ${CLANGD_POSTFIXCOMPLETION:=n}
: ${CLANGD_EXTRACTFUNC:=n}

pkgname=clangd-opt
pkgver=17.r9008.g24a8251b0409
pkgrel=1
pkgdesc='Trunk version of standalone clangd binary, with custom patches (look AUR page or PKGBUILD comments)'
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'ninja' 'zlib' 'zstd' 'libffi' 'libedit' 'ncurses'
             'libxml2' 'python-setuptools' 'python-psutil' 'python-sphinx')
options=('staticlibs' '!lto') # Getting thousands of test failures with LTO
source=('git+https://github.com/llvm/llvm-project.git'
        'hover-doxygen-noast.patch'
        'hover-doxygen.patch'
        'hover-macro-eval.patch'
        'hover-resolve-forward-params.patch'
        'lsp-codelens.patch'
        'postfix-completion.patch'
        'refactor-extract-function.patch')
sha256sums=('SKIP'
            '843bf80065da5929276e070a5e66cd2a8391090bba2ac2f9c48be0a9bb35d315'
            'b00ed1cef0ee45f7db596d268bb1e0af6da986590830ee33c7da7596a3c32fc0'
            'bc3f392c87560c4e42d317e28d3524f8a6052efa31b6091186139d14b2a8368d'
            '9e5dd128cedc8f37724d9c39c0f8f7efc826b0fd367f3a03c2564ff9f514ced7'
            '9bb8d1d27e3b5a184af71a5aad310da3971e77279f65d7bf804d619ce907280a'
            '01c5ec4dad2981d39f443312584bf1c81d0f1e10db5b86e5b4f5f466ba229a00'
            'f719fb52edee98f54ba40786d2ecac6ef63f56797c8f52d4d7ce76a3825966eb')

pkgver() {
    cd llvm-project

    git describe --long --match llvmorg-* | sed -r 's/llvmorg-([^-]*)-init-(.*)/\1-r\2/;s/-/./g'
}

prepare() {
    mkdir -p build
    cd ${srcdir}/llvm-project
    
    # Hover patches
    if [ "$CLANGD_DOXYGEN" != "n" ]; then
        if [ "$CLANGD_DOXYGEN" = "noast" ]; then
            patch -p1 -i ${srcdir}/hover-doxygen-noast.patch
        else
            patch -p1 -i ${srcdir}/hover-doxygen.patch
        fi
    fi
    if [ "$CLANGD_MACROEVAL" != "n" ]; then
        patch -p1 -i ${srcdir}/hover-macro-eval.patch
    fi
    if [ "$CLANGD_RESOLVEFWDPARAMS" != "n" ]; then
        patch -p1 -i ${srcdir}/hover-resolve-forward-params.patch
    fi
    
    # LSP patches
    if [ "$CLANGD_CODELENS" != "n" ]; then
        patch -p1 -i ${srcdir}/lsp-codelens.patch
    fi
    
    # Code-completion patches
    if [ "$CLANGD_POSTFIXCOMPLETION" != "n" ]; then
        patch -p1 -i ${srcdir}/postfix-completion.patch
    fi
    
    # Code-completion patches
    if [ "$CLANGD_EXTRACTFUNC" != "n" ]; then
        patch -p1 -i ${srcdir}/refactor-extract-function.patch
    fi
}

build() {
    cd build
    
    cmake -B . -S "${srcdir}/llvm-project/llvm" \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/opt/clangd \
        -DCMAKE_BUILD_TYPE=Release \
        -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra"
    cmake --build . --target clangd
}

package() {
    cd build

    cmake --install . --prefix "$pkgdir"/opt/clangd --strip --component clangd
    # Install headers
    mkdir "$pkgdir"/opt/clangd/lib
    cp -r lib/clang "$pkgdir"/opt/clangd/lib/clang
}
