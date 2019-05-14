# Maintainer: Lone_Wolf <lonewolf@xs4all.nl>
# Contributor: yurikoles <root@yurikoles.com>
# Contributor: bearoso <bearoso@gmail.com>
# Contributor: Luchesar V. ILIEV <luchesar%2eiliev%40gmail%2ecom>
# Contributor: Anders Bergh <anders@archlinuxppc.org>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Hesiod (https://github.com/hesiod)
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>

pkgname=clang-minimal-git
pkgver=9.0.0_r316422.7c5c0c9fe59
pkgrel=1
pkgdesc="C language family frontend for LLVM"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('llvm-libs-minimal-git' 'gcc' 'lone_wolf-compiler-rt-git')
makedepends=('git' 'llvm-minimal-git' 'cmake' 'ninja' 'python-sphinx' 'llvm-libs')
optdepends=('openmp: OpenMP support in clang with -fopenmp'
            'python: for scan-view and git-clang-format'
            'llvm-libs: for LLVMgold support')
provides=(clang=$pkgver-$pkgrel lone_wolf-clang-git)
conflicts=('clang')
replaces=(lone_wolf-clang-git)
source=(llvm-project::git+https://github.com/llvm/llvm-project.git
        enable-SSP-and-PIE-by-default.patch)
md5sums=('SKIP'
         '5e9b3822e6b7de45f0ecb0ad71b3f7d3')
sha512sums=('SKIP'
            '2fdbae0b62d33411beaf191920ff280f83fa80fd505a71077671027f27ed8c61c5867de3e6ee6f26734c7605037e86796404212182f8ffa71f4af6ed2c316a40')

pkgver() {
    cd llvm-project/llvm

    # This will almost match the output of `llvm-config --version` when the
    # LLVM_APPEND_VC_REV cmake flag is turned on. The only difference is
    # dash being replaced with underscore because of Pacman requirements.
    local _pkgver=$(awk -F 'MAJOR |MINOR |PATCH |)' \
            'BEGIN { ORS="." ; i=0 } \
             /set\(LLVM_VERSION_/ { print $2 ; i++ ; if (i==2) ORS="" } \
             END { print "\n" }' \
             CMakeLists.txt)_r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
    echo "${_pkgver}"
}

prepare() {
    cd llvm-project
    # remove unneedede parts of sourcecode
    rm -rf compiler-rt debuginfo-tests libclc libcxx libcxxabi libunwind lld lldb llgo openmp parallel-libs polly pstl

    cd clang
    # clang doesn't support   -DLLVM_ENABLE_PROJECTS , have to move extra tools
    mv "$srcdir"/llvm-project/clang-tools-extra tools/extra
    sed -i "s/add_clang_executable/add_clang_tool/g" tools/extra/clangd/indexer/CMakeLists.txt
    
    patch -Np1 -i ../../enable-SSP-and-PIE-by-default.patch
}

build() {
    if [  -d _build ]; then
        rm -rf _build
    fi
    mkdir _build
    cd _build
    
    cmake "$srcdir"/llvm-project/clang/ -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DBUILD_SHARED_LIBS=ON \
        -DLLVM_LINK_LLVM_DYLIB=ON \
        -DLLVM_ENABLE_RTTI=ON \
        -DLLVM_BUILD_TESTS=ON \
        -DLLVM_INCLUDE_DOCS=ON \
        -DLLVM_BUILD_DOCS=ON \
        -DLLVM_ENABLE_SPHINX=ON \
        -DSPHINX_WARNINGS_AS_ERRORS=OFF \
        -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
        -DLLVM_MAIN_SRC_DIR="$srcdir"/llvm-project/llvm \
        -DLLVM_VERSION_SUFFIX="" \
        -DCMAKE_POLICY_DEFAULT_CMP0077=NEW
#  -DCMAKE_INSTALL_LIBEXECDIR=/usr/bin isn't honored by clang build

    if [[ ! $NINJAFLAGS ]]; then
        ninja
    else
        ninja "$NINJAFLAGS"
    fi
}

check() {
    cd _build 
    ninja check-clang{,-tools}
}

_python_optimize() {
  python -m compileall "$@"
  python -O -m compileall "$@"
  python -OO -m compileall "$@"
}

package() {
    cd _build

    DESTDIR="$pkgdir" ninja install
    install -Dm644 "$srcdir"/llvm-project/clang/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    # Remove documentation sources
    rm -r "$pkgdir"/usr/share/doc/clang{,-tools}/html/{_sources,.buildinfo}
    
    # Move analyzer scripts out of /usr/libexec
    mv "$pkgdir"/usr/libexec/{ccc,c++}-analyzer "$pkgdir"/usr/lib/clang/
    rmdir "$pkgdir"/usr/libexec
    sed -i 's|libexec|lib/clang|' "$pkgdir"/usr/bin/scan-build

    cd "$srcdir"/llvm-project/clang
    # Install Python bindings and optimize them
    install -d "$pkgdir"/usr/lib/python3.7/site-packages
    cp -a bindings/python/clang  "$pkgdir"/usr/lib/python3.7/site-packages/
    _python_optimize "$pkgdir"/usr/lib/python3.7/site-packages
  
    # Compile Python scripts
    _python_optimize "$pkgdir"/usr/share -x 'clang-include-fixer|run-find-all-symbols'
}

# vim:set ts=2 sw=2 et:
