# Maintainer: Michael Zech <keldrin at web dot de>
# Contributor: Stephan Eisvogel <eisvogel at seitics dot de>
# Contributor: Jouni Rinne <l33tmmx swirlything gmail dot com>
# Contributor: Deon Spengler <deon at spengler dot co dot za>
pkgname='labrador-git'
pkgver=r583.2cc0678b
pkgrel=1
epoch=1
pkgdesc='Qt5 GUI for EspoTek all-in-one USB oscilloscope/ signal generator/ PSU/ logic analyzer/ multimeter'
arch=('x86_64')
url="https://github.com/espotek/labrador"
license=('GPL')
depends=('qt5-base>=5.15.7' 'hicolor-icon-theme' 'fftw')
makedepends=('git')
optdepends=('dfu-programmer: USB programmer for Atmel chips'
	    'dfu-util: USB firmware down/uploader')
conflicts=('labrador' 'libdfuprog')
install="${pkgname}.install"
source=('labrador-git::git+https://github.com/espotek/labrador#branch=master'
	'libdfuprog::git+https://github.com/EspoTek/libdfuprog'
	'labrador-git.install'
	'labrador-git.patch')
md5sums=('SKIP'
         'SKIP'
         'cbfdce82698b92281f31c314373c4b6b'
         'e7ddb103fed89acd20408a959a5ad9ba')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/libdfuprog"
	chmod +x libdfuprog_make_linux
	# ugly workaround to get rid of pre-compiled libfduprog
	rm -rf "${srcdir}/${pkgname}/Desktop_Interface/build_linux/libdfuprog"

	cd "$srcdir/${pkgname}"
	patch -p1 < ../../labrador-git.patch
}

build() {
	cd "${srcdir}/libdfuprog"
	./bootstrap.sh
	./libdfuprog_make_linux
	# ugly workaround part II: get fresh libfduprog in place
	install -Dm644 "${srcdir}/libdfuprog/src/libdfuprog-0.9.so" \
		"${srcdir}/${pkgname}/Desktop_Interface/build_linux/libdfuprog/lib/x64/libdfuprog-0.9.so"	
	install -Dm644 "${srcdir}/libdfuprog/src/main.h" \
		"${srcdir}/${pkgname}/Desktop_Interface/build_linux/libdfuprog/include/libdfuprog.h"	

	cd "$srcdir/${pkgname}/Desktop_Interface"
	qmake -makefile Labrador.pro
	make
}

check() {
	cd "$srcdir/${pkgname}/Desktop_Interface"
	make -k check
}

package() {
	cd "$srcdir/${pkgname}/Desktop_Interface"
	make INSTALL_ROOT="$pkgdir" install
}
