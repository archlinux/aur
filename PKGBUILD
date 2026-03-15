# Maintainer: Maximilian Moser <maximilian.moser at tuwien dot ac dot at>

pkgname=tuvpn-gui
pkgver=0.2.1
pkgrel=1
pkgdesc="TUvpn GUI by the OpenTU community"
arch=("any")
url="https://gitlab.tuwien.ac.at/opentu/tuvpn-gui"
license=("MIT-0")
depends=("openconnect")
makedepends=("git" "go" "rsync")
optdepends=()
provides=("tuvpn-gui")
conflicts=()
replaces=()
source=("git+https://gitlab.tuwien.ac.at/opentu/tuvpn-gui")
sha256sums=("SKIP")

prepare() {
	# "update-icon-caches" is just a wrapper around "gtk-update-icon-cache":
	# https://manpages.debian.org/testing/gtk-update-icon-cache/update-icon-caches.8.en.html
	#
	# but it should be run after the install, not as part of the packaging
	sed -e 's/update-icon-caches/# gtk-update-icon-cache/' -i tuvpn-gui/Makefile
}

build() {
	cd tuvpn-gui
	make tuvpn-elevator-amd64 tuvpn-gui-amd64
}

package() {
	# install the package to the temporary file system
	cd tuvpn-gui
	make PREFIX="${pkgdir}" install
	install -Dpm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	# makepkg -i complains about /usr/sbin already existing,
	# and on archlinux, "/usr/{s,}bin" are the same anyway
	mv "${pkgdir}/usr/sbin/tuvpn-elevator" "${pkgdir}/usr/bin/"
	rmdir "${pkgdir}/usr/sbin"
}

# vim: noexpandtab
