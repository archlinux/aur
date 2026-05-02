pkgname=qwen3-tts.cpp
pkgver=0+37+2a41916
pkgrel=1

pkgdesc="C++ inference for Qwen3-TTS using the GGML tensor library (Vulkan)"
arch=(x86_64 armv7h aarch64)
url="https://github.com/khimaros/$pkgname"
license=('unknown')
depends=(
    vulkan-icd-loader
)
makedepends=(
	cmake
	git
	shaderc
	spirv-headers
	vulkan-headers
)
options=(lto)
source=(
	"git+${url}.git"
	"git+https://github.com/ggml-org/ggml.git"
)
sha256sums=('SKIP'
            'SKIP')

prepare() {
	cd "$pkgbase"

	git submodule init
	git config submodule.ggml.url "$srcdir/ggml"
	git -c protocol.file.allow=always submodule update
}

pkgver() {
    cd "$pkgbase"
	printf '0+%s+%s' "$(git rev-list HEAD --count)" "$(git rev-parse --short HEAD)"
}

build() {
	local cmake_opts=(
		-B build
		-S "$pkgbase"
		-DCMAKE_BUILD_TYPE=Release
		-DGGML_VULKAN=ON
	)

	cmake "${cmake_opts[@]}"
	cmake --build build --config Release -j 8
}

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" build/qwen3-tts-{cli,server}
}
