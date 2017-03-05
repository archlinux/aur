# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=juffed
pkgname=${_pkgname}-qt5-git
pkgver=0.10.85.g5ba17f9
pkgrel=5
pkgdesc='A lightweight cross-platform text editor. Development version.'
arch=('i686' 'x86_64')
url='http://juffed.com/'
license=('GPL2')

depends=('enca' 'qscintilla-qt5')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("${_pkgname}=${pkgver}" "${_pkgname}-plugins=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source=(
	"git+https://github.com/Mezomish/${_pkgname}.git"
	'fix_qscintilla.patch'
)
sha512sums=(
	'SKIP'
	'c2515c0f25a8a282af1242ecd5e3f98336e2226a935d56a826e724072cf4ae9961b34b6853a2b7204bff9428e8d7ae52fd158eaf438ee163e27953a5935d5293'
)

pkgver() {
	# Updating package version
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags 2>/dev/null | sed -r 's/^juffed-//;s/-/./g'
}

prepare() {
	# Make build directory
	mkdir -p "${srcdir}"/build

	# Fix QScintilla
	cd "${srcdir}"/${_pkgname}
	patch -Np1 < ../fix_qscintilla.patch
}

build() {
	# Building package
	cd "${srcdir}"/build
	cmake ../${_pkgname} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=/usr/lib \
		-DUSE_QT5=ON \
		-DUSE_ENCA=ON
	make
}

package() {
	# Installing package
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}
