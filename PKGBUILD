# Maintainer: Alfredo Ramos <alfredo.ramos@tutanota.com>

_pkgname=nulloy
pkgname=${_pkgname}-git
pkgver=0.9.5.11.g97342d8
pkgrel=1
pkgdesc='A music player with a waveform progress bar. Qt5 development version.'
arch=('i686' 'x86_64')
url='http://nulloy.com/'
license=('GPL')

depends=(
	'qt5-script' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly'
	'taglib' 'hicolor-icon-theme'
)
makedepends=('qt5-tools' 'git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=('git+https://github.com/nulloy/nulloy.git')
sha512sums=('SKIP')

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

	# Fix icon installation
	for size in 16 22 24 32 48 64 96 128
	do
		source_file=src/icons/icon-${size}.png
		dest_file="${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png

		if [[ -f "${source_file}" && ! -f "${dest_file}" ]]; then
			cp -a "${source_file}" "${dest_file}"
		fi
	done
}
