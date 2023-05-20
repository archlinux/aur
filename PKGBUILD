# Maintainer: Donald Carr <sirspudd at gmail dot com>

pkgname=('clang-prefixed-git')
pkgver=17.0.0_r461666.ac73c48e091c
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('git' 'cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2'
             'swig' 'lld' 'python' 'libc++'
             'ocl-icd' 'opencl-headers' 'z3' 'jsoncpp' 'clang')
checkdepends=("python-psutil")
source=("git+https://github.com/llvm/llvm-project.git")
sha512sums=('SKIP')

prefix_path="/opt/clang"
install_path="${prefix_path}/${pkgver}"

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

build() {
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS

    cd llvm-project/llvm

    rm -rf _build
    mkdir _build

    env > _build/makepkg_env_dump
    set > _build/makepkg_set_dump

    #        "clang;clang-tools-extra;libc;libclc;lld;lldb;openmp;polly;pstl;bolt;flang;libcxx;libcxxabi;libunwind"

    # https://llvm.org/docs/CMake.html
    cmake   -B _build \
            -GNinja \
            -DCLANG_DEFAULT_PIE_ON_LINUX=ON \
            -DLLVM_ENABLE_PIC=ON \
            -DLLVM_ENABLE_LLD=ON \
            -DLLVM_ENABLE_LIBCXX=ON \
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
            ${srcdir}/llvm-project-${_pkgver_suffix}.src/llvm | tee ${pkgname}-configure.log

    time ninja -C _build | tee ${pkgname}-build.log
}

package() {
    cd llvm-project/llvm

    #rm -Rf ${pkgdir}
    DESTDIR="$pkgdir" ninja -C _build install | tee ${pkgname}-install.log

    # time to fix broken bolt binary output
    #hugify_path=$(find _build -name "libbolt_rt_hugify.a")
    #hugify_dir=$(dirname ${hugify_path})
    #mv ${hugify_dir}/*.a ${pkgdir}/${install_path}/lib
    # end bolt workaround
}
