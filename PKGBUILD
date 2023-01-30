# Maintainer: Donald Carr <sirspudd at gmail dot com>

pkgname=('clang-prefixed-release')
pkgver=15.0.7
pkgrel=2
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('git' 'cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2' 'python-sphinx'
             'python-sphinx-automodapi' 
             'python-sphinx' 'python-recommonmark' 'swig' 'python' 'python-six' 'lua53'
             'ocl-icd' 'opencl-headers' 'z3' 'jsoncpp' 'clang')
checkdepends=("python-psutil")
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/llvm-project-${pkgver}.src.tar.xz")

sha512sums=('4836d3603f32e8e54434cbfa8ef33d9d473ac5dc20ebf9c67132653c73f4524931abd1084655eaee5f20bcfcb91bcc4bbc5c4a0b603ad0c9029c556e14dc4c52')

prefix_path="/opt/clang"
install_path="${prefix_path}/${pkgver}"

build() {
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS

    rm -rf _build
    mkdir _build

    env > _build/makepkg_env_dump
    set > _build/makepkg_set_dump

    #        -DLLVM_ENABLE_LTO=Thin 
    #        "clang;clang-tools-extra;libc;libclc;lld;lldb;openmp;polly;pstl;bolt;flang;libcxx;libcxxabi;libunwind"

    # https://llvm.org/docs/CMake.html
    cmake   -B _build \
            -GNinja \
            -DLLVM_USE_LINKER=lld \
            -DCMAKE_C_COMPILER=clang \
            -DCMAKE_CXX_COMPILER=clang++ \
            -DCMAKE_INSTALL_PREFIX:PATH=${install_path} \
            -DCMAKE_EXE_LINKER_FLAGS=-Wl,-Bsymbolic-functions \
            -DCMAKE_SHARED_LINKER_FLAGS=-Wl,-Bsymbolic-functions \
            -DLLVM_ENABLE_LTO=Thin \
            -DLLVM_LINK_LLVM_DYLIB=ON \
            -DCLANG_LINK_CLANG_DYLIB=ON \
            -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;libc;libclc;lld;lldb;openmp;polly;pstl;compiler-rt" \
            -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind" \
            -DCMAKE_BUILD_TYPE=Release \
            ${srcdir}/llvm-project-${pkgver}.src/llvm

    ninja -C _build
}

package() {
    DESTDIR="$pkgdir" ninja -C _build install

    cd ${pkgdir}${prefix_path}
    ln -s ${pkgver} latest
}
