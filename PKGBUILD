# Maintainer:
pkgname=pdfium-binaries-v8
pkgver=7428
pkgrel=1
pkgdesc='PDFium binaries with V8 and XFA built with scripts from pdfium-binaries'
arch=('x86_64')
url='https://github.com/bblanchon/pdfium-binaries'
license=('Apache')
makedepends=('git' 'ninja' 'cmake' 'pkgconf' 'python' 'procps-ng' 'lsb-release')
provides=('libpdfium')
conflicts=('libpdfium-nojs' 'pdfium-binaries')

source=(
	"https://github.com/bblanchon/pdfium-binaries/archive/refs/tags/chromium/${pkgver}.tar.gz"
	"001-apt-get.patch"
	"002-unsupported.patch"
	"003-apt-update.patch"
)

sha512sums=(
	"f548c6d9394c376a4e9e837e9f6063cc7a1b93a7723cd398da7b1ea8d065b4188f76c75f1768153688a55fa630af253b848cb1445d23d778baf69961b4e53890"
	"14d6ee2c8b00f8a9e9c56eaa0190cee3975ff64b0e98ae407aab27350cec86ae836b3f8b011331b5added9b67638896f9db4b189a1f28192b2954f259c816baa"
	"b70c5285219fb06eb84b06448f150f9356b740054845592af7aa7953214965d48557f55d2291517d75fde55a9e67f3b9c783b3f63accd22975dff815e5e21d3e"
	"38077b36c88bee8ecc6f4c5433c6805d0df15cf6d23d832d09af52a8f55a51cbe8adab0ddf827a6bc7ef7365e8ad21b0423f993c6240dacfa995b72ade834b8c"
)

prepare() {
	cd "${srcdir}"/pdfium-binaries-chromium-${pkgver}
	patch --forward --strip=1 --input="${srcdir}/001-apt-get.patch"
	patch --forward --strip=1 --input="${srcdir}/002-unsupported.patch"
}

build() {
	cp 003-apt-update.patch "${srcdir}"/pdfium-binaries-chromium-${pkgver}
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
