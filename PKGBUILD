# Maintainer:
pkgname=pdfium-binaries-v8
pkgver=6309
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
	"139a95347a697d2a616e70f70d430bebda345c7b6936541f2f4f53d86ff7393ffc322521270cec2d7faba60262b22094da967d74417b94b497c9271e874843ee"
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
