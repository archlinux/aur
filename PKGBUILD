# Maintainer: Sam M <contact@s-mc.io>
pkgname=nuvio-desktop
pkgver=0.1.30_alpha
pkgrel=1
pkgdesc="A modern media hub desktop application (AppImge)"

arch=('x86_64')
url="https://github.com/NuvioMedia/NuvioDesktop"

license=('GPL-3.0-or-later')

depends=()
makedepends=()

provides=("${pkgname}")
conflicts=("${pkgname}" "nuvio-desktop-bin" "nuvio" "nuvio-desktop-git")

_pkgver="${pkgver//_/-}"
_appimge="Nuvio-Linux-${CARCH}-${_pkgver}.AppImage"

options=('!strip' '!debug') # prebuilt binaries: don't strip, don't emit a debug package
source=("${_appimge}::${url}/releases/download/${_pkgver}/$_appimge")
noextract=("nuvio-${_pkgver}.AppImage")
sha256sums=('3aa9b09318418dda577549dfb2e8d585d7ee8a582e8a01dccc787c0e28aa23b5')

package() {
	cd "${srcdir}"
	chmod +x "./${_appimge}"
	./${_appimge} --appimage-extract

	install -Dm755 "${srcdir}/${_appimge}" "$pkgdir/opt/${pkgname}/${pkgname}.AppImage"

	install -Dm644 "${srcdir}/squashfs-root/Nuvio.desktop" \
		"$pkgdir/usr/share/applications/${pkgname}.desktop"

	sed -i "s|Exec=.*|Exec=/opt/${pkgname}/${pkgname}.AppImage|g" \
		"$pkgdir/usr/share/applications/${pkgname}.desktop"
	# 4. Force the Icon= line to match our package name (nuvio-desktop)
	sed -i "s|^Icon=.*|Icon=${pkgname}|g" \
		"$pkgdir/usr/share/applications/${pkgname}.desktop"

	install -Dm644 "${srcdir}/squashfs-root/Nuvio.png" \
		"$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

	rm -rf "${srcdir}/squashfs-root"
}
