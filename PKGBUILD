# Maintainer: Donald Carr <sirspudd at gmail dot com>

pkgname=('clang-prefixed-release')
#pkgver=15.0.7
_pkgver=17.0.0
_pkg_suffix=rc3
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
sha512sums=('5f48b4af2e4f9bc470fcfd42fd48072b7bd442bc676d8401b04fbc6e9014a9a78e1bf524ba78f7ae8a1246222a6b03ca662721e3bf6e9eb03a015dd3306c7234')
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
            -DLLVM_ENABLE_PROJECTS="bolt;clang;clang-tools-extra;libc;libclc;lld;lldb;openmp;polly;pstl;compiler-rt" \
            -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind" \
            -DCMAKE_BUILD_TYPE=Release \
		${additional_build_options} \
            ${srcdir}/llvm-project-${_pkgver_suffix}.src/llvm | tee ${pkgname}-configure.log

	time ninja -C _build | tee ${pkgname}-build.log
	#perf record -e cycles:u -j any,u -- ninja -C _build
}

package() {
	_prepare_install_script

    #rm -Rf ${pkgdir}
    DESTDIR="$pkgdir" ninja -C _build install | tee ${pkgname}-install.log
}
