# This PKGBUILD build trunk version of clangd, and may apply some non-standard patches
#
# Applying patches controls via enviroment variables:
#
# Toggle all below patches
# CLANGD_DEFAULT_PATCH_STATE:
#   'n' - disable all patches
#   'y' - apply all patches
#
# Apply user patches from `~/.config/clangd`. patches must have extension `*.patch`
# NOTE: This variable ignores the `CLANGD_DEFAULT_PATCH_STATE` variable
# CLANGD_USER_PATCHES:
#   'n' - disable all patches
#   'y' - apply all patches (default)
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
# Add way to remove files from CDB via LSP
# No need in many cases. Useful only in multi project workspaces with patched client https://github.com/clangd/vscode-clangd/pull/487
# CLANGD_LSPREMOVEFROMCDB:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Add tweak for implementing abstract class (D94942)
# CLANGD_IMPL_ABSTRACT_CLASS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Inlay hints: Ignore evident types in deduced types
# CLANGD_INLAYHINTSIGNOREEVIDENT:
#   'n' - do not apply this patch
#   'y' - apply this patch

: ${CLANGD_DEFAULT_PATCH_STATE:=n}
: ${CLANGD_USER_PATCHES:=y}
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
: ${CLANGD_LSPREMOVEFROMCDB:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_IMPL_ABSTRACT_CLASS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_INLAYHINTSIGNOREEVIDENT:=$CLANGD_DEFAULT_PATCH_STATE}

pkgname=clangd-opt-git
pkgver=24.r9691.gc0c563526ba9
pkgrel=1
pkgdesc='Trunk version of standalone clangd binary, with custom patches (look AUR page or PKGBUILD comments)'
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url="https://llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
makedepends=('cmake' 'ninja' 'zlib' 'zstd' 'libffi' 'libedit' 'ncurses' 'patch'
    'libxml2' 'python-setuptools' 'python-psutil' 'python-sphinx' 'git')
depends=('gcc-libs' 'glibc' 'ncurses' 'zlib' 'zstd')
conflicts=('clangd-opt')
replaces=('clangd-opt')
provides=('clangd-opt')
options=('!strip' '!lto')
source=("git+https://github.com/llvm/llvm-project.git#branch=main"
    'hover-resolve-forward-params.patch'
    'lsp-codelens.patch'
    'postfix-completion-trunk.patch'
    'refactor-extract-function.patch'
    'inlay-hints-paddings.patch'
    'hover-hex-formats.patch'
    'hover-bit-fields-mask.patch'
    'hover-virt-offset.patch'
    'hover-layout-everyhere.patch'
    'hover-no-defs.patch'
    'lsp-remove-files-from-cdb.patch'
    'implement-abstract-class.patch'
    'inlay-hints-hide-deduced-types-ignore-evident.patch')
sha256sums=('SKIP'
    'eb3b9c9f3cb275ed492b9171976ee2cda55ba82df4149fe87c9ce51a30b35dda'  # hover-resolve-forward-params
    '786d9ff8c84b3c3953915fb4d43d89fd7a8f8430260c145d66167f9200e0c656'  # lsp-codelens
    '3844041d9b831894e678dee5e5ca86bec7fa9935e4dabb19a119132a01302119'  # postfix-completion-trunk
    'bb89651954fc0f7748d2f6934f62ddd2d6181a7a171dc8dd3ea5052f1db9650b'  # refactor-extract-function
    'dd115f96963d0577db1ff4447de521cc697621b93607cfe225cd5416d40ca5f6'  # inlay-hints-paddings
    '641c629f7fdd59c62929756e0e6a41113bf5db4ae29e3c1d2a914c3fc80dc0f7'  # hover-hex-formats
    'ef1721f12a11c26c5e09d9ee8cda01078a2bcc8cd0b55627ccedb3e21323c9ca'  # hover-bit-fields-mask
    'eef2aba140b76247256fb65b5db535dfd749f2ccf7ef4ced81e585b4fecdee7f'  # hover-virt-offset
    '683caf4bd56ce906d41f49bf911364a0f6c2f083307d1eb57666982873741d6a'  # hover-layout-everyhere
    'b9227c1807decf6cb7916b6fc90f141c63e49a5d8577636700e4a08c8d0ca142'  # hover-no-defs
    'b21ee165ffb05dc4b984288ea8ad3be4cbea580d49daaec8e54741c60b2532fc'  # lsp-remove-files-from-cdb
    '2af83e1fd4478470ab9b403ec2b0e9593fcce6558cb0a2e4cf07f36450b1f437'  # implement-abstract-class
    'ee52826da959385d92881c1df8c20df6753462d08f1f8e978a172d9533fb9231') # inlay-hints-hide-deduced-types-ignore-evident

pkgver() {
    cd llvm-project

    git describe --long --match llvmorg-\* | sed -r 's/llvmorg-([^-]*)-(init|rc[0-9]+)-(.*)/\1-r\3/;s/-/./g'
}

apply_patch() {
    echo -e "\033[0;34m  -> \033[1;37mApplying patch: $1\033[0m"
    patch -p1 -i ${srcdir}/$1.patch
}

prepare() {
    mkdir -p build
    cd ${srcdir}/llvm-project

    # Hover patches
    if [ "$CLANGD_RESOLVEFWDPARAMS" != "n" ]; then
        apply_patch hover-resolve-forward-params
    fi
    if [ "$CLANGD_HOVERBITFIELDSMASK" != "n" ]; then
        apply_patch hover-bit-fields-mask
    fi
    if [ "$CLANGD_HOVERINHEX" != "n" ]; then
        apply_patch hover-hex-formats
    fi
    if [ "$CLANGD_HOVERVIRTOFF" != "n" ]; then
        apply_patch hover-virt-offset
    fi
    if [ "$CLANGD_HOVERLAYOUTEVERYHERE" != "n" ]; then
        apply_patch hover-layout-everyhere
    fi
    if [ "$CLANGD_HOVERNODEFS" != "n" ]; then
        apply_patch hover-no-defs
    fi

    # LSP patches
    if [ "$CLANGD_CODELENS" != "n" ]; then
        apply_patch lsp-codelens
    fi
    if [ "$CLANGD_LSPREMOVEFROMCDB" != "n" ]; then
        apply_patch lsp-remove-files-from-cdb
    fi

    # Code-completion patches
    if [ "$CLANGD_POSTFIXCOMPLETION" != "n" ]; then
        apply_patch postfix-completion-trunk
    fi

    # Refactoring patches
    if [ "$CLANGD_EXTRACTFUNC" != "n" ]; then
        apply_patch refactor-extract-function
    fi
    if [ "$CLANGD_IMPL_ABSTRACT_CLASS" != "n" ]; then
        apply_patch implement-abstract-class
    fi

    # Inlay hints patches
    if [ "$CLANGD_INLAYHINTSPADS" != "n" ]; then
        apply_patch inlay-hints-paddings
    fi
    if [ "$CLANGD_INLAYHINTSIGNOREEVIDENT" != "n" ]; then
        apply_patch inlay-hints-hide-deduced-types-ignore-evident
    fi

    # User patches
    if [ "$CLANGD_USER_PATCHES" != "n" ]; then
        config_path=${XDG_CONFIG_HOME:-"$HOME/.config"}/clangd
        if [[ -d "$config_path" ]]; then
            echo -e "\e[1;32mSearch user pathces in \e[1;37m'${config_path}'\033[0m"
            patches=$(ls -1 "$config_path"/*.patch 2>/dev/null || true)

            if [[ -n $patches ]]; then
                for patch in ${patches[@]}; do
                    echo -e "\033[0;34m  -> \033[1;37mApplying user patch: $(basename ${patch%.patch})\033[0m"
                    patch -p1 -i "$patch"
                done
            else
                echo -e "\e[1;33mUser patches not found!\033[0m"
            fi
        fi
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

    cmake --install . --prefix "$pkgdir"/opt/clangd --component clangd --strip
    # Install headers
    mkdir "$pkgdir"/opt/clangd/lib
    cp -r lib/clang "$pkgdir"/opt/clangd/lib/clang
}
