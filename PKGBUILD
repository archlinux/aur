# Maintainer:
pkgname=pdfium-binaries-v8
pkgver=5268
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
	"e219dde268b2f91aaae45377452c16dd395c2a71b3a8ec889e5b330a5f9673a6ebcd4070e22c344570df164c0b3d3d0dfded13751e32d78cd1a3fa8f97e27b30"
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
