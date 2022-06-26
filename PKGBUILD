# Maintainer:
pkgname=pdfium-binaries-v8
pkgver=5131
pkgrel=1
pkgdesc='PDFium binaries with V8 and XFA built with scripts from pdfium-binaries'
arch=('x86_64')
url='https://github.com/bblanchon/pdfium-binaries'
license=('Apache')
makedepends=('git' 'ninja')
provides=('libpdfium')
conflicts=('libpdfium-nojs' 'pdfium-binaries')

source=(
	"https://github.com/bblanchon/pdfium-binaries/archive/refs/tags/chromium/${pkgver}.tar.gz"
)

sha512sums=(
	"439ec711598bf29027481d2acafd170a4f9b187643c7a683dfc4b25e4cf49a0282f58857cf2532b4b061cdf0b52e16dda38895b778e5f4f980b541d1b73125b9"
)

build() {
	_src_dir="${srcdir}"/pdfium-binaries-chromium-${pkgver}
	cd ${_src_dir}

	export PDFium_TARGET_CPU=x64
	export PDFium_TARGET_OS=linux
	export PDFium_TARGET_LIBC=default
	export PDFium_BRANCH=chromium/${pkgver}
	export PDFium_ENABLE_V8=true
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
