# Maintainer: Jasper Smit <jrhrsmit at gmail dot com>

pkgname=('llvm-tce' 'llvm-tce-libs')
pkgver=10.0.1_r339900.8f299fd2cff
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=(   'git' 'cmake' 'ninja' 'libedit' 'ncurses' 
    'python') 
source=("llvm-project::git+https://github.com/llvm/llvm-project.git#branch=release/10.x"
        "tce-1.21::git+https://github.com/cpc/tce.git#branch=release-1.21"
              'llvm-config.h')

md5sums=('SKIP'
         'SKIP'
         '295c343dcd457dc534662f011d7cff1a')
sha512sums=('SKIP'
            'SKIP'
            '75e743dea28b280943b3cc7f8bbb871b57d110a7f2b9da2e6845c1c36bf170dd883fca54e463f5f49e0c3effe07fbd0db0f8cf5a12a2469d3f792af21a73fcdd')
options=('staticlibs')

_python_optimize() {
  python -m compileall "$@"
  python -O -m compileall "$@"
  python -OO -m compileall "$@"
}

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
    echo "$_pkgver"
}

prepare() {
    if [  -d _build ]; then
        rm -rf _build
    fi
    mkdir _build
    
    cd llvm-project
    # llvm-project contains a lot of stuff, remove parts that aren't used by this package
    rm -rf debuginfo-tests libclc libcxx libcxxabi libunwind llgo openmp parallel-libs pstl libc mlir

    #apply patches
    patch_dir=../tce-1.21/tce/tools/patches
    patch -Np0 < $patch_dir/llvm-9-fix-load-lowering.patch
    patch -Np0 < $patch_dir/llvm-10-custom-vector-extension.patch
    patch -Np0 < $patch_dir/llvm-9-vect-datalayout.patch
    patch -Np0 < $patch_dir/llvm-9-SPIR-address-space-numbers.patch
    
    cd clang
    # patch --forward --strip=1 --input="$srcdir"/enable-SSP-and-PIE-by-default.patch
}

build() {
    cd _build
    export CFLAGS=-O3
    export CPPFLAGS=-O3
    export CXXFLAGS=-O3
    cmake "$srcdir"/llvm-project/llvm  -G "Unix Makefiles" \
        -D CMAKE_C_FLAGS="${CFLAGS}" \
        -D CMAKE_CXX_FLAGS="${CXXFLAGS}" \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D LLVM_ENABLE_RTTI=ON \
        -D LLVM_LINK_LLVM_DYLIB=ON \
        -D LLVM_ENABLE_Z3_SOLVER=OFF \
        -D LLVM_ENABLE_ASSERTIONS=ON \
        -D LLVM_ENABLE_PROJECTS="clang"
    
    make CXXFLAGS="-std=c++11" REQUIRES_RTTI=1
}

package_llvm-tce() {
    pkgdesc="LLVM 10 patched for TCE"
    depends=("llvm-tce-libs=$pkgver-$pkgrel" 'perl')
    provides=(llvm clang)
    conflicts=(llvm llvm-git clang)
    
    pushd _build
        # suppress error about not being able to find the following folder
        mkdir -p docs/ocamldoc/html
        make DESTDIR="$pkgdir/" install
    popd
    
    # Move analyzer scripts out of /usr/libexec
    mv "$pkgdir"/usr/libexec/{ccc,c++}-analyzer "$pkgdir"/usr/lib/clang/
    rmdir "$pkgdir"/usr/libexec
    sed -i 's|libexec|lib/clang|' "$pkgdir"/usr/bin/scan-build

    # The runtime libraries go into llvm-libs
    mv -f "$pkgdir"/usr/lib/lib{LLVM,LTO}*.so* "$srcdir"

    if [[ $CARCH == x86_64 ]]; then
        # Needed for multilib (https://bugs.archlinux.org/task/29951)
        # Header stub is taken from Fedora
        mv "$pkgdir"/usr/include/llvm/Config/llvm-config{,-64}.h
        cp "$srcdir"/llvm-config.h "$pkgdir"/usr/include/llvm/Config/llvm-config.h
    fi
}

package_llvm-tce-libs() {
    pkgdesc="runtime libraries for llvm-tce, LLVM 10 patched for TCE"
    depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')
    provides=('llvm-libs')
    conflicts=('llvm-libs' 'llvm-libs-git')

    install -d "$pkgdir"/usr/lib
    cp -P \
        "$srcdir"/lib{LLVM,LTO}*.so* \
        "$pkgdir"/usr/lib/
}
