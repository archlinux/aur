pkgname=oacapture
pkgver=1.0.0
pkgrel=1
pkgdesc="oaCapture is a planetary imaging application using Qt5"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('qt5-base')
url="http://www.openastroproject.org/oacapture/"
optdepends=('fxload: support for QHY5 cameras')

source=("http://www.openastroproject.org/wp-content/uploads/2016/06/oacapture-1.0.0.tar.bz2" "oacapture-qt5.diff")
sha1sums=('e7afbdb1fd3c095e4a8c52c2240c1fff4077e238' 'ba82f58bccac9898192ea10540219cfe1ae72cf5')

build() {
	cd "${pkgname}-${pkgver}"
	cd "ext/libusb"
	autoreconf --force --install
	cd "../libdc1394"
	autoreconf --force --install
	cd "../.."
	patch -Np1 < ${srcdir}/oacapture-qt5.diff
	autoreconf --force --install
	CXXFLAGS="-fPIC $CXXFLAGS" ./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	# removing FFMPEG install, it's already linked in static
	rm -rf ${pkgdir}/usr/include ${pkgdir}/usr/lib
}

