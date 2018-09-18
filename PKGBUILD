# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=hexeditor
pkgname=${_pkgname}-git
pkgver=1.4.0.0.gc5b7594
pkgrel=1
pkgdesc='A cross-platform Hex Editor'
arch=('i686' 'x86_64')
url='https://github.com/chipmunk-sm/HexEditor'
license=('GPL')

depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'git')
provides=("${pkgname}=${pkgver}")

source=(
	'git+https://github.com/chipmunk-sm/HexEditor.git'
	'qmake_install.patch'
)
sha512sums=(
	'SKIP'
	'ed0285385abbcabb82b19e9a3971a1836c6d3d8fc42a29baf35e7707f538a9e58b02220267e56a530e6905349c89307b5493f6876470280b2f3d201684b3613f'
)

pkgver() {
	# Update package version
	cd "${srcdir}"/HexEditor
	git describe --long --tags 2>/dev/null | sed -r 's/^v//;s/-/./g'
}

prepare() {
	# QMake install instructions
	cd "${srcdir}"/HexEditor
	patch -Np1 < ../qmake_install.patch

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
