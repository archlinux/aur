# Maintainer: Eduardo Jose Gomez Hernandez <eduardo@edujgh.net>
pkgname=c3c-git
_pkgname=c3c
pkgver=r1698.a50c5f4f
pkgrel=1
pkgdesc="C3 is an evolution of C enabling the same paradigms and retaining the same syntax as far as possible. Git version for x86_64"
arch=(x86_64)
url="https://github.com/c3lang/c3c.git"
license=('LGPL3' 'MIT')
depends=()
makedepends=('binutils' 'tar' 'ninja' 'git' 'cmake' 'libbsd' 'curl')
provides=(c3c)
conflicts=(c3c)

_repository="https://apt.llvm.org/mantic/"
_llvmver="17"

_required_llvm_packages="clang-${_llvmver}_ libc++1-${_llvmver}_ libc++-${_llvmver}-dev_ libc++abi1-${_llvmver}_ libc++abi-${_llvmver}-dev_ libclang1-${_llvmver}_ libclang-${_llvmver}-dev_ libclang-common-${_llvmver}-dev_ libclang-cpp${_llvmver}_ libclang-cpp${_llvmver}-dev_ libclang-rt-${_llvmver}-dev_ liblld-${_llvmver}_ liblld-${_llvmver}-dev_ libllvm${_llvmver}_ libllvm-${_llvmver}-ocaml-dev_ libmlir-${_llvmver}_ libmlir-${_llvmver}-dev_ libomp-${_llvmver}-dev_ libomp5-${_llvmver}_ libpolly-${_llvmver}-dev_ lld-${_llvmver}_ llvm-${_llvmver}_ llvm-${_llvmver}-dev_ llvm-${_llvmver}-linker-tools_ llvm-${_llvmver}-runtime_ llvm-${_llvmver}-tools_ mlir-${_llvmver}-tools_"

source=('git+https://github.com/c3lang/c3c.git'
	'https://launchpad.net/ubuntu/+archive/primary/+files/libedit2_3.1-20221030-2_amd64.deb')
md5sums=('SKIP'
	 'dc66a491cd5514c069d8151a37ae9e7e')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/"

    echo "Downloading Ubuntu LLVM packages:"
    
    curl "${_repository}/pool/main/l/llvm-toolchain-${_llvmver}/" --compressed -vs > repository
    for package in $_required_llvm_packages; do
	name=$(cat repository | grep "${package}" | head -n 1 | cut -f  2 -d "\"")
	if ! [ -f ${name} ]; then
	    echo "Downloading ${package}"
	    curl "${_repository}/pool/main/l/llvm-toolchain-${_llvmver}/${name}" --output "${name}"
	else
	    echo "${name} is allready present"
	fi
    done

    echo "Unpacking LLVM"
    for i in $(/bin/ls *.deb); do
	echo "Unpacking ${i}"
	ar p "${i}" data.tar.zst | tar --use-compress-program=unzstd -x ;
    done
}

build() {
    cd "${srcdir}/${_pkgname}"
    export LD_LIBRARY_PATH=`readlink -e ${srcdir}/usr/lib/x86_64-linux-gnu`:${LD_LIBRARY_PATH}
    export PATH=`readlink -e ${srcdir}/usr/bin`:${PATH}
    cmake -B build \
          -G Ninja \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_C_COMPILER=clang-${_llvmver} \
          -DCMAKE_CXX_COMPILER=clang++-${_llvmver} \
          -DCMAKE_LINKER=lld-link-${_llvmver} \
          -DCMAKE_OBJCOPY=llvm-objcopy-${_llvmver} \
          -DCMAKE_STRIP=llvm-strip-${_llvmver} \
          -DCMAKE_DLLTOOL=llvm-dlltool-${_llvmver} \
          -DC3_LLVM_VERSION=${_llvmver} \
	  -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON

    cmake --build build
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/lib/${_pkgname}"

    cp "${srcdir}/${_pkgname}/build/c3c" "${pkgdir}/usr/lib/${_pkgname}/c3c"
    cp -r "${srcdir}/${_pkgname}/lib" "${pkgdir}/usr/lib/${_pkgname}/lib"
    ln -s "/usr/lib/${_pkgname}/c3c" "${pkgdir}/usr/bin/c3c"

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE_STDLIB" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_STDLIB"
}
