pkgname=oacapture
pkgver=1.7.0
pkgrel=1
pkgdesc="A planetary imaging application using Qt5"
provides=("oacapture")
conflicts=("oacapture-git")
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('qt5-base' 'qt5-tools' 'cfitsio' 'autoconf-archive' 'sdl' 'libdc1394')
url="http://www.openastroproject.org/oacapture/"
optdepends=('fxload: support for QHY5 cameras')

source=("https://github.com/openastroproject/openastro/archive/v${pkgver}.tar.gz" "oacapture-slash-lib.diff" "libASICamera_pthread_fix.diff")
sha256sums=("898fbb533dddc36369764198faf480f11265fb535a34f63f15b132eb8a718cd3" "813e80ef718e0e9887c5293ef435b1cff43d03ae8c2bb6a2d53f0bbbf4a284f2" "56a86e3ad5a46eb25fce7209e9242b51da6d1d56facedbfe7f062395758b1621")

build() {
	cd "openastro-${pkgver}"
	patch -Np1 < ${srcdir}/oacapture-slash-lib.diff
	patch -Np1 < ${srcdir}/libASICamera_pthread_fix.diff
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
