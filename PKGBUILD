# Maintainer: Donald Carr <sirspudd at gmail dot com>

pkgname=('clang-prefixed-release')
#pkgver=15.0.7
_pkgver=18.1.1
_pkg_suffix=
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
sha512sums=('f21b7a70504a3b645c641d57f10c78a2ac99d9627755be96b5380cb088e1604976382c7b87a75908370491e0985c0788fbbc00996ccb744f33525989a5b0f046')
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

enable_all_projects_minus_libc="-DLLVM_ENABLE_PROJECTS=bolt;clang;clang-tools-extra;libclc;lld;lldb;openmp;polly;pstl;compiler-rt"
#enable_all_projects="-DLLVM_ENABLE_PROJECTS=bolt;clang;clang-tools-extra;libc;libclc;lld;lldb;openmp;polly;pstl;compiler-rt"
# both modules and thinlto barf with gcc
# -DLLVM_ENABLE_MODULES=ON now barfs when compiling with clang 18, complaining about missing symbols
build_with_clang_options=" \
			-DLLVM_BINUTILS_INCDIR=/usr/include \
            -DLLVM_ENABLE_LLD=ON \
			-DLLVM_ENABLE_MODULES=ON \
            -DLLVM_ENABLE_LTO=Thin \
            -DCMAKE_C_COMPILER=clang \
            -DCMAKE_CXX_COMPILER=clang++ \
			${enable_all_projects_minus_libc} \
	"

additional_build_options=""

if ! $static_build; then
	additional_build_options="${additional_build_options} ${shared_library_build_options}"
fi

if $build_with_gcc; then
	# libc extricated since it did not build with gcc 13 on last attempt; if it builds for you, let me know
	additional_build_options="${additional_build_options} \
		${enable_all_projects_minus_libc} \
	"
else
	additional_build_options="${additional_build_options} ${build_with_clang_options}"
fi

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
            -DCLANG_DEFAULT_PIE_ON_LINUX=ON \
            -DLLVM_ABI_BREAKING_CHECKS:STRING=FORCE_OFF \
            -DLLVM_ENABLE_UNWIND_TABLES=OFF \
            -DLLVM_ENABLE_LIBCXX=ON \
            -DCMAKE_BUILD_TYPE=Release \
			-DCMAKE_C_FLAGS_RELEASE="${CFLAGS}" \
			-DCMAKE_CXX_FLAGS_RELEASE="${CXXFLAGS}" \
            -GNinja \
            -DCMAKE_INSTALL_PREFIX:PATH=${install_path} \
            -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind" \
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
