# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com> 
# Contributor: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>
# Contributor: Sergej Pupykin
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname="vdeplug4"
pkgname="$_pkgname-git"
pkgver=v4.0.1.r16.37c33e0
pkgrel=1

pkgdesc="VDE: Virtual Distributed Ethernet. Plug your VM directly to the cloud"
arch=('x86_64')
url="https://github.com/rd235/$_pkgname"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
groups=('virtualsquare')
depends=('s2argv-execs')
makedepends=('git' 'cmake')
provides=("$_pkgname" 'vde2')
conflicts=("$_pkgname" 'vde2')
source=(
	"git+$url.git"
	dhcpd.conf.sample
	iptables.rules.sample
	vde-config.sample
	vde-connection.sample
)
install=vde2.install
options=(!makeflags)
sha256sums=(
	'SKIP'
	'da0e2766dc63069da929c28126831ad5fdddcc4a04105a21217d78832c7ca1bc'
	'99076d7466cd99673dbe91ef83865187e7868177959b38e125df63eea957f83e'
	'5727c215646333c37b26388146cd3e6b3814b88d60d54051d7da99e00c0aef87'
	'5139110ed6d5d1174bf12971512dac5196d9d07df46dd393d7b1cd083118fe9b'
)

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}/"
	cmake -S . -B build/ \
		-D'CMAKE_INSTALL_PREFIX=/usr'
}

build() {
	cd "${srcdir}/${_pkgname}/build/"
	make
}

package() {
	cd "${srcdir}/"

	install -Dm 644 vde-config.sample -t "${pkgdir}/etc/vde/vde-config.sample"
	install -Dm 644 vde-connection.sample -t "${pkgdir}/etc/vde/vde-connection.sample"
	install -Dm 644 dhcpd.conf.sample -t "${pkgdir}/usr/share/vde2/dhcpd.conf.sample"
	install -Dm 644 iptables.rules.sample -t "${pkgdir}/usr/share/vde2/iptables.rules.sample"

	cd "${_pkgname}/"
	install -Dm 644 COPYING -T "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm 644 COPYING.libvdeplug4 -T "${pkgdir}/usr/share/licenses/libvdeplug4/LICENSE"

	cd "build/"
	make DESTDIR="$pkgdir/" install

	cd "${pkgdir}/usr/lib/"
	ln -s libvdeplug.so.4.0.0 libvdeplug.so.3
	ln -s libvdeplug_mod.so.4.0.0 libvdeplug_mod.so.3
}
