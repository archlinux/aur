# Maintainer:  nathawat <nathawat at noreply dot codeberg dot org>
# Contributor: Mohamed tarek <Mokhamed_tarek@mail.ru>
# Contributor: rotzelbart <tausendkubik@gmail.com>
# Contributor: TechVio <68242352+techvio1@users.noreply.github.com>
# Contributor: chn <g897331845@gmail.com>
# Contributor: Hunter Wittenborn <git@hunterwittenborn.me>
# Contributor: Alfin Bakhtiar Ilhami <alfin at nuclea dot id>
# Contributor: Jan-Tarek Butt <tarek at ring0 dot de>

pkgname=bootstrap-studio
pkgver=9.0.1
pkgrel=1
pkgdesc="A powerful desktop application that helps you design and publish beautiful websites"
arch=("x86_64")
license=('LicenseRef-custom')
url="https://bootstrapstudio.io/"
depends=(
	'alsa-lib'
	'gtk3'
	'libcups'
	'nss'
)
optdepends=(
	'xdg-utils: Open URLs and browser previews'
)
options=('!strip')

source=("${pkgname}-${pkgver}.AppImage::https://releases.bootstrapstudio.io/${pkgver}/Bootstrap%20Studio.AppImage")
b2sums=('f3352e998419339159a5f0a127e33f4945de523b01c1531a6cebfbeae0085453508a830076c849e9d1da4a39e35e64a479c7a8f514fdffc8e50f22780cced742')

prepare() {
	chmod +x "${pkgname}-${pkgver}.AppImage"
	./"${pkgname}-${pkgver}.AppImage" --appimage-extract &> /dev/null
	sed -i 's|^Exec=.*|Exec=bootstrap-studio %U|' squashfs-root/bstudio.desktop
}

package() {
	# Application files
	install -d "${pkgdir}/opt/${pkgname}"
	cp -Lr "${srcdir}/squashfs-root" "${pkgdir}/opt/${pkgname}"
	find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +

	# Launcher
	install -d "${pkgdir}/usr/bin"
	cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/sh
exec /opt/${pkgname}/squashfs-root/AppRun "\$@"
EOF
	chmod 755 "${pkgdir}/usr/bin/${pkgname}"

	# Desktop entry & icons
	install -Dm644 "${srcdir}/squashfs-root/bstudio.desktop" \
		"${pkgdir}/usr/share/applications/bstudio.desktop"
	cp -r "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

	# Licenses
	install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
	install -Dm644 "${srcdir}/squashfs-root/LICENSES.chromium.html" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
