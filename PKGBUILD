# This PKGBUILD build trunk version of clangd, and may apply some non-standard patches
#
# Applying patches controls via enviroment variables:
#
# Toggle all below patches
# CLANGD_DEFAULT_PATCH_STATE:
#   'n' - disable all patches
#   'y' - apply all patches
#
# Show Doxygen comments in hover (D134130)
# CLANGD_DOXYGEN:
#   'n' - do not apply this patch
#   'y' - apply this patch
#   'noast' - apply this patch with parse comments without AST
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
#
# Add inlay hints for scructure paddings
# CLANGD_INLAYHINTSPADS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Add hex formats in `size` and `offset` fileds on hover, when values more than 10
# CLANGD_HOVERINHEX:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Show offset, size and padding for bit fields on hover
# CLANGD_HOVERBITFIELDS:
#   'n' - do not apply this patch
#   'y' - apply this patch


: ${CLANGD_DEFAULT_PATCH_STATE:=n}
: ${CLANGD_DOXYGEN:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_MACROEVAL:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_RESOLVEFWDPARAMS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_CODELENS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_POSTFIXCOMPLETION:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_EXTRACTFUNC:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_INLAYHINTSPADS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERINHEX:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERBITFIELDS:=$CLANGD_DEFAULT_PATCH_STATE}

pkgname=clangd-opt
pkgver=17.r12037.g6b50e87f21e1
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
        'hover-resolve-forward-params.patch'
        'lsp-codelens.patch'
        'postfix-completion.patch'
        'refactor-extract-function.patch'
        'inlay-hints-paddings.patch'
        'hover-hex-formats.patch'
        'hover-bit-fields.patch')
sha256sums=('SKIP'
            '843bf80065da5929276e070a5e66cd2a8391090bba2ac2f9c48be0a9bb35d315'  # hover-doxygen-noast
            'b00ed1cef0ee45f7db596d268bb1e0af6da986590830ee33c7da7596a3c32fc0'  # hover-doxygen
            '9e5dd128cedc8f37724d9c39c0f8f7efc826b0fd367f3a03c2564ff9f514ced7'  # hover-resolve-forward-params
            '9bb8d1d27e3b5a184af71a5aad310da3971e77279f65d7bf804d619ce907280a'  # lsp-codelens
            '9509b620b3c1d80985fd27029f4922ee65c6479921bb92117eb1b88f560f180b'  # postfix-completion
            'f719fb52edee98f54ba40786d2ecac6ef63f56797c8f52d4d7ce76a3825966eb'  # refactor-extract-function
            '2db1f319f850858ecebdcda1c1600d6dd523f171c5b019740298d43607d5fa00'  # inlay-hints-paddings
            '346483b0d5823fba409785c2df471ca8a659112d630ee66e53b1a3e36e46e981'  # hover-hex-formats
            '04bfc737e6e5f362571a36f984637ea69946b08200904a285fa89b9bc6678fc0') # hover-bit-fields

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
    if [ "$CLANGD_RESOLVEFWDPARAMS" != "n" ]; then
        patch -p1 -i ${srcdir}/hover-resolve-forward-params.patch
    fi
    if [ "$CLANGD_HOVERINHEX" != "n" ]; then
        patch -p1 -i ${srcdir}/hover-hex-formats.patch
    fi
    if [ "$CLANGD_HOVERBITFIELDS" != "n" ]; then
        patch -p1 -i ${srcdir}/hover-bit-fields.patch
    fi
    
    # LSP patches
    if [ "$CLANGD_CODELENS" != "n" ]; then
        patch -p1 -i ${srcdir}/lsp-codelens.patch
    fi
    
    # Code-completion patches
    if [ "$CLANGD_POSTFIXCOMPLETION" != "n" ]; then
        patch -p1 -i ${srcdir}/postfix-completion.patch
    fi
    
    # Refactoring patches
    if [ "$CLANGD_EXTRACTFUNC" != "n" ]; then
        patch -p1 -i ${srcdir}/refactor-extract-function.patch
    fi
    
    # Inlay hints patches
    if [ "$CLANGD_INLAYHINTSPADS" != "n" ]; then
        patch -p1 -i ${srcdir}/inlay-hints-paddings.patch
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
