## Maintainer: Jameson Pugh <imntreal@gmail.com>
## Contributor: Joshua Snyder <madsciencecoder@gmail.com>
## Contributor: Thaodan <theodorstormgrade@gmail.com>

pkgname='qt-virt-manager'
url='https://github.com/F1ash/qt-virt-manager'
makedepends=('cmake')
arch=('i686' 'x86_64')
license=('GPL2')
pkgrel=4
pkgver=0.72.99
source=("https://github.com/F1ash/qt-virt-manager/archive/${pkgver}.tar.gz")
sha256sums=('06b451d32ea427c17a5520f26adfc49848ea348a8fa3b6cf73d74813e6cd0b5f')
depends=('qt5-tools' 'qt5-svg' 'qtermwidget' 'spice-protocol' 'spice-glib' 'libvirt' 'scrub' 'qt5-multimedia' 'hicolor-icon-theme' 'x11-ssh-askpass' 'libvncserver' 'krdc')
pkgdesc="Qt5 Virtual Machine Manager provides a graphical tool for administering virtual machines for QEMU/KVM, Xen, and LXC and other Virtual Entities.
Uses libvirt as the backend management API."
conflicts=('virt-manager-qt5')
replaces=('virt-manager-qt5')

prepare() {
	mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	export CXXFLAGS="$CXXFLAGS -std=c++11"
	
	if which ninja &> /dev/null; then
		_ninja="-G Ninja"
	fi
	msg "$_ninja"
	cmake $_ninja \
		-DBUILD_QT_VERSION=5 \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		..
	if [[ -z $_ninja ]]; then
		make
	else
		ninja
	fi
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	if which ninja &> /dev/null; then
		DESTDIR=${pkgdir} ninja install
	else
		make install DESTDIR=${pkgdir}
	fi
}

# vim: set ts=2 sw=2 ft=sh noet:
