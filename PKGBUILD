# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
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

pkgname=llvm-git
_pkgname='llvm'
pkgver=9.0.0_r313653.5182302a376
pkgrel=1
arch=('i686' 'x86_64')
url='https://llvm.org/'
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=(
  'cmake'
  'doxygen'
  'gcc'
  'gcc-libs'
  'git'
  'graphviz'
  'jsoncpp'
  'libelf'
  'libevent'
  'libffi'
  'mathjax'
  'ncurses'
  'ninja'
  'python-recommonmark'
  'python-requests'
  'python-sphinx'
  'swig'
  'valgrind')
depends=(
  'libedit'
  'libxml2'
  'python')
depends_x86_64=('lib32-gcc-libs')
pkgdesc="Collection of modular and reusable compiler and toolchain technologies (git)"
optdepends=('openmp: OpenMP support in clang with -fopenmp')
provides=(
    'clang'
    "clang=$pkgver"
    "clang-analyzer=$pkgver"
    'clang-analyzer-polly-svn'
    "clang-analyzer-svn"
    'clang-compiler-rt'
    'clang-compiler-rt-polly-svn'
    'clang-compiler-rt-svn'
    'clang-polly-svn'
    'clang-svn'
    "clang-tools-extra=$pkgver"
    'clang-tools-extra-polly-svn'
    "clang-tools-extra-svn"
    'clang-tools-extra-svn'
    'compiler-rt'
    'compiler-rt-svn'
    'lld'
    'lldb'
    'lldb-polly-svn'
    'lldb-svn'
    'lld-polly-svn'
    'lld-svn'
    'llvm'
    'llvm-libs'
    'llvm-libs-polly-svn'
    'llvm-libs-svn'
    'llvm-polly-svn'
    'llvm-svn')
conflicts=(
    'clang'
    'clang-analyzer'
    'clang-compiler-rt'
    'clang-tools-extra'
    'compiler-rt'
    'lld'
    'lldb'
    'llvm'
    'llvm-libs')
replaces=(
    'clang-analyzer'
    'clang-analyzer-svn'
    'clang-compiler-rt'
    'clang-compiler-rt-svn'
    'clang-tools-extra'
    'clang-tools-extra-svn')
# this is always the latest git so debug info can be useful
options=('staticlibs' '!strip')
source=("${_pkgname}::git+https://github.com/llvm/llvm-project.git"
        'llvm-config.h')
sha256sums=('SKIP'
            '844408b3cb84b4757e3c096dc89e24694f852bfc11a9cec295bc888748f4e10d')
pkgver() {
    cd "${srcdir}/${_pkgname}/${_pkgname}"

    # This will almost match the output of `llvm-config --version` when the
    # LLVM_APPEND_VC_REV cmake flag is turned on. The only difference is
    # dash being replaced with underscore because of Pacman requirements.
    local _pkgver=$(awk -F 'MAJOR |MINOR |PATCH |SUFFIX |)' \
            'BEGIN { ORS="." ; i=0 } \
             /set\(LLVM_VERSION_/ { print $2 ; i++ ; if (i==2) ORS="" } \
             END { print "\n" }' \
             CMakeLists.txt)_r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
    echo "${_pkgver//svn}"
}

build() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    export PKG_CONFIG_PATH='/usr/lib/pkgconfig'

    cmake -G Ninja \
    -DLLVM_ENABLE_PROJECTS='clang;lldb;compiler-rt;lld' \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DLLVM_HOST_TRIPLE=$CHOST \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_INSTALL_UTILS=ON \
    -DLLVM_ENABLE_BINDINGS=OFF \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_ENABLE_FFI=ON \
    -DLLVM_BUILD_TESTS=ON \
    -DLLVM_BUILD_DOCS=ON \
    -DLLVM_ENABLE_SPHINX=ON \
    -DLLVM_ENABLE_DOXYGEN=OFF \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DSPHINX_WARNINGS_AS_ERRORS=OFF \
    -DLLDB_USE_SYSTEM_SIX=1 \
    -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
    -DLLVM_BINUTILS_INCDIR=/usr/include \
    -DPOLLY_ENABLE_GPGPU_CODEGEN=ON \
    -DLINK_POLLY_INTO_TOOLS=ON \
    "../${_pkgname}/${_pkgname}" \

  ninja all
}

package() {
  cd "${srcdir}/build"

  DESTDIR="$pkgdir" ninja install

  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stub is taken from Fedora
    mv "$pkgdir/usr/include/llvm/Config/llvm-config"{,-64}.h
    cp "$srcdir/llvm-config.h" "$pkgdir/usr/include/llvm/Config/llvm-config.h"
  fi

  _install_licenses "${srcdir}/clang"
  _install_licenses "${srcdir}/compiler-rt"
  _install_licenses "${srcdir}/lld"
  _install_licenses "${srcdir}/lldb"
  _install_licenses "${srcdir}/llvm"

  python3 -m compileall "$pkgdir"
  python3 -O -m compileall "$pkgdir"
  python3 -OO -m compileall "$pkgdir"

  rm -rf "$pkgdir/usr/libexec"
  sed -i 's|libexec|lib/clang|' "$pkgdir/usr/bin/scan-build"
}

#
# BEGIN INTERNAL VARIABLES AND FUNCTIONS
#

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
            -path "${srcdir}/${_pkgname}/tools/lld" -o \
            -path "${srcdir}/${_pkgname}/tools/clang" -o \
            -path "${srcdir}/${_pkgname}/tools/lldb" -o \
            -path "${srcdir}/${_pkgname}/projects/compiler-rt" \
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

#
# END INTERNAL VARIABLES AND FUNCTIONS
#
