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
# Show mask for bit fields (require CLANGD_HOVERBITFIELDS)
# CLANGD_HOVERBITFIELDSMASK:
#   'n' - do not apply this patch
#   'y' - apply this patch


: ${CLANGD_DEFAULT_PATCH_STATE:=n}
: ${CLANGD_DOXYGEN:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_RESOLVEFWDPARAMS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_CODELENS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_POSTFIXCOMPLETION:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_EXTRACTFUNC:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_INLAYHINTSPADS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERINHEX:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERBITFIELDSMASK:=$CLANGD_DEFAULT_PATCH_STATE}

pkgname=clangd-opt
pkgver=17.r16019.g1fce8df53a30
pkgrel=1
pkgdesc='Trunk version of standalone clangd binary, with custom patches (look AUR page or PKGBUILD comments)'
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'ninja' 'zlib' 'zstd' 'libffi' 'libedit' 'ncurses'
             'libxml2' 'python-setuptools' 'python-psutil' 'python-sphinx')
options=('staticlibs' '!lto') # Getting thousands of test failures with LTO
source=('git+https://github.com/llvm/llvm-project.git'
        'hover-doxygen.patch'
        'doxygen-more-fields.patch'
        'hover-resolve-forward-params.patch'
        'lsp-codelens.patch'
        'postfix-completion.patch'
        'refactor-extract-function.patch'
        'inlay-hints-paddings.patch'
        'hover-hex-formats.patch'
        'hover-bit-fields-mask.patch')
sha256sums=('SKIP'
            '5717119e9370b894ce3155d4222d87652a2d67cdf6a83c0e1f8fc075da809cad'  # hover-doxygen
            '8e9aa2930380bbdcf4ae48ba309c558db9ccdbbb90f92d247a58ac9c758c87aa'  # doxygen-more-fields
            '9e5dd128cedc8f37724d9c39c0f8f7efc826b0fd367f3a03c2564ff9f514ced7'  # hover-resolve-forward-params
            '35153f4775647bd7172a460de595f8b1cab4db0ae85283cd1119864f5328ea48'  # lsp-codelens
            '4152daf9a48c6d6745815571de994d071ed1352fc3122944b593559a603a91a6'  # postfix-completion
            'f719fb52edee98f54ba40786d2ecac6ef63f56797c8f52d4d7ce76a3825966eb'  # refactor-extract-function
            '2db1f319f850858ecebdcda1c1600d6dd523f171c5b019740298d43607d5fa00'  # inlay-hints-paddings
            'ba47bb7ac05487a5a083094247eaa369f89404924172a4af40147507b15b90aa'  # hover-hex-formats
            'a02dbc05ab1ca824b5487aa4df360be403f28c90564eddb3a974c81761f1e8ff') # hover-bit-fields-mask

pkgver() {
    cd llvm-project

    git describe --long --match llvmorg-* | sed -r 's/llvmorg-([^-]*)-init-(.*)/\1-r\2/;s/-/./g'
}

prepare() {
    mkdir -p build
    cd ${srcdir}/llvm-project

    # Hover patches
    if [ "$CLANGD_DOXYGEN" != "n" ]; then
        patch -p1 -i ${srcdir}/hover-doxygen.patch
        patch -p1 -i ${srcdir}/doxygen-more-fields.patch
    fi
    if [ "$CLANGD_RESOLVEFWDPARAMS" != "n" ]; then
        patch -p1 -i ${srcdir}/hover-resolve-forward-params.patch
    fi
    if [ "$CLANGD_HOVERBITFIELDSMASK" != "n" ]; then
        patch -p1 -i ${srcdir}/hover-bit-fields-mask.patch
    fi
    if [ "$CLANGD_HOVERINHEX" != "n" ]; then
        patch -p1 -i ${srcdir}/hover-hex-formats.patch
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
