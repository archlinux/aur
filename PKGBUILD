# Maintainer : MorsMortium <morsmortium@disroot.org>
# Contributor: Ikosse <andre.lofgren@mailbox.org>

_pkgname=harbour-amazfish
pkgname=${_pkgname}-git
pkgver=r2014.b37db67
pkgrel=1
pkgdesc="Companion application for Huami Devices and the Pinetime Infinitime"
arch=('x86_64' 'aarch64')
url="https://github.com/piggz/${_pkgname}"
license=('GPL-3.0-only')
depends=(
	'qt5-base'
	'karchive5'
	'kdb'
	'kcontacts5'
	'qt5-location'
	'qt5-connectivity'
	'qtmpris'
	'nemo-qml-plugin-dbus'
	'kirigami2'
	'bluez-qt5'
)
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"
	git submodule init
	git submodule update
}

build() {
	cd "${srcdir}/${pkgname}"
	mkdir -p build
	cd build
	cmake -DFLAVOR=kirigami -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${srcdir}/${pkgname}/build"
	cmake --install . --prefix "${pkgdir}/usr"

	install -D -m644 "./daemon/harbour-amazfish.service" \
		"${pkgdir}/usr/lib/systemd/user/harbour-amazfish.service"
}
