# Maintainer: xiretza <xiretza+aur@gmail.com>
pkgname=usb2sniffer-qt-git
_pkgname=usb2sniffer-qt
pkgver=r160.cf74d49
pkgrel=1
pkgdesc="LambdaConcept lcsniff software for USB2Sniffer hardware"
arch=(x86_64)
url="https://github.com/lambdaconcept/usb2sniffer-qt"
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
provides=('usb2sniffer-qt' 'lcsniff' 'lcsniff-git')
conflicts=('usb2sniffer-qt' 'lcsniff')
source=("git+https://github.com/lambdaconcept/usb2sniffer-qt"
        "git+https://github.com/Simsys/qhexedit2"
        "lcsniff.desktop")
sha256sums=('SKIP'
            'SKIP'
            'e5c124eb54c99e67cea9b8ffce278b40019f9b61de2e6a1081145680c1e7960e')

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"

	git submodule init
	git config submodule.qhexedit2.url "$srcdir/qhexedit2"
	git submodule update
	mkdir -p build
}

build() {
	cd "$_pkgname/build"

	qmake QMAKE_STRIP=: PREFIX="/usr" ../lcsniff.pro
	make
}

package() {
	cd "$_pkgname/build"
	make INSTALL_ROOT="$pkgdir" install

	cd "$srcdir"
	install -Dm644 "$_pkgname/icons/logo-alpha-small.png" "$pkgdir/usr/share/pixmaps/lcsniff.png"
	install -Dm644 "$srcdir/lcsniff.desktop" "$pkgdir/usr/share/applications/lcsniff.desktop"
}
