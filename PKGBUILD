pkgname=oacapture-git
_gitname=openastro
pkgver=v1.8.0.1098.adef9b5b
pkgrel=1
pkgdesc="A planetary imaging application using Qt5"
provides=("oacapture")
conflicts=("oacapture")
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('qt5-base' 'qt5-tools' 'cfitsio' 'autoconf-archive' 'sdl' 'libdc1394')
url="http://www.openastroproject.org/oacapture/"
optdepends=('fxload: support for QHY5 cameras')
source=("git+https://github.com/openastroproject/openastro.git" "oacapture-slash-lib.diff" "libhidapi-configure-ac.diff")
sha256sums=("SKIP" "813e80ef718e0e9887c5293ef435b1cff43d03ae8c2bb6a2d53f0bbbf4a284f2" "204c6d6dea820fa9564026df4d0bd15d866bd9904d0afd3e51c3fd7ddf69a844")
provides=($_gitname=$pkgver)
conflicts=($_gitname)
replaces=($_gitname)

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "%s.%s.%s" "$(git describe --tags | cut -d "-" -f1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "openastro"
	patch -Np1 < ${srcdir}/oacapture-slash-lib.diff
	patch -Np1 < ${srcdir}/libhidapi-configure-ac.diff
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "openastro"
	make DESTDIR="${pkgdir}" install

	# remove unwanted files
	rm -rf ${pkgdir}/usr/include
	rm -rf ${pkgdir}/usr/lib/*.a
	rm -rf ${pkgdir}/usr/lib/pkgconfig
	rm -rf ${pkgdir}/usr/share/doc/hidapi
}
