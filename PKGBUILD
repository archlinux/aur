# Maintainer: Integral <integral@murena.io>

pkgname=qefientrymanager
_srcname=QEFIEntryManager
pkgver=0.3.0
pkgrel=4
pkgdesc="A userspace cross-platform EFI boot entry management GUI App based on Qt"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/Inokinoki/${_srcname}"
license=('GPL3')
depends=('qt6-base' 'qt6-wayland' 'efivar' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
source=(
	"git+${url}.git#tag=v.${pkgver}"
	"git+https://github.com/Inokinoki/qefivar.git"
	"${pkgname}-wayland.desktop"
)
sha256sums=('SKIP'
            'SKIP'
            'c31daa87fe9e2b94cbcf3ff073b820e4a91c4b3da160b7a4f8af4c82ee236be2')

prepare() {
	cd "${_srcname}/"
	git submodule init
	git config submodule.qefivar.url "${srcdir}/qefivar/"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "${_srcname}/"
	mkdir build && cd build
	cmake ..
	make
}

package() {
	cd "${_srcname}/"

	# Binary file
	install -Dm755 "build/${_srcname}" -t "${pkgdir}/usr/bin/"

	# Desktop file (Xorg)
	sed -i '/Exec=/c\
Exec=pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY QEFIEntryManager
' "${pkgname}.desktop"
	install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"

	# Desktop file (Wayland)
	install -Dm644 "${srcdir}/${pkgname}-wayland.desktop" -t "${pkgdir}/usr/share/applications/"

	# Icon
	install -Dm644 cc.inoki.qefientrymanager.png -t "${pkgdir}/usr/share/icons/hicolor/96x96/apps/"

	# License
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	# Documentation
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
