# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=juffed
pkgname=${_pkgname}-qt5-git
pkgver=0.10.89.g3690b60
pkgrel=2
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
	"fix_qscintilla_lexer.patch::https://github.com/Mezomish/${_pkgname}/commit/5315aee51213a68f946b1c387d513bc2a5e67560.patch"
)
sha512sums=(
	'SKIP'
	'c2515c0f25a8a282af1242ecd5e3f98336e2226a935d56a826e724072cf4ae9961b34b6853a2b7204bff9428e8d7ae52fd158eaf438ee163e27953a5935d5293'
	'213548d50c0eecf4bb10b584c8715a8b72c79b7b39b40ad999eb6d52e4c857eead104e46987aec87c984de124e24319b4224094715a7a75e8fe2b8646a539865'
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

	# Fix QScintilla lexer
	# https://github.com/Mezomish/juffed/pull/102
	patch -Np1 < ../fix_qscintilla_lexer.patch
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
