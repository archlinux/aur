# Maintainer: spider-mario <spidermario@free.fr>
pkgname=('qt4-flif' 'qt5-flif' 'flif-mime')
pkgbase=qt-flif-plugin
pkgver=r16.9272881
pkgrel=1
pkgdesc="Enables FLIF support in Qt applications"
arch=('x86_64')
url="https://github.com/spillerrec/qt-flif-plugin"
license=('GPL')
depends=('flif')
makedepends=('git' 'qt4' 'qt5-base')
source=('git+https://github.com/spillerrec/qt-flif-plugin.git#commit=9272881133c48d55d44e8a08cdafecff3f37315c'
        'include.patch')
sha512sums=('SKIP'
            '891e787f65738c47ae788b5ca7fe15fe056b911f77dbe6d741c4c7b0a25dd2cda5ba0e6b22d1ff534912cf0deb670d6403a02d2dc6a3a3f3e0a0e898d974d23f')

prepare() {
	cd "$srcdir/$pkgbase"
	git apply -3 "$srcdir"/include.patch
}

build() {
	mkdir -p build-qt4 build-qt5

	cd build-qt4
	qmake-qt4 "$srcdir/$pkgbase"
	make

	cd ../build-qt5
	qmake-qt5 "$srcdir/$pkgbase"
	make
}

package_flif-mime() {
	pkgdesc="MIME file type for the FLIF image format"
	arch=('any')
	depends=()

	cd "$pkgbase"/configuration
	install -Dm644 x-flif.xml "$pkgdir"/usr/share/mime/packages/x-flif.xml
}

package_qt4-flif() {
	pkgdesc="Enables FLIF support in Qt4 applications"
	depends+=('flif-mime' 'qt4')

	cd build-qt4
	install -Dm755 libflif.so "$pkgdir"/usr/lib/qt4/plugins/imageformats/libflif.so

	cd "$srcdir/$pkgbase"/configuration
	install -Dm644 imagethumbnail-flif.desktop "$pkgdir"/usr/share/kde4/services/imagethumbnail-flif.desktop
	install -Dm644 qimageioplugins/x-flif.desktop "$pkgdir"/usr/share/kde4/services/qimageioplugins/x-flif.desktop
}

package_qt5-flif() {
	depends+=('flif-mime' 'qt5-base')

	cd build-qt5
	install -Dm755 libflif.so "$pkgdir"/usr/lib/qt/plugins/imageformats/libflif.so

	cd "$srcdir/$pkgbase"/configuration
	install -Dm644 imagethumbnail-flif.desktop "$pkgdir"/usr/share/kservices5/imagethumbnail-flif.desktop
	install -Dm644 qimageioplugins/x-flif.desktop "$pkgdir"/usr/share/kservices5/qimageioplugins/x-flif.desktop
}
