# Maintainer: Artorias
# Contributor: Gustavo Chain <me@qustavo.cc>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=notesnook-bin
pkgver=2.4.11
pkgrel=2
pkgdesc="Open source zero knowledge private note taking"
arch=('x86_64')
url="https://notesnook.com"
_githuburl=https://github.com/streetwriters/notesnook
license=('GPL')
options=(!strip)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'hicolor-icon-theme' 'zlib')
_appimage="${pkgname%-bin}_linux_x86_64.AppImage"
source=("${_appimage}-$pkgver-$pkgrel::${_githuburl}/releases/download/v${pkgver}/${_appimage}")
sha256sums=('b6e241b6f12ea47ce3bebc988e47e0188b0b358ce191db4932acfe765ffe1f15')

prepare() {
	chmod +x "${_appimage}"
	"./${_appimage}" --appimage-extract > /dev/null
}

build() {
	sed -i -E "s|Exec=AppRun|Exec=${pkgname%-bin}|g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}

package() {
	# Install AppImage
	install -Dm 755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

	#  Install a Symlink
	install -dm755 -d "${pkgdir}/usr/bin"
	ln -sf "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${pkgname%-bin}"

	# Install Icons
	for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
		install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
	done

	# Install Desktop file
	install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}