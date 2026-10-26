# shellcheck disable=SC2034,SC2154,SC2164
## Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>
## Contributor: Jameson Pugh <imntreal@gmail.com>
## Contributor: Joshua Snyder <madsciencecoder@gmail.com>
## Contributor: Thaodan <theodorstormgrade@gmail.com>

pkgname='qt-virt-manager-v2'
_pkgname="${pkgname%-v2}"
url='https://github.com/F1ash/qt-virt-manager'
makedepends=('cmake' 'qt5-tools' 'spice-protocol')
arch=('x86_64')
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
pkgrel=5
pkgver=0.72.99
source=("https://github.com/F1ash/qt-virt-manager/archive/${pkgver}.tar.gz")
sha256sums=('06b451d32ea427c17a5520f26adfc49848ea348a8fa3b6cf73d74813e6cd0b5f')
depends=('qt5-svg' 'qtermwidget5' 'spice-gtk' 'libvirt' 'scrub' 'qt5-multimedia' 'hicolor-icon-theme' 'x11-ssh-askpass' 'libvncserver')
pkgdesc="Qt5 Virtual Machine Manager provides a graphical tool for administering virtual machines for QEMU/KVM, Xen, and LXC and other Virtual Entities.
Uses libvirt as the backend management API."
conflicts=('virt-manager-qt5')
replaces=('virt-manager-qt5')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed -i '/find_package(KRDC/d' CMakeLists.txt
	sed -i 's|#include <krdc/remoteview.h>|#include "remoteview.h"|' \
		src/vm_viewer/krdc_vnc_qtonly/vncclientthread.h

	mkdir -p "${srcdir}/${_pkgname}-${pkgver}/build"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}/build"
	export CXXFLAGS="$CXXFLAGS -std=c++11"

	if which ninja &> /dev/null; then
		_ninja="-G Ninja"
	fi
	msg "$_ninja"
	cmake $_ninja \
		-DBUILD_QT_VERSION=5 \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
		..
	if [[ -z $_ninja ]]; then
		make
	else
		ninja
	fi
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/build"
	if which ninja &> /dev/null; then
		DESTDIR=${pkgdir} ninja install
	else
		make install DESTDIR=${pkgdir}
	fi

	install -Dm644 ../LICENSE \
		-t "$pkgdir/usr/share/licenses/$_pkgname/"
	install -Dm644 ../Licenses \
		"$pkgdir/usr/share/licenses/$_pkgname/ICONS"
}

# vim: set ts=2 sw=2 ft=sh noet:
