# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=hexeditor
pkgname=${_pkgname}-git
pkgver=1.4.0.4.g9d32ae6
pkgrel=2
pkgdesc='A cross-platform Hex Editor. Development version.'
arch=('i686' 'x86_64')
url='https://github.com/chipmunk-sm/HexEditor'
license=('GPL')

depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=(
	'git+https://github.com/chipmunk-sm/HexEditor.git'
	'desktop_logo_cleanup.patch::https://patch-diff.githubusercontent.com/raw/chipmunk-sm/HexEditor/pull/3.patch'
)
sha512sums=(
	'SKIP'
	'2cab6d8792c3076a5abcdb37b5a87b2eb479df86ee6d715312b81ca9f9102fa5fd57fca066dddc291362e90e683b6fed220ab8baf16db4db825c2d0782ba2882'
)

pkgver() {
	# Update package version
	cd "${srcdir}"/HexEditor
	git describe --long --tags 2>/dev/null | sed -r 's/^v//;s/-/./g'
}

prepare() {
	# QMake install instructions
	cd "${srcdir}"/HexEditor
	patch -Np1 < ../desktop_logo_cleanup.patch

	# Create build directory
	mkdir -p "${srcdir}"/build
}

build() {
	# Build package
	cd "${srcdir}"/build
	qmake-qt5 ../HexEditor \
		QMAKE_CFLAGS="${CFLAGS}" \
		QMAKE_CXXFLAGS="${CXXFLAGS}" \
		CONFIG+=release \
		CONFIG+=c++14
	make
}

package() {
	# Install package
	cd "${srcdir}"/build
	make INSTALL_ROOT="${pkgdir}" install
}
