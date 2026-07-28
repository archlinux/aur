# Maintainer: Donald Carr <sirspudd at gmail dot com>

# lto breaks build with gcc
# module support seem prone to breakage

# I run out of memory when compiling with ninja on a 7950x with 64G of ram
# I constrain the build with taskset --cpu-list 2-27 makepkg

pkgname=('clang-prefixed-release')
#pkgver=15.0.7
_pkgver=23.1.0
_pkg_suffix=rc2
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
             'ocl-icd' 'opencl-headers' 'z3' 'jsoncpp' 'clang' 'libunwind')
checkdepends=("python-psutil")
pkgdesc="Up to date official clang releases installed at /opt/clang/latest to avoid system wide usage/impact"

# stable
source=("https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-${_pkgver_dash_suffix}.tar.gz")
sha512sums=('50e1224d7e5877d70f4ccbf788de0955cd41a57b97d130eac5e7ae5984b676b9fa28c4b67d4791ce901972540b3507f8d2d0660b4845cb90875e3b994a48021f')
install=clang.install
static_build=false
build_with_gcc=false

prefix_path="/opt/clang"
install_path="${prefix_path}/${pkgver}"

shared_library_build_options=" \
            -DCMAKE_EXE_LINKER_FLAGS=-Wl,-Bsymbolic-functions \
            -DCMAKE_SHARED_LINKER_FLAGS=-Wl,-Bsymbolic-functions \
            -DLLVM_LINK_LLVM_DYLIB=ON \
            -DCLANG_LINK_CLANG_DYLIB=ON \
	"

# both modules and thinlto barf with gcc
# -DLLVM_ENABLE_MODULES=ON now barfs when compiling with clang 18, complaining about missing symbols
build_with_clang_options=" \
			-DLLVM_BINUTILS_INCDIR=/usr/include \
            -DLLVM_ENABLE_LLD=ON \
            -DCMAKE_C_COMPILER=clang \
            -DCMAKE_CXX_COMPILER=clang++ \
            -DCMAKE_LINKER=lld \
            -DCMAKE_EXE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
            -DCMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld" \
            -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld" \\
	"

_prepare_install_script() {
	cp ${startdir}/.clang.install ${startdir}/clang.install
	sed -i "s,CLANG_PREFIX,${prefix_path},g" ${startdir}/clang.install
	sed -i "s,CLANG_VERSION,${_pkgver_suffix},g" ${startdir}/clang.install
}

build() {
    rm -rf _build
    mkdir _build

    env > _build/makepkg_env_dump
    set > _build/makepkg_set_dump

    #        "clang;clang-tools-extra;libc;libclc;lld;lldb;openmp;polly;pstl;bolt;flang;libcxx;libcxxabi;libunwind"

	(
	set -o pipefail
    # https://llvm.org/docs/CMake.html
	# MinSizeRel
            #-DCMAKE_BUILD_TYPE=MinSizeRel \

	# we now support makepkg's CFLAGS; be warned that -Os does not successfully build
    cmake   -B _build \
            -DLLVM_ABI_BREAKING_CHECKS:STRING=FORCE_OFF \
            -DCMAKE_BUILD_TYPE=MinSizeRel \
      			-DCMAKE_C_FLAGS_RELEASE="${CFLAGS}" \
			      -DCMAKE_CXX_FLAGS_RELEASE="${CXXFLAGS}" \
            -GNinja \
            -DCMAKE_INSTALL_PREFIX:PATH=${install_path} \
            ${build_with_clang_options} \
            ${shared_library_build_options} \
            -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld;lldb;mlir;polly;bolt" \
            -DLLVM_ENABLE_RUNTIMES="compiler-rt;libc;libcxx;libcxxabi;libunwind;openmp" \
            ${srcdir}/llvm-project-llvmorg-${_pkgver_dash_suffix}/llvm | tee ${pkgname}-configure.log
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
