# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=openmp
pkgname=mingw-w64-${_pkgname}
pkgver=13.0.1
pkgrel=1
pkgdesc='LLVM OpenMP Runtime Library (mingw-w64)'
url='https://openmp.llvm.org/'
license=('custom:Apache 2.0 with LLVM Exception')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-clang' 'uasm')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
source=(
	"https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/$_pkgname-$pkgver.src.tar.xz"{,.sig}
)
sha256sums=('6b79261371616c31fea18cd3ee1797c79ee38bcaf8417676d4fa366a24c96b4f'
            'SKIP')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

_srcdir="${_pkgname}-${pkgver}.src"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG'
	-DLIBOMP_INSTALL_ALIASES=OFF -DCMAKE_ASM_MASM_COMPILER='uasm' )

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
		sed -i "s|/usr/share/mingw/toolchain-${_arch}.cmake|$(pwd)/toolchain-${_arch}.cmake|" "${_arch}-cmake"
		
		./${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=OFF -DCMAKE_ASM_MASM_FLAGS="$_winflag"
		#sed -i -r 's/x86_64-w64-mingw32-uasm (.+) (\S+)z_Windows_NT-586_asm\.asm$/x86_64-w64-mingw32-uasm \1 Z:\2z_Windows_NT-586_asm\.asm/' "build-${_arch}/runtime/src/CMakeFiles/omp.dir/build.make"
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
