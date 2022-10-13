# Maintainer:
pkgname=pdfium-binaries
pkgver=5351
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
	"001-apt-get.patch"
)

sha512sums=(
	"af321a07ed12064c8e98618502c467b8311772cde44905d63af278ffeb15b54a9939fe7241746ccf0d41563391ace511ac56662139c8d89386d9224f59820dc7"
	"99c314134c0d313b30351a85dc2361aba6bff7fcda186c9304a741a047f89a70160d514bf9c2f8087d435158b620fc6633e6fc412778e069af13ebec64845ce2"
)

build() {
	_src_dir="${srcdir}"/pdfium-binaries-chromium-${pkgver}
	cd ${_src_dir}

	patch --forward --strip=1 --input="${srcdir}/001-apt-get.patch"

	./build.sh -b chromium/${pkgver} linux x64
}

package() {
	_src_dir="${srcdir}"/pdfium-binaries-chromium-${pkgver}
	install -Dm644 ${_src_dir}/staging/LICENSE "${pkgdir}"/usr/share/licenses/pdfium/LICENSE
	install -Dm644 ${_src_dir}/staging/PDFiumConfig.cmake "${pkgdir}"/usr/lib/cmake/PDFium/PDFiumConfig.cmake
	cp -ar ${_src_dir}/staging/include "${pkgdir}"/usr
	cp -ar ${_src_dir}/staging/lib "${pkgdir}"/usr
}
