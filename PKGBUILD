# Maintainer: Ricardo Gonçalves <ricardompgoncalves@gmail.com>

pkgname=qmmp-plugin-youtube
pkgver=0.3.2
pkgrel=3
pkgdesc="Plugin for Qt-based Multimedia Player (Qmmp) to search and play musics directly from YouTube"
arch=('i686' 'x86_64')
url="https://github.com/rigon/qmmp-plugin-youtube"
license=('GPL')
depends=('qmmp' 'python>=3.6' 'youtube-dl' 'qjson' 'pythonqt>=3.1-2')
makedepends=('qt5-tools' 'qt5-base' 'make' 'gcc' 'fakeroot')
source=("https://github.com/rigon/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('3fffbdf110c847942f7ce05fe373e57f')

build() {
	cd "${pkgname}-${pkgver}"/

	# Fix missing libPythonQt.so
	if [ ! -e "/usr/lib/libPythonQt.so" ]; then
		libpython=$(find /usr/lib/ -type f -iname libpythonqt* ! -iname libPythonQt_QtAll*)
		ln -svf "${libpython}" libPythonQt.so

		qmake QMAKE_LIBDIR_FLAGS="-L $PWD"
	else
		qmake
	fi

	make -j4
}

package() {
	mkdir -pv "${pkgdir}/usr/lib/qmmp/Transports" "${pkgdir}/usr/lib/qmmp/General"
	cp "${pkgname}-${pkgver}/youtube/libyoutube.so" "${pkgdir}/usr/lib/qmmp/Transports/"
	cp "${pkgname}-${pkgver}/youtubeui/libyoutubeui.so" "${pkgdir}/usr/lib/qmmp/General/"
}

