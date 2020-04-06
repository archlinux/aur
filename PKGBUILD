# Maintainer: xiretza <xiretza+aur@gmail.com>
pkgname=usb2sniffer-qt-git
_pkgname=usb2sniffer-qt
pkgver=r156.e5eb82c
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
        "lcsniff.desktop"
        "0001-Fix-build-failure-due-to-missing-QKeyEvent-header.patch"
        "0002-Honour-PREFIX-variable-for-installation.patch")
sha256sums=('SKIP'
            'SKIP'
            'e5c124eb54c99e67cea9b8ffce278b40019f9b61de2e6a1081145680c1e7960e'
            '0bac7306cfaf7a5022de89c1c1f9ddaf6bbc5aa1c98402590dd1827fd318a7e0'
            '593ae39285a8b556a1372e3eaa036fae0a2a99fc8ed83f141f0d7464ed34cc90')

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"

	patch -p1 < "$srcdir/0001-Fix-build-failure-due-to-missing-QKeyEvent-header.patch"
	patch -p1 < "$srcdir/0002-Honour-PREFIX-variable-for-installation.patch"

	git submodule init
	git config submodule.qhexedit2.url "$srcdir/qhexedit2"
	git submodule update
	mkdir build
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
