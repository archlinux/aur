# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>

_pkgname=code-expert-sync

pkgname="${_pkgname}"-appimage
pkgver=1.0.1
pkgrel=4
pkgdesc="Allows syncing of Code Expert projects to a local file system"
arch=('x86_64')
url="https://github.com/CodeExpertETH/CodeExpertSync"
license=('MIT')
depends=('zlib' 'hicolor-icon-theme')
optdepends=('gnome-shell-extension-tray-icons-reloaded')
options=(!strip)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_appimage="${pkgname}-${pkgver}.AppImage"
_LICENSE=LICENSE_${pkgver}
source=("${_appimage}::https://github.com/CodeExpertETH/CodeExpertSync/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.AppImage"
	${_LICENSE}::"https://raw.githubusercontent.com/CodeExpertETH/CodeExpertSync/v${pkgver}/LICENSE.md"
)
noextract=("${_appimage}")
sha256sums=('cf3db6d88aa4c4e8dd9eab86099a511358ba7f3bde30c458de36dedf17c0a01b' '1847febc3b265f74a6fe0c1cc8c665f46c22a164d5ed33d968bd58b426d3521a')

prepare() {
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
}

build() {
	# Adjust .desktop so it will work outside of AppImage container
	sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
		"squashfs-root/${_pkgname}.desktop"
	# Fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX squashfs-root/usr
}

package() {
	# AppImage
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
	install -Dm644 "${srcdir}/${_LICENSE}" "${pkgdir}/opt/${pkgname}/LICENSE"

	# Desktop file
	install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Icon images
	install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

	# Symlink license
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -s "/opt/$pkgname/${_LICENSE}" "$pkgdir/usr/share/licenses/$pkgname"
}
