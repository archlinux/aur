# Maintainer: Donald Carr <sirspudd at gmail dot com>

pkgname=('clang-prefixed-release')
#pkgver=15.0.7
_pkgver=18.1.0
_pkg_suffix=rc1
_pkgver_suffix=${_pkgver}
_pkgver_dash_suffix=${_pkgver}
if [[ -n ${_pkg_suffix} ]]; then
    _pkgver_suffix=${_pkgver_suffix}${_pkg_suffix}
    _pkgver_dash_suffix=${_pkgver_dash_suffix}-${_pkg_suffix}
fi
pkgver=${_pkgver_suffix}
pkgrel=1
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
sha512sums=('85afc331c8a023f4d8177cc42143b968b94d6987a7ed38b8be1170c6b4e1ef1a79d2d4e44d5fae98b713959b5d69bd4e44c6ba84355f59e8fe99588cbca03d7a')
install=clang.install
static_build=false
build_with_gcc=true

prefix_path="/opt/clang"
install_path="${prefix_path}/${pkgver}"

shared_library_build_options=" \
            -DCMAKE_EXE_LINKER_FLAGS=-Wl,-Bsymbolic-functions \
            -DCMAKE_SHARED_LINKER_FLAGS=-Wl,-Bsymbolic-functions \
            -DLLVM_LINK_LLVM_DYLIB=ON \
            -DCLANG_LINK_CLANG_DYLIB=ON \
	"

# both modules and thinlto barf with gcc
build_with_clang_options=" \
			-DLLVM_BINUTILS_INCDIR=/usr/include \
            -DLLVM_ENABLE_LLD=ON \
            -DCMAKE_C_COMPILER=clang \
            -DCMAKE_CXX_COMPILER=clang++ \
            -DLLVM_ENABLE_MODULES=ON \
            -DLLVM_ENABLE_LTO=Thin \
            -DCLANG_DEFAULT_PIE_ON_LINUX=ON \
            -DLLVM_ABI_BREAKING_CHECKS:STRING=FORCE_OFF \
            -DLLVM_ENABLE_UNWIND_TABLES=OFF \
            -DLLVM_ENABLE_LIBCXX=ON \
            -DLLVM_ENABLE_PROJECTS=bolt;clang;clang-tools-extra;libc;libclc;lld;lldb;openmp;polly;pstl;compiler-rt \
	"

additional_build_options=""

if ! $static_build; then
	additional_build_options="${additional_build_options} ${shared_library_build_options}"
fi

if $build_with_gcc; then
	additional_build_options="${additional_build_options} -DLLVM_ENABLE_PROJECTS=bolt;clang;clang-tools-extra;libclc;lld;lldb;openmp;polly;pstl;compiler-rt"
else
	additional_build_options="${additional_build_options} ${build_with_clang_options}"
fi

_prepare_install_script() {
	cp ${startdir}/.clang.install ${startdir}/clang.install
	sed -i "s,CLANG_PREFIX,${prefix_path},g" ${startdir}/clang.install
	sed -i "s,CLANG_VERSION,${_pkgver_suffix},g" ${startdir}/clang.install
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

	(
	set -o pipefail
    # https://llvm.org/docs/CMake.html
    cmake   -B _build \
            -GNinja \
            -DCMAKE_INSTALL_PREFIX:PATH=${install_path} \
            -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind" \
            -DCMAKE_BUILD_TYPE=Release \
			${additional_build_options} \
            ${srcdir}/llvm-project-${_pkgver_suffix}.src/llvm | tee ${pkgname}-configure.log
	time ninja -C _build | tee ${pkgname}-build.log
	)
	#perf record -e cycles:u -j any,u -- ninja -C _build
}

package() {
	_prepare_install_script

	(
	set -o pipefail
    #rm -Rf ${pkgdir}
    DESTDIR="$pkgdir" ninja -C _build install | tee ${pkgname}-install.log
	)
}
