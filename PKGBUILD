# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=vv
pkgname=${_pkgname}-git
pkgver=1.4.0.r271.g24b75af3
pkgrel=3
pkgdesc='Image viewer for 2D, 2D+t, 3D and 3D+t (or 4D) images'
arch=('x86_64')
url='https://www.creatis.insa-lyon.fr/rio/vv/'
license=('BSD')
depends=('insight-toolkit' 'vtk' 'qt5-base' 'gdal' 'unixodbc')
provides=('vv')
conflicts=('vv' 'vv-bin')
makedepends=('cmake')
source=("git+https://github.com/open-vv/vv.git"
		"vv.desktop")
sha512sums=('SKIP'
            '7623abe987c52e2fee5ab8eec103c5f38276cc0f41365442db67e1c5e88442842edafa6b7cb9083e006b60b901a6b5b84fc406994cd0f128faae70e71732c094')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | \
	  sed 's/^v//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_pkgname"
	
	mkdir build || :
	cd build

	cmake .. \
		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DBUILD_TESTING:BOOL=OFF
}

build() {
    cd "$srcdir/$_pkgname/build"

	make
}

package() {
    cd "$srcdir/$_pkgname/build"
	make install DESTDIR="$pkgdir"

	install -D -m644 \
		"${srcdir}/${_pkgname}/vv/icons/ducky.png" \
		"${pkgdir}/usr/share/icons/hicolor/128x128/apps/vv.png"
	install -D -m755 \
		"${srcdir}/vv.desktop" \
		"${pkgdir}/usr/share/applications/vv.desktop"
	install -D -m644 \
		"${srcdir}/${_pkgname}/LICENSE.txt" \
		"${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

