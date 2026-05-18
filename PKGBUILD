# Maintainers: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
#              Ivan Feign (Aiyahhh) <ivan.feign@gmail.com>

pkgname=linux-arctis-manager-git
_pkgname=Linux-Arctis-Manager
pkgver=r1.e838443
pkgrel=1
pkgdesc="An open-source replacement for SteelSeries GG, to manage your Arctis headset on Linux!"
arch=('x86_64')
url="https://github.com/elegos/Linux-Arctis-Manager"
license=('GPL-3.0-only')
depends=(python-pulsectl python-pyudev python-dbus-next pyside6 python-pyusb python-ruamel-yaml)
conflicts=('linux-arctis-manager')
provides=("linux-arctis-manager=${pkgver}")
makedepends=(uv python-installer git)
checkdepends=()
source=("git+https://github.com/elegos/$_pkgname"
		"arctis-manager.service")
install="linux-arctis-manager.install"
sha256sums=('SKIP'
            '3ad9e074ffa85ead9089d4b16f2974d0a9710d7e428cdf61744e6d1cd7b19d6c')

pkgver() {
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    uv build
}

package() {
    cd "${_pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl

	# Generating and installing udev rules
	install -d "$pkgdir"/usr/lib/udev/rules.d/
	PYTHONPATH=${pkgdir}/usr/lib/python3.14/site-packages $pkgdir/usr/bin/lam-cli udev write-rules --rules-path "$pkgdir"/usr/lib/udev/rules.d/91-steelseries-arctis.rules

	# Installing desktop entries
	install -D -m644 src/linux_arctis_manager/desktop/ArctisManager.desktop "$pkgdir"/usr/share/applications/ArctisManager.desktop
	install -D -m644 src/linux_arctis_manager/desktop/ArctisManagerSystray.desktop "$pkgdir"/usr/share/applications/ArctisManagerSystray.desktop

	# Adding systemd Service
	install -D -m644 ${srcdir}/arctis-manager.service ${pkgdir}/usr/lib/systemd/user/arctis-manager.service
}
