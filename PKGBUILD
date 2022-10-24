# Maintainer: Kyle Guarco <kyleguarco55@gmail.com>

pkgbase=berry
_pkgname=berry
pkgname=berry-git
_pkgver=e5bcb3
pkgver=git+$_pkgver
pkgrel=1
pkgdesc="A healthy, bite-sized window manager written over the XLib Library"
url="https://github.com/JLErvin/berry"
arch=('x86_64')
license=('MIT')
makedepends=('gcc' 'make')
depends=('libx11' 'libxft' 'libxinerama')
source=(
	"git+https://github.com/JLErvin/berry.git"
	berry.desktop
)
sha256sums=('SKIP' 'SKIP')

prepare() {
	cd $_pkgname

	git checkout $_pkgver
}

build() {
	cd $_pkgname

	# Compile the window manager
	make
}

package() {
	cd ${_pkgname}/

	# These variables are used in the Makefile to create the file directories.
	PREFIX="/usr/local/"
	EXAMPLEPREFIX="/etc/xdg/berry/"
	
	# Set the variables and install the files.
    ./configure --prefix=/usr
    make DESTDIR="${pkgdir}" install
	
	# Install the examples (sample configuration files)
	mkdir -p "${pkgdir}/${EXAMPLEPREFIX}"
	install -D -m644 -t "${pkgdir}/etc/xdg/berry/" examples/*

	# Install berry.desktop
	cd -
	install -D -m644 -t "${pkgdir}/usr/share/applications/" berry.desktop
}

