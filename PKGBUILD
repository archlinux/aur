# Maintainer: Timmy Yao <timmy.yao@outlook.com.au>
pkgname=gplates
pkgver=2.1.0
pkgrel=2
pkgdesc="Desktop software for the interactive visualisation of plate-tectonics"
arch=(x86_64)
url="https://www.gplates.org/"
license=('GPL')
depends=(qt4 qwt-qt4 gdal)
makedepends=(cmake glu glew python2 boost mesa cgal proj)
source=("https://downloads.sourceforge.net/project/gplates/gplates/2.1/gplates-$pkgver-unixsrc.tar.bz2"
        "no-ansi.patch"
        "icon.png"
        "gplates.desktop")
md5sums=('770758823ac480e40213a5b284d273fc'
         '57f9fb5b981456bdc874094d35488763'
         '938ef5a002905872a633665637a45d77'
         '1127c6a17abfa7500280fd09ce475a15')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -Np2 -i "$srcdir/no-ansi.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	QTDIR=/usr/lib/qt4 cmake \
		-DQT_QMAKE_EXECUTABLE=/usr/lib/qt4/bin/qmake \
		-DQT_UIC_EXECUTABLE=/usr/lib/qt4/bin/uic \
		-DQT_MOC_EXECUTABLE=/usr/lib/qt4/bin/moc \
		-DQT_HEADERS_DIR=/usr/include/qt4 \
		-DQT_QTCORE_INCLUDE_DIR:PATH=/usr/include/qt4/QtCore \
		-DQT_QTGUI_INCLUDE_DIR:PATH=/usr/include/qt4/QtGui \
		-DQT_QTNETWORK_INCLUDE_DIR:PATH=/usr/include/qt4/QtNetwork \
		-DQT_QTOPENGL_INCLUDE_DIR:PATH=/usr/include/qt4/QtOpenGL \
		-DQT_QTSQL_INCLUDE_DIR:PATH=/usr/include/qt4/QtSql \
		-DQT_QTSVG_INCLUDE_DIR:PATH=/usr/include/qt4/QtSvg \
		-DQT_QTTEST_INCLUDE_DIR:PATH=/usr/include/qt4/QtTest \
		-DQT_QTXMLPATTERNS_INCLUDE_DIR:PATH=/usr/include/qt4/QtXmlPatterns \
		-DQT_QTXML_INCLUDE_DIR:PATH=/usr/include/qt4/QtXml \
		-DQWT_INCLUDE_DIR:PATH=/usr/include/qwt-qt4 \
		-DQWT_LIBRARY:PATH=/usr/lib/libqwt-qt4.so \
		-DCMAKE_INSTALL_PREFIX="/usr/" \
		-DCMAKE_BUILD_TYPE=Release \
		.
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	install "${srcdir}/icon.png" -t "${pkgdir}/usr/share/${pkgname}"
	install -Dm644 "${srcdir}/gplates.desktop" -t "${pkgdir}/usr/share/applications"
}

