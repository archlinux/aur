# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=equalx
pkgver=0.7.1
pkgrel=1
pkgdesc="makes you easily write equations in LaTeX and preview them in real-time. "
url="http://equalx.sourceforge.net"
depends=("qt4" "exempi" "texlive-bin" "poppler")
optdepends=("ghostscript: to export pdf and ps")
license=("GPL3")
source=("http://downloads.sourceforge.net/project/${pkgname}/EqualX-$(echo ${pkgver} | grep -Po "^[0-9]\.[0-9]")/${pkgname}-${pkgver}.tar.gz"
        "qmake-install.patch")
arch=('i686' 'x86_64') 
install=equalx.install
md5sums=('f7164b254f25fb265388b46e3fb8e464'
         '99f99f9257f25426f9b0e38a95ab8c7f')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "$srcdir/qmake-install.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	qmake-qt4 ${pkgname}.pro
	make
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
	install -Dm755 resources/equalx.desktop \
		"$pkgdir"/usr/share/applications/equalx.desktop
	for _size in 16 22 24 32 48 64 128; do
		install -Dm644 resources/icons/equalx/equalx-${_size}x${_size}.png \
			"$pkgdir"/usr/share/icons/hicolor/${_size}x${_size}/apps/equalx-icon.png
	done
	install -Dm644 resources/icons/equalx/equalx.svg \
		"$pkgdir"/usr/share/icons/hicolor/scalable/apps/equalx.svg
}
