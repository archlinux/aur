# Maintainer: R. Liang <ricardoliang@gmail.com>
# Based on https://aur.archlinux.org/packages/llvm-svn

pkgname='clangd-svn'
pkgver=6.0.0svn_r312537
pkgrel=1
pkgdesc='Standalone Clangd daemon - SVN version.'
arch=('i686' 'x86_64')
url='https://clang.llvm.org/extra/clangd.html'
license=('custom:University of Illinois')
depends=()
makedepends=("cmake" "libffi" "subversion")
provides=("clangd")
conflicts=("clangd" "clang-tools-extra-svn" "clang-tools-extra>=5.0.0")

options=('staticlibs')

source=(
    "llvm::svn+https://llvm.org/svn/llvm-project/llvm/trunk"
    "clang::svn+https://llvm.org/svn/llvm-project/cfe/trunk"
    "clang-tools-extra::svn+https://llvm.org/svn/llvm-project/clang-tools-extra/trunk"
)

sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

# Install the license files for a package
# Arguments: source_directory_to_install_from
# Notes: We prune some directories that are inserted into the tree in prepare() 
#        in order to eliminate possible duplicates. We also use NULL-terminated
#        strings, just in case we have paths including spaces. Finally, we opt
#        for a flat directory structure, so all license files in subdirectories
#        get their names from the relative path with '/'s replaced by dashes.
#        Not the most elegant solution, but should be working well enough.
_install_licenses() {
    find "${1}" \
        \( \
            -path "${srcdir}/llvm/tools/clang" \
        \) -prune -o \
        \( \
            -iname 'license*' -o \
            -iname 'credits*' -o \
            -iname 'copyright*' \
        \) -printf '%P\0' \
        | while read -d $'\0' license_file; do
            install -D -m 0644 \
                "${1}/${license_file}" \
                "${pkgdir}/usr/share/licenses/${pkgname}/${license_file//\//-}"
        done
}

pkgver() {
    cd "${srcdir}/llvm"

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
    cd "${srcdir}/llvm"

    # Anything added here and packaged separately should be pruned in
    # _install_licenses() above.
    svn export --force "${srcdir}/clang" tools/clang
    svn export --force "${srcdir}/clang-tools-extra" tools/clang/tools/extra

    mkdir -p "${srcdir}/build"
}

build() {
    cd "${srcdir}/build"

    cmake -G 'Unix Makefiles' '../llvm'

    make clangd
}

package() {
    cd "${srcdir}/build"

    install -Dm755 bin/clangd ${pkgdir}/usr/bin/clangd

    _install_licenses "${srcdir}/clang-tools-extra"
}

# vim:set ts=4 sts=4 sw=4 et:
