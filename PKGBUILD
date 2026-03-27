# Maintainer: Carlos Sánchez <cargabsj175@gmail.com>

_pkgname=cartridge
pkgname=${_pkgname}-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A free, open-source desktop emulator for Windows & Linux. Drag a ROM in, it plays."
arch="x86_64"
url="https://github.com/makuka97/CARTRIDGE"
license=("GPL-3.0")

conflicts=(${_pkgname})
provides=(${_pkgname})

makedepends=(gendesk)

_target="CARTRIDGE-0.4.0.AppImage"
_download_url="https://github.com/makuka97/CARTRIDGE/releases/download/EmulatorLinux"

source=("$_download_url/$_target")

sha256sums=("ba2ff88172f6a86a9d458bf2190267095bd15dbc546b9483a25f9cfb7e352add")

_squashfs_root="squashfs-root"

prepare() {
	echo "Extracting the AppImage (This may take some time)..."
	rm -rf $_squashfs_root
	chmod +x $_target
	./$_target --appimage-extract >> /dev/null
	chmod +x $_squashfs_root/AppRun
	echo "Done"
	echo "Adjusting..."

	gendesk --pkgname "${_pkgname}" --pkgdesc "$pkgdesc"
}

package() {
	mkdir -p ${pkgdir}/opt/${_pkgname}
	cp -arf ./$_squashfs_root/* ${pkgdir}/opt/${_pkgname}
	install -Dm644 ${srcdir}/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications/
	install -Dm644 ${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png -t ${pkgdir}/usr/share/icons/
	mkdir -p ${pkgdir}/usr/bin/
	ln -svf ../../opt/${_pkgname}/AppRun ${pkgdir}/usr/bin/${_pkgname}
}
