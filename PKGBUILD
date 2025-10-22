# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=openmp
pkgname=mingw-w64-${_pkgname}
pkgver=21.1.4
pkgrel=1
pkgdesc='LLVM OpenMP Runtime Library (mingw-w64)'
url='https://openmp.llvm.org/'
license=('custom:Apache 2.0 with LLVM Exception')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-wclang-git' 'uasm')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
_source_base="https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver"
source=(
	"$_source_base/$_pkgname-$pkgver.src.tar.xz"{,.sig}
	"$_source_base/cmake-$pkgver.src.tar.xz"{,.sig}
)
sha256sums=('0d26bddb78b6fa62ea5181dbfc0797f4548368a9533b20f310156443acc187c5'
            'SKIP'
            'f4316d84a862ba3023ca1d26bd9c6a995516b4fa028b6fb329d22e24cc6d235e'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042'  # Tobias Hieta <tobias@hieta.se>
              '71046D1E9C6656BDD61171873E83BABF4A4F9E85') # Cullen Rhodes <cullen.rhodes@arm.com>

_srcdir="${_pkgname}-${pkgver}.src"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
	-DLIBOMP_INSTALL_ALIASES=OFF -DCMAKE_ASM_MASM_COMPILER='uasm' )

prepare() {
	mv cmake{-$pkgver.src,}
}

build() {
	for _arch in ${_architectures}; do
		_winflag=
		[[ "${_arch}" == 'x86_64-w64-mingw32' ]] && _winflag='-win64'

		unset CFLAGS
		unset CXXFLAGS
		unset LDFLAGS
		cp "/usr/share/mingw/toolchain-${_arch}.cmake" .
		cp "/usr/bin/${_arch}-cmake" .
		sed -i 's/gcc/clang/' "toolchain-${_arch}.cmake"
		sed -i 's/g++/clang++/' "toolchain-${_arch}.cmake"
		sed -i "s|/usr/share/mingw/toolchain-${_arch}.cmake|$srcdir/toolchain-${_arch}.cmake|" "${_arch}-cmake"

		./${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DBUILD_TESTING=OFF \
			-DCMAKE_ASM_MASM_FLAGS="$_winflag"
		sed -i "s|/safeseh |-safeseh |;s|/coff |-coff |;s|/c |-c -10 |;s|/Fo |-Fo |" "build-${_arch}/runtime/src/CMakeFiles/omp.dir/build.make"
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
