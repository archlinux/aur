# Maintainer:
pkgname=pdfium-binaries
pkgver=4780
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
	"92ec9b118d3f64b8816c99697d5bc8907636022813b17187b4c7484012afc29056ae29c886dbcef80e1da9388f56474f178f7f301163543aa1a3e9b13fa06980"
)

build() {
	_src_dir="${srcdir}"/pdfium-binaries-chromium-${pkgver}
	cd ${_src_dir}

	export CONFIGURATION=Release
	export PDFium_TARGET_CPU=x64
	export PDFium_TARGET_OS=linux
	export PDFium_BRANCH=chromium/${pkgver}
	export PDFium_V8=disabled

	./build.sh
}

package() {
	_src_dir="${srcdir}"/pdfium-binaries-chromium-${pkgver}
	install -Dm644 ${_src_dir}/staging/LICENSE "${pkgdir}"/usr/share/licenses/pdfium/LICENSE
	install -Dm644 ${_src_dir}/staging/PDFiumConfig.cmake "${pkgdir}"/usr/lib/cmake/PDFium/PDFiumConfig.cmake
	cp -ar ${_src_dir}/staging/include "${pkgdir}"/usr
	cp -ar ${_src_dir}/staging/lib "${pkgdir}"/usr
}
