# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update
pkgver=3.4.1
pkgrel=2
pkgdesc="An update notifier & applier that assists you with important pre / post update tasks"
url="https://github.com/Antiz96/arch-update"
arch=('any')
license=('GPL-3.0-or-later')
depends=('bash' 'pacman-contrib' 'archlinux-contrib' 'curl' 'fakeroot' 'htmlq' 'diffutils' 'hicolor-icon-theme' 'python' 'python-pyqt6' 'qt6-svg' 'glib2')
checkdepends=('bats')
optdepends=('paru: AUR Packages support'
            'yay: AUR Packages support'
            'pikaur: AUR Packages support'
            'flatpak: Flatpak Packages support'
            'libnotify: Desktop notifications support on new available updates'
            'vim: Default merge program for pacdiff'
            'qt6-wayland: Systray applet support on Wayland'
            'sudo: Privilege elevation'
            'doas: Privilege elavation')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        avoid_false_positive_unused_flatpak_packages.patch)
sha256sums=('39a261fd0cb5e21908750554412f6a4562c4d6d2b5027bc39429f74dd0e756d1'
            '7f6ca8cb6822e33d83f5277612ee8062813e0f3c6e0bf256bce852d0dd9af073')

prepare() {
	cd "${pkgname}-${pkgver}"
	# Temporary patch to avoid false positive on unused runtimes for Flatpak with pinned runtimes
	# See https://github.com/Antiz96/arch-update/issues/285
	# And https://github.com/Antiz96/arch-update/pull/286
	patch -Np1 < "${srcdir}/avoid_false_positive_unused_flatpak_packages.patch"
}

check() {
	cd "${pkgname}-${pkgver}"
	make test
}

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
