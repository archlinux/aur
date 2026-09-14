# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=arch-update-bin
_pkgname="${pkgname%-bin}"
pkgver=4.4.4
pkgrel=1
pkgdesc="An interactive update notifier & applier that assists you with important pre / post update tasks (bin version)"
url="https://github.com/Antiz96/arch-update"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('bash' 'systemd' 'pacman' 'pacman-contrib' 'archlinux-contrib' 'curl' 'fakeroot' 'util-linux'
         'htmlq' 'diffutils' 'hicolor-icon-theme' 'glibc' 'libgcc' 'glib2' 'xdg-utils')
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
options=(!strip)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
source_x86_64=("${_pkgname}-tray-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-tray-${pkgver}-x86_64")
sha256sums=('e4a3caf43bc33eb287025028472e637d3f40b7c3d3fa745c7eb177028420cc97')
sha256sums_x86_64=('db2b6d9bc4d5cdf68eb8908a452389ca1743d8c8d4c644a52368af09172eb6c1')

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
	install -Dm 755 "${srcdir}/${_pkgname}-tray-${pkgver}-${CARCH}" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}-tray"
}
