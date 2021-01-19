pkgname=oacapture
pkgver=1.8.0
pkgrel=2
pkgdesc="A planetary imaging application using Qt5"
provides=("oacapture")
conflicts=("oacapture-git")
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('qt5-base' 'qt5-tools' 'cfitsio' 'autoconf-archive' 'sdl' 'libdc1394')
url="http://www.openastroproject.org/oacapture/"
optdepends=('fxload: support for QHY5 cameras')

source=("https://github.com/openastroproject/openastro/archive/v${pkgver}.tar.gz" "oacapture-slash-lib.diff" "libhidapi-configure-ac.diff")
sha256sums=("25dfa4e16ba5e19028d40313eadf4cc1734a6f123572cb8be484bd009f06067d" "813e80ef718e0e9887c5293ef435b1cff43d03ae8c2bb6a2d53f0bbbf4a284f2" "204c6d6dea820fa9564026df4d0bd15d866bd9904d0afd3e51c3fd7ddf69a844")

build() {
	cd "openastro-${pkgver}"
	patch -Np1 < ${srcdir}/oacapture-slash-lib.diff
	patch -Np1 < ${srcdir}/libhidapi-configure-ac.diff
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "openastro-${pkgver}"
	make DESTDIR="${pkgdir}" install

	# remove unwanted files
	rm -rf ${pkgdir}/usr/include
	rm -rf ${pkgdir}/usr/lib/*.a
	rm -rf ${pkgdir}/usr/lib/pkgconfig
	rm -rf ${pkgdir}/usr/share/doc/hidapi
}
