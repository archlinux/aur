# Maintainer: someoneelse <lllusion3418@gmail.com>

pkgname=fstl
pkgver=0.11.1
pkgrel=1
pkgdesc="A viewer for .stl files"
url="http://www.mattkeeter.com/projects/fstl/"
arch=('x86_64')
license=('MIT')
depends=('qt5-base')
makedepends=("icoutils" "cmake")
source=("https://github.com/mkeeter/fstl/archive/v${pkgver}.tar.gz"
	"fstl.desktop")
sha256sums=('b90d02743a1f76927d5d7c4373c3ebcf3da86d97362501035d504c7a008da5ca'
            '53d2a7911cacc1ca8e9fe823e8ecf2777c1158f51d2b909ebb106d976c70bec5')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake -B build \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev
	cmake --build build

	sed -n '/Copyright/,/PROVIDED/p' README.md >LICENSE

	pushd "exe"
	icotool --extract --index=6 --output=../fstl.png fstl.ico
	popd
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	DESTDIR="$pkgdir" cmake --install build

	install -D -m644 fstl.png "${pkgdir}/usr/share/pixmaps/fstl.png"

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -D -m644 "${srcdir}/fstl.desktop" "${pkgdir}/usr/share/applications/fstl.desktop"

}
