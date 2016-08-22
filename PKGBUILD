# Contributors Arno Rehn <arno@arnorehn.de>, Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>, Jocelyn Turcotte <turcotte.j@gmail.com>

buildarch=16

pkgname=qt5-qpa-rpi-plugin
pkgver=5.7.0
pkgrel=1
pkgdesc="Qt5 eglfs Broadcom device integration for the Raspberry Pi"
url="http://qt.io"
arch=('armv6h' 'armv7h')
license=('GPL3' 'LGPL' 'FDL' 'custom')
depends=('qt5-base' 'mtdev')

source=("http://download.qt-project.org/official_releases/qt/${pkgver%.*}/${pkgver}/submodules/qtbase-opensource-src-${pkgver}.tar.xz")
md5sums=('184f9460b40752d71b15b827260580c2')

noextract=("qtbase-opensource-src-${pkgver}.tar.xz")

prepare() {
	cd "${srcdir}"
	tar xJvf qtbase-opensource-src-${pkgver}.tar.xz qtbase-opensource-src-${pkgver}/src/plugins/platforms/eglfs qtbase-opensource-src-${pkgver}/LGPL_EXCEPTION.txt qtbase-opensource-src-${pkgver}/.qmake.conf
}

build() {
	cd "${srcdir}/qtbase-opensource-src-${pkgver}/src/plugins/platforms/eglfs/deviceintegration/eglfs_brcm"
	qmake INCLUDEPATH+=/opt/vc/include QMAKE_LIBDIR+=/opt/vc/lib
	make
}

package() {
	cd "${srcdir}/qtbase-opensource-src-${pkgver}/src/plugins/platforms/eglfs/deviceintegration/eglfs_brcm"
	make INSTALL_ROOT="${pkgdir}" install

	cd "${srcdir}/qtbase-opensource-src-${pkgver}"
	install -D -m644 LGPL_EXCEPTION.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}
