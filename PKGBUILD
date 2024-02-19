# Maintainer:
pkgname=pdfium-binaries-v8
pkgver=6295
pkgrel=1
pkgdesc='PDFium binaries with V8 and XFA built with scripts from pdfium-binaries'
arch=('x86_64')
url='https://github.com/bblanchon/pdfium-binaries'
license=('Apache')
makedepends=('git' 'ninja' 'cmake' 'pkgconf' 'python' 'procps-ng')
provides=('libpdfium')
conflicts=('libpdfium-nojs' 'pdfium-binaries')

source=(
	"https://github.com/bblanchon/pdfium-binaries/archive/refs/tags/chromium/${pkgver}.tar.gz"
	"001-apt-get.patch"
)

sha512sums=(
	"985637fadebf920c53f6f661ec39aeca3ecb7a7a47ded06ca55f995b624da4379d728ceca24e15748e5fe07f04e38d662a4494a78dc4f0606d08b9a840ac7b7b"
	"195ba1bc0faf933343b753bc8cb3b54b73f02b8400202d461807a8aecc1b06cfe2bff200c614b7bd851650a2eb83b1bdcb54fc6cf49c250b605fb61cbe3c5008"
)


prepare() {
	cd "${srcdir}"/pdfium-binaries-chromium-${pkgver}
	patch --forward --strip=1 --input="${srcdir}/001-apt-get.patch"
}

build() {
	cd "${srcdir}"/pdfium-binaries-chromium-${pkgver}
	./build.sh -b chromium/${pkgver} -j linux x64
}

package() {
	local _src_dir="${srcdir}"/pdfium-binaries-chromium-${pkgver}
	install -Dm644 ${_src_dir}/staging/LICENSE "${pkgdir}"/usr/share/licenses/pdfium/LICENSE
	install -Dm644 ${_src_dir}/staging/PDFiumConfig.cmake "${pkgdir}"/usr/lib/cmake/PDFium/PDFiumConfig.cmake
	cp -ar ${_src_dir}/staging/include "${pkgdir}"/usr
	cp -ar ${_src_dir}/staging/lib "${pkgdir}"/usr
}
