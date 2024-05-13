# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=clvk
pkgname=clvk-git
pkgver=r674.b3407a7
pkgrel=2
pkgdesc="Experimental implementation of OpenCL 3.0 on Vulkan"
arch=("x86_64")
url="https://github.com/kpet/clvk"
license=('Apache-2.0')
depends=("vulkan-icd-loader" "ocl-icd" "ncurses" "gcc-libs" "zstd" "zlib")
makedepends=("gcc" "git" "cmake" "python" "opencl-headers" "spirv-headers" 
"spirv-tools" "spirv-llvm-translator" "vulkan-headers" "ninja")
provides=("clvk" "opencl-driver")
conflicts=("clvk")
options=("!lto")
install=$pkgname.install
source=("git+$url.git"
	"git+https://github.com/google/clspv.git"
	"opencl-headers::git+https://github.com/KhronosGroup/OpenCL-Headers.git"
	"spirv-headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git"
	"spirv-llvm-translator::git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git"
	"spirv-tools::git+https://github.com/KhronosGroup/SPIRV-Tools.git")

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	git submodule init
	for module in {clspv,opencl-headers,spirv-headers,spirv-llvm-translator,spirv-tools};
	do
		git config submodule.$module.url "$srcdir/$module"
	done
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$_pkgname/external/clspv/utils"
	python fetch_sources.py
}

build() {
	cd "$srcdir"
	cmake -B build -S "$_pkgname" \
	-GNinja \
	-DCMAKE_C_FLAGS="$CFLAGS" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS" \
	-DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
	-DCLVK_BUILD_SPIRV_TOOLS=O \
	-DSKIP_SPIRV_TOOLS_INSTALL=1 \
	-DCLSPV_BUILD_TESTS=0 \
	-DCLVK_BUILD_TESTS=0 \
	-DCMAKE_INSTALL_PREFIX=/opt/$_pkgname
	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
	mkdir -p "$pkgdir/etc/OpenCL/vendors"
	mkdir -p "$pkgdir/etc/profile.d"

	cat > "$pkgdir/etc/OpenCL/vendors/clvk64.icd" <<- EOF
	/opt/clvk/libOpenCL.so
	EOF

	cat > "$pkgdir/etc/profile.d/clvk-git.sh" <<-EOF
	export CLVK_CLSPV_PATH=/opt/clvk/clspv
	EOF
}
