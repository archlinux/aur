# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=clvk
pkgname=clvk-git
pkgver=r600.b08793c
pkgrel=2
pkgdesc="Experimental implementation of OpenCL 3.0 on Vulkan"
arch=("x86_64")
url="https://github.com/kpet/clvk"
license=('Apache')
depends=("vulkan-icd-loader" "ocl-icd" "ncurses" "gcc-libs" "zstd" "zlib")
makedepends=("gcc" "git" "cmake" "python" "opencl-headers" "spirv-headers" "spirv-tools" "spirv-llvm-translator")
provides=("clvk")
conflicts=("clvk")
options=("!lto")
install=$pkgname.install
source=("git+$url.git"
	"git+https://github.com/google/clspv.git"
	"opencl-headers::git+https://github.com/KhronosGroup/OpenCL-Headers.git"
	"spirv-headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git"
	"spirv-llvm-translator::git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git"
	"spirv-tools::git+https://github.com/KhronosGroup/SPIRV-Tools.git"
	"clvk64.icd")

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '63af42f5a92eeac0f7205f7bf7cc1b066c5c8ce56a492792dc4b71b177958fe7')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	for module in {opencl-headers,spirv-headers,spirv-llvm-translator,spirv-tools};
	do
		git config --file=.gitmodules submodule.$module.url "$srcdir/$module"
	done
	git -c protocol.file.allow=always submodule update --init

	cd "$srcdir/$_pkgname/external/clspv/utils"
	python fetch_sources.py
}

build() {
	cd "$srcdir"
	cmake -B build -S "$_pkgname" \
	-DCLVK_BUILD_SPIRV_TOOLS=O \
	-DSKIP_SPIRV_TOOLS_INSTALL=1 \
	-DCLSPV_BUILD_TESTS=0 \
	-DCLVK_BUILD_STATIC_TESTS=0 \
	-DCLVK_BUILD_TESTS=0 \
	-DCMAKE_INSTALL_PREFIX=/opt/$_pkgname
	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "$srcdir/clvk64.icd" "$pkgdir/etc/OpenCL/vendors/clvk64.icd"
}
