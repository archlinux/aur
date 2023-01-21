# Maintainer:
pkgname=pdfium-binaries-v8
pkgver=5541
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
	"001-apt-get.patch"
)

sha512sums=(
	"feee28e024f54fbedb7fc536ff885298f9a4e70ee9133524f9529387d5845159e7e15c69448b8f93badb18eaa024a50f51ab9d28e4a02ab9a2b88c378d98476a"
	"99c314134c0d313b30351a85dc2361aba6bff7fcda186c9304a741a047f89a70160d514bf9c2f8087d435158b620fc6633e6fc412778e069af13ebec64845ce2"
)

build() {
	_src_dir="${srcdir}"/pdfium-binaries-chromium-${pkgver}
	cd ${_src_dir}

	patch --forward --strip=1 --input="${srcdir}/001-apt-get.patch"

	./build.sh -b chromium/${pkgver} -j linux x64
}

package() {
	_src_dir="${srcdir}"/pdfium-binaries-chromium-${pkgver}
	install -Dm644 ${_src_dir}/staging/LICENSE "${pkgdir}"/usr/share/licenses/pdfium/LICENSE
	install -Dm644 ${_src_dir}/staging/PDFiumConfig.cmake "${pkgdir}"/usr/lib/cmake/PDFium/PDFiumConfig.cmake
	cp -ar ${_src_dir}/staging/include "${pkgdir}"/usr
	cp -ar ${_src_dir}/staging/lib "${pkgdir}"/usr
}
