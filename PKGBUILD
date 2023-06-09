# Maintainer: Donald Carr <sirspudd at gmail dot com>

pkgname=('clang-prefixed-release')
#pkgver=15.0.7
_pkgver=16.0.5
_pkg_suffix=
_pkgver_suffix=${_pkgver}
_pkgver_dash_suffix=${_pkgver}
if [[ -n ${_pkg_suffix} ]]; then
    _pkgver_suffix=${_pkgver_suffix}${_pkg_suffix}
    _pkgver_dash_suffix=${_pkgver_dash_suffix}-${_pkg_suffix}
fi
pkgver=${_pkgver_suffix}
pkgrel=2
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('git' 'cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2'
             'swig' 'lld' 'python' 'libc++'
             'ocl-icd' 'opencl-headers' 'z3' 'jsoncpp' 'clang')
checkdepends=("python-psutil")

# stable
#source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/llvm-project-${pkgver}.src.tar.xz")
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-${_pkgver_dash_suffix}/llvm-project-${_pkgver_suffix}.src.tar.xz")
sha512sums=('7008e7e9c8c2246fe98ba3f0c0fa91e41c88c4da427bf1cfdcce7ef57e5ea838efe7c58c523a7d1708e70d64a4338afe16d06fba2fc7ac5a6c19ca3d6ee41e99')
install=clang.install
static_build=false

prefix_path="/opt/clang"
install_path="${prefix_path}/${pkgver}"

shared_library_build_options=" \
            -DCMAKE_EXE_LINKER_FLAGS=-Wl,-Bsymbolic-functions \
            -DCMAKE_SHARED_LINKER_FLAGS=-Wl,-Bsymbolic-functions \
            -DLLVM_LINK_LLVM_DYLIB=ON \
            -DCLANG_LINK_CLANG_DYLIB=ON \
	"

additional_build_options=""

if ! $static_build; then
	additional_build_options="${additional_build_options} ${shared_library_build_options}"
fi

_prepare_install_script() {
	cp ${startdir}/.clang.install ${startdir}/clang.install
	sed -i "s,CLANG_PREFIX,${prefix_path},g" ${startdir}/clang.install
	sed -i "s,CLANG_VERSION,${_pkgver},g" ${startdir}/clang.install
}

build() {
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS

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
            -DLLVM_ENABLE_LTO=Thin \
            -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;libc;libclc;lld;lldb;openmp;polly;pstl;compiler-rt" \
            -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind" \
            -DCMAKE_BUILD_TYPE=Release \
            ${srcdir}/llvm-project-${_pkgver_suffix}.src/llvm | tee ${pkgname}-configure.log

    time ninja -C _build | tee ${pkgname}-build.log
}

package() {
	_prepare_install_script

    #rm -Rf ${pkgdir}
    DESTDIR="$pkgdir" ninja -C _build install | tee ${pkgname}-install.log
}
