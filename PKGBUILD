# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=vv
pkgver=1.4.0
pkgrel=2
pkgdesc='Image viewer for 2D, 2D+t, 3D and 3D+t (or 4D) images'
arch=('x86_64')
url='https://www.creatis.insa-lyon.fr/rio/vv/'
license=('BSD')
depends=('insight-toolkit' 'vtk6' 'qt5-base' 'gdal' 'unixodbc')
conflicts=('vv-bin' 'vv-git')
makedepends=('cmake')
source=("https://github.com/open-vv/vv/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/open-vv/vv/master/vv/icons/ducky.png"
		"vv.desktop")
sha512sums=('c17a5f63fcb06ef8ba83e18256ebe1289f2d35bd8c175c0911751cfa3cfea9cb2f941125173107112d2781edb05fff7c260a954ba492a01870abc0b401f995cc'
            '92e9ab4b3bd601c01879f32c2a9358e295c554c9a4c9f47baa37a4cf6b6c9cc693881de5ef0658979a79779bd063849cef9aec0d7851dac01d2eff6cfffeba16'
            '7623abe987c52e2fee5ab8eec103c5f38276cc0f41365442db67e1c5e88442842edafa6b7cb9083e006b60b901a6b5b84fc406994cd0f128faae70e71732c094')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	
	mkdir build || :
	cd build

	cmake .. \
		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DBUILD_TESTING:BOOL=OFF \
		-DVTK_DIR:PATH='/opt/vtk6/lib/cmake/vtk-6.3'
}

build() {
    cd "$srcdir/$pkgname-$pkgver/build"

	make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
	make install DESTDIR="$pkgdir"

	install -D -m644 \
		"${srcdir}/ducky.png" \
		"${pkgdir}/usr/share/icons/hicolor/128x128/apps/vv.png"
	install -D -m755 \
		"${srcdir}/vv.desktop" \
		"${pkgdir}/usr/share/applications/vv.desktop"
	install -D -m644 \
		"${srcdir}/$pkgname-$pkgver/LICENSE.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

