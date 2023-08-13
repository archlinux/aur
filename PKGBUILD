# Maintainer:
pkgname=pdfium-binaries
pkgver=5934
pkgrel=1
pkgdesc='PDFium binaries built with scripts from pdfium-binaries'
arch=('x86_64')
url='https://github.com/bblanchon/pdfium-binaries'
license=('Apache')
makedepends=('git' 'ninja' 'cmake' 'pkgconf')
provides=('libpdfium')
conflicts=('libpdfium-nojs' 'pdfium-binaries-v8')

source=(
	"https://github.com/bblanchon/pdfium-binaries/archive/refs/tags/chromium/${pkgver}.tar.gz"
	"001-apt-get.patch"
)

sha512sums=(
	"e850ab21b2384a0f00eb758625b507c0c47bd7c2885709fbf261e434f81a0a9b48238fd6030a72bfa1442ff3250cb4333588a393898a632a7fca3e32399868d3"
	"195ba1bc0faf933343b753bc8cb3b54b73f02b8400202d461807a8aecc1b06cfe2bff200c614b7bd851650a2eb83b1bdcb54fc6cf49c250b605fb61cbe3c5008"
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
