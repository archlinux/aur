# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=nulloy
pkgname=${_pkgname}-git
pkgver=0.8.2.pre46.40.gd3534e7
pkgrel=1
pkgdesc='A music player with a waveform progress bar. Qt5 development version.'
arch=('i686' 'x86_64')
url='http://nulloy.com/'
license=('GPL')

depends=(
	'qt5-script' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'taglib'
	'hicolor-icon-theme' 'desktop-file-utils'
)
makedepends=('qt5-tools' 'git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=(
	'git+https://github.com/nulloy/nulloy.git#branch=qt5'
	'fix_libdir.patch'
)
sha512sums=(
	'SKIP'
	'SKIP'
)

pkgver() {
	# Update package version
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags 2>/dev/null | sed -r 's/^v//;s/-/./g'
}

prepare() {
	# Create build directory
	mkdir -p "${srcdir}"/build
	cd "${srcdir}"/build
	cp -R "${srcdir}"/${_pkgname}/* ./

	# Fix LIBDIR
	patch -Np1 < ../fix_libdir.patch
}

build() {
	# Build package
	cd "${srcdir}"/build
	./configure \
		--prefix /usr \
		--libdir lib \
		--no-update-check
	make
}

package() {
	# Install package
	cd "${srcdir}"/build
	make INSTALL_ROOT="${pkgdir}" install
}
