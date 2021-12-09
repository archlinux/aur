# Maintainer:
pkgname=pdfium-binaries-v8
pkgver=4752
pkgrel=1
pkgdesc='PDFium binaries with V8 and XFA built with scripts from pdfium-binaries'
arch=('x86_64')
url='https://github.com/bblanchon/pdfium-binaries'
license=('Apache')
makedepends=('ninja')
provides=('libpdfium')
conflicts=('libpdfium-nojs' 'pdfium-binaries')

source=(
	"https://github.com/bblanchon/pdfium-binaries/archive/refs/tags/chromium/${pkgver}.tar.gz"
)

sha512sums=(
	"f3b193f1977634798bc1ee4cb7ad309370764d6d3bc8cc4c01838f1b590d44ec8f37deeba8445984f3985d5fbc56a83ec169abb609f6a8b40818e0dbe49f3af3"
)

build() {
	_src_dir="${srcdir}"/pdfium-binaries-chromium-${pkgver}
	cd ${_src_dir}

	export CONFIGURATION=Release
	export PDFium_TARGET_CPU=x64
	export PDFium_TARGET_OS=linux
	export PDFium_BRANCH=chromium/${pkgver}
	export PDFium_V8=enabled

	./build.sh
}

package() {
	_src_dir="${srcdir}"/pdfium-binaries-chromium-${pkgver}
	install -Dm644 ${_src_dir}/staging/LICENSE "${pkgdir}"/usr/share/licenses/pdfium/LICENSE
	install -Dm644 ${_src_dir}/staging/PDFiumConfig.cmake "${pkgdir}"/usr/lib/cmake/PDFium/PDFiumConfig.cmake
	cp -ar ${_src_dir}/staging/include "${pkgdir}"/usr
	cp -ar ${_src_dir}/staging/lib "${pkgdir}"/usr
}
