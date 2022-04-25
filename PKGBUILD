# Maintainer:
pkgname=pdfium-binaries
pkgver=5010
pkgrel=1
pkgdesc='PDFium binaries built with scripts from pdfium-binaries'
arch=('x86_64')
url='https://github.com/bblanchon/pdfium-binaries'
license=('Apache')
makedepends=('git' 'ninja')
provides=('libpdfium')
conflicts=('libpdfium-nojs' 'pdfium-binaries-v8')

source=(
	"https://github.com/bblanchon/pdfium-binaries/archive/refs/tags/chromium/${pkgver}.tar.gz"
)

sha512sums=(
	"b719ce9baaad2c25aeb102f2f8375eed27d264f88a7cdfcca39964685859256fdd76cd3f6131fbaf7621aa0f0c4ed2a9b06d00a5fae482aeb3e787727f0fe40b"
)

build() {
	_src_dir="${srcdir}"/pdfium-binaries-chromium-${pkgver}
	cd ${_src_dir}

	export PDFium_TARGET_CPU=x64
	export PDFium_TARGET_OS=linux
	export PDFium_BRANCH=chromium/${pkgver}
	export PDFium_ENABLE_V8=false
	export PDFium_IS_DEBUG=false

	./build.sh
}

package() {
	_src_dir="${srcdir}"/pdfium-binaries-chromium-${pkgver}
	install -Dm644 ${_src_dir}/staging/LICENSE "${pkgdir}"/usr/share/licenses/pdfium/LICENSE
	install -Dm644 ${_src_dir}/staging/PDFiumConfig.cmake "${pkgdir}"/usr/lib/cmake/PDFium/PDFiumConfig.cmake
	cp -ar ${_src_dir}/staging/include "${pkgdir}"/usr
	cp -ar ${_src_dir}/staging/lib "${pkgdir}"/usr
}
