# Maintainer: Maximilian Moser <maximilian.moser at tuwien dot ac dot at>

pkgname=tuvpn-gui
pkgver=0.2.1
pkgrel=2
pkgdesc="TUvpn GUI by the OpenTU community"
arch=("any")
url="https://gitlab.tuwien.ac.at/opentu/tuvpn-gui"
license=("MIT-0")
depends=("openconnect")
makedepends=("go>=1.24" "rsync" "tar" "make")
optdepends=()
provides=("tuvpn-gui")
conflicts=()
replaces=()
source=("https://gitlab.tuwien.ac.at/opentu/tuvpn-gui/-/archive/v${pkgver}/tuvpn-gui-v${pkgver}.tar.gz")
sha256sums=("2cc7ee35ec17b15ddf874d203de2cf5feb212d76e6917ee59502f92f36668dfc")

prepare() {
	tar xf "tuvpn-gui-v${pkgver}.tar.gz"

	# "update-icon-caches" is just a wrapper around "gtk-update-icon-cache":
	# https://manpages.debian.org/testing/gtk-update-icon-cache/update-icon-caches.8.en.html
	#
	# but it should be run after the install, not as part of the packaging
	sed -e 's/update-icon-caches/# gtk-update-icon-cache/' -i tuvpn-gui-v${pkgver}/Makefile
}

build() {
	cd "tuvpn-gui-v${pkgver}"
	target_arch=amd64
	if [[ "$(uname -m)" = "x86_64" ]]; then
		target_arch=amd64
	else
		target_arch=arm64
	fi
	make "tuvpn-elevator-${target_arch}" "tuvpn-gui-${target_arch}"
}

package() {
	# install the package to the temporary file system
	cd "tuvpn-gui-v${pkgver}"
	make PREFIX="${pkgdir}" install
	install -Dpm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	# makepkg -i complains about /usr/sbin already existing,
	# and on archlinux, "/usr/{s,}bin" are the same anyway
	mv "${pkgdir}/usr/sbin/tuvpn-elevator" "${pkgdir}/usr/bin/"
	rmdir "${pkgdir}/usr/sbin"
}

# vim: noexpandtab
