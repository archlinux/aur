# This PKGBUILD build trunk version of clangd, and may apply some non-standard patches
#
# Applying patches controls via enviroment variables:
#
# Select branch to build
# CLANGD_BRANCH:
#   'main' - trunk (default value)
#   'release/17.x' - LLVM17
#   'release/16.x' - LLVM16
#   'release/15.x' - LLVM15 (like curently system version)
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
#
# Show offset of virtual methods
# CLANGD_HOVERVIRTOFF:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Show layout hover info everyhere
# CLANGD_HOVERLAYOUTEVERYHERE:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Hide definition from hover info for functions and variables
# CLANGD_HOVERNODEFS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Show argument names for function pointer struct (PR: 69011)
# CLANGD_HOVERPTRFN:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Resolve the dependent type from its single instantiation (PR: 71279)
# CLANGD_RESOLVEDEPTYPE:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Increase minimal limit for BlockEnd inlay-hints to 10 lines (default is 2)
# CLANGD_INLAYHINTSBLOCKEND:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Resolve includes in incomplete headers
# Limitations: AST for source must be loaded before open incomplete header
# CLANGD_RESOLVEINCHEADERS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Add way to remove files from CDB via LSP
# No need in many cases. Useful only in multi project workspaces with patched client https://github.com/clangd/vscode-clangd/pull/487
# CLANGD_LSPREMOVEFROMCDB:
#   'n' - do not apply this patch
#   'y' - apply this patch


: ${CLANGD_BRANCH:=main}
: ${CLANGD_DEFAULT_PATCH_STATE:=n}
: ${CLANGD_DOXYGEN:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_RESOLVEFWDPARAMS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_CODELENS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_POSTFIXCOMPLETION:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_EXTRACTFUNC:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_INLAYHINTSPADS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERINHEX:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERBITFIELDSMASK:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERVIRTOFF:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERLAYOUTEVERYHERE:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERNODEFS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERPTRFN:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_RESOLVEDEPTYPE:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_INLAYHINTSBLOCKEND:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_RESOLVEINCHEADERS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_LSPREMOVEFROMCDB:=$CLANGD_DEFAULT_PATCH_STATE}

pkgname=clangd-opt
pkgver=17.0.0.r19.g4b414e52ac10
pkgrel=38
pkgdesc='Trunk version of standalone clangd binary, with custom patches (look AUR page or PKGBUILD comments)'
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'ninja' 'zlib' 'zstd' 'libffi' 'libedit' 'ncurses'
             'libxml2' 'python-setuptools' 'python-psutil' 'python-sphinx')
options=('!strip')
source=("git+https://github.com/llvm/llvm-project.git#branch=$CLANGD_BRANCH"
        'hover-doxygen.patch'
        'hover-doxygen-trunk.patch'
        'doxygen-extra-render-trunk.patch'
        'doxygen-more-fields.patch'
        'hover-resolve-forward-params.patch'
        'lsp-codelens.patch'
        'postfix-completion.patch' # release/17.x and older
        'postfix-completion-trunk.patch'
        'refactor-extract-function.patch'
        'inlay-hints-paddings.patch'
        'hover-hex-formats.patch'
        'hover-bit-fields-mask.patch'
        'hover-virt-offset.patch'
        'hover-layout-everyhere.patch'
        'hover-no-defs.patch'
        'hover-ptrfn-args.patch'
        'resolve-depend-type.patch'
        'inlay-hints-blockend-linelimit10.patch'
        'resolve-incomplete-header-includes.patch'
        'lsp-remove-files-from-cdb.patch')
sha256sums=('SKIP'
            '3f6eb5c99f5e6c13d1275f8adf3e4acfa4319ff5199cde4c610e0ceffc7ceca2'  # hover-doxygen
            '75b331257caa768c16687fd668ec2b8be62feb283892d601476c3e039f298a54'  # hover-doxygen-trunk
            '614dd012009facb502a7d44e07fc819aa95383c8917537c57968f76ba7881a94'  # doxygen-extra-render-trunk
            'b42d27929fcec3825711c13baf0c5a4ea0da33b8ff5e6f60c3c61d2f1f9525af'  # doxygen-more-fields
            '9e5dd128cedc8f37724d9c39c0f8f7efc826b0fd367f3a03c2564ff9f514ced7'  # hover-resolve-forward-params
            'faf5c8b2a5a345be59c33f5de591f39dd35b1a2b97ca067e21023e311610bc0d'  # lsp-codelens
            'd048d7a6db9fec3667d472a7aa559ceea2006366e805f0d633f85bc5b9a248bc'  # postfix-completion
            '221e6439df2ee1ca55f5925f9cc3133cb9fb5a256bdc68743e8d46747e7e85b7'  # postfix-completion-trunk
            'f719fb52edee98f54ba40786d2ecac6ef63f56797c8f52d4d7ce76a3825966eb'  # refactor-extract-function
            '2db1f319f850858ecebdcda1c1600d6dd523f171c5b019740298d43607d5fa00'  # inlay-hints-paddings
            'ba47bb7ac05487a5a083094247eaa369f89404924172a4af40147507b15b90aa'  # hover-hex-formats
            'e0c86d8cd1d1c4d68c07ed5843593a51607a268c39ccd76e7fe17bc168bf16f4'  # hover-bit-fields-mask
            '1b1ad88faa83b36dd68f63851a0fd6e07eed16595fcbffdc8a57b5c884f8a98c'  # hover-virt-offset
            '62e38f3074f39d51524b3d43aabb3991df97e43ea4a8c20e8073c479a41d1057'  # hover-layout-everyhere
            '94b328ea81eb615a90acf18a9a78733d77093deb12203683510fe4881bad95c6'  # hover-no-defs
            '24a8e0b207598798b91f030bcccf0a074f0ccd23885ea4e802a8bda1c05657e0'  # hover-ptrfn-args
            '6e1f9c9a01ac50be93537227fffe20816ae0d51243ca8836c39d99dec8dad51e'  # resolve-depend-type
            '3365392bf7d95a02e2fb22dffbba011a3fa1179543426a2558b9ac61a300a7a7'  # inlay-hints-blockend-linelimit10
            '991fac650864bbf16832a8c8a0689ee44ef2959a79c9b950ff6200cb4c51beff'  # resolve-incomplete-header-includes
            '459bc42c7366305e562fa710551de909b581aa2358ca739585a0477dd06ebd6d') # lsp-remove-files-from-cdb

pkgver() {
    cd llvm-project

    git describe --long --match llvmorg-\* | sed -r 's/llvmorg-([^-]*)-(init|rc[0-9]+)-(.*)/\1-r\3/;s/-/./g'
}

prepare() {
    mkdir -p build
    cd ${srcdir}/llvm-project

    # Hover patches
    if [ "$CLANGD_DOXYGEN" != "n" ]; then
        if [ "$CLANGD_BRANCH" = "main" ]; then
            patch -p1 -i ${srcdir}/hover-doxygen-trunk.patch
            patch -p1 -i ${srcdir}/doxygen-extra-render-trunk.patch
        else
        patch -p1 -i ${srcdir}/hover-doxygen.patch
        fi
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
    if [ "$CLANGD_HOVERVIRTOFF" != "n" ]; then
        patch -p1 -i ${srcdir}/hover-virt-offset.patch
    fi
    if [ "$CLANGD_HOVERLAYOUTEVERYHERE" != "n" ]; then
        patch -p1 -i ${srcdir}/hover-layout-everyhere.patch
    fi
    if [ "$CLANGD_HOVERNODEFS" != "n" ]; then
        patch -p1 -i ${srcdir}/hover-no-defs.patch
    fi
    if [ "$CLANGD_HOVERPTRFN" != "n" ]; then
        patch -p1 -i ${srcdir}/hover-ptrfn-args.patch
    fi

    # LSP patches
    if [ "$CLANGD_CODELENS" != "n" ]; then
        patch -p1 -i ${srcdir}/lsp-codelens.patch
    fi
    if [ "$CLANGD_LSPREMOVEFROMCDB" != "n" ]; then
        patch -p1 -i ${srcdir}/lsp-remove-files-from-cdb.patch
    fi

    # Code-completion patches
    if [ "$CLANGD_POSTFIXCOMPLETION" != "n" ]; then
        if [ "$CLANGD_BRANCH" = "main" ]; then
            patch -p1 -i ${srcdir}/postfix-completion-trunk.patch
        else
            patch -p1 -i ${srcdir}/postfix-completion.patch
        fi
    fi

    # Refactoring patches
    if [ "$CLANGD_EXTRACTFUNC" != "n" ]; then
        patch -p1 -i ${srcdir}/refactor-extract-function.patch
    fi

    # Inlay hints patches
    if [ "$CLANGD_INLAYHINTSPADS" != "n" ]; then
        patch -p1 -i ${srcdir}/inlay-hints-paddings.patch
    fi
    if [ "$CLANGD_INLAYHINTSBLOCKEND" != "n" ]; then
        if [ "$CLANGD_BRANCH" = "main" ]; then
            patch -p1 -i ${srcdir}/inlay-hints-blockend-linelimit10.patch
        else
            echo "Skip inlay-hints-blockend-linelimit10.patch (CLANGD_INLAYHINTSBLOCKEND)"
        fi
    fi

    # Resolve patches
    if [ "$CLANGD_RESOLVEDEPTYPE" != "n" ]; then
        patch -p1 -i ${srcdir}/resolve-depend-type.patch
    fi
    if [ "$CLANGD_RESOLVEINCHEADERS" != "n" ]; then
        patch -p1 -i ${srcdir}/resolve-incomplete-header-includes.patch
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

    cmake --install . --prefix "$pkgdir"/opt/clangd --component clangd
    # Install headers
    mkdir "$pkgdir"/opt/clangd/lib
    cp -r lib/clang "$pkgdir"/opt/clangd/lib/clang
}
