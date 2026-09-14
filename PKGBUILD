# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update-cli
_pkgname="${pkgname%-cli}"
pkgver=4.4.0
pkgrel=1
pkgdesc="An interactive update notifier & applier that assists you with important pre / post update tasks (cli version)"
url="https://github.com/Antiz96/arch-update"
arch=('any')
license=('GPL-3.0-or-later')
depends=('bash' 'systemd' 'pacman' 'pacman-contrib' 'archlinux-contrib' 'curl' 'fakeroot' 'htmlq' 'diffutils')
makedepends=('scdoc')
checkdepends=('bats')
optdepends=('paru: AUR Packages support'
            'yay: AUR Packages support'
            'pikaur: AUR Packages support'
            'flatpak: Flatpak Packages support'
            'libnotify: Desktop notifications support on new available updates'
            'alhp-utils: Check for ALHP build queue or outdated mirrors'
            'vim: Default diff program for pacdiff'
            'neovim: Default diff program for pacdiff if EDITOR=nvim'
            'sudo: Privilege elevation'
            'sudo-rs: Privilege elevation'
            'opendoas: Privilege elavation')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('13796df44c2e6137d193aa274da5d979bb386589a3747281b8ca1b42929562fa')

prepare() {
	cd "${_pkgname}-${pkgver}"
	make clean
}

build() {
	cd "${_pkgname}-${pkgver}"
	make WITH_TRAY=false
}

check() {
	cd "${_pkgname}-${pkgver}"
	make test
}

package() {
	cd "${_pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install WITH_TRAY=false

	# Remove unecessary elements for a CLI usage
	rm -rfv "${pkgdir}/usr/share/applications/" "${pkgdir}/usr/share/icons/"
}
