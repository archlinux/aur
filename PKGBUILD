# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Thomas Nordenmark <t.nordenmark@gmail.com>

pkgname=compton-conf
pkgver=0.2.1
pkgrel=3
pkgdesc='A graphical configuration tool for Compton X composite manager'
arch=('i686' 'x86_64')
url='https://github.com/lxde/compton-conf'
license=('LGPL2.1')

depends=('qt5-base' 'libconfig')
makedepends=('cmake' 'qt5-tools' 'lxqt-build-tools')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")

source=(
	"https://downloads.lxqt.org/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc}
	'desktop_entry.patch'
)
validpgpkeys=(
	'7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3' # Alf Gaida
)
sha256sums=(
	'f97a6d992adff317614785229d14eefa5dff350ecd5d608d6a30ee993adfa1dd'
	'SKIP' # GPG signature
	'c5ba13d98faae4efe2ec4a5aff8def3a35fae4f2762a6395847ae8734964d5e3'
)

prepare() {
	# Patch desktop entry
	cd "${srcdir}"/${pkgname}-${pkgver}
	patch -p1 < ../desktop_entry.patch

	# Build directory
	mkdir -p "${srcdir}"/build
}

build() {
	# Building package
	cd "${srcdir}"/build
	cmake ../${pkgname}-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	# Installing package
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}
