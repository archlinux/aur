# Maintainer:
pkgname=pdfium-binaries-v8
pkgver=4750
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
	"14e5b9fa793d82103586f77373075ef2fa648a5753185e7df8ba6451926115a9fe0ce85f142db78c3559d37321cbff80a3534883de9aa984710ea71a54bdedd6"
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
