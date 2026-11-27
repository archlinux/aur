# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mudlet-bin
_pkgname=Mudlet
pkgver=5.1.2
pkgrel=1
pkgdesc="⚔️ A cross-platform, open source, and super fast MUD client with scripting in Lua."
arch=('x86_64')
url="https://www.mudlet.org"
_ghurl="https://github.com/Mudlet/Mudlet"
license=('GPL-2.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'qt6-declarative'
	'hicolor-icon-theme'
	'python'
)
optdepends=(
	'ttf-bitstream-vera: default font'
	'ttf-ubuntu-font-family: default font'
	'noto-fonts-emoji: emoji font support'
)
options=(
	'!strip'
)
source=(
	"${pkgname%-bin}-${pkgver}.tar::${_ghurl}/releases/download/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}-linux-x64.AppImage.tar"
	"${pkgname%-bin}.sh"
)
sha256sums=('ea90b0fdd9b8cf4c293c0e78751e0f632a71dc041032b28ca4f0792ab45408bd'
            '216b754c5be3b7d33ebc915743a3bc4d6663a63b0a07468c88cc26bf20908cb4')
_generate_icons() {
	local _sizes=(16 24 32 48 64 96 128 256 512) _src="${srcdir}/squashfs-root/${pkgname%-bin}.png" _s
	for _s in "${_sizes[@]}"; do
		install -d "${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps"
		magick "${_src}" -background none -filter Lanczos -resize "${_s}x${_s}" \
			-strip -define png:compression-level=9 \
			"${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps/${pkgname%-bin}.png"
	done
}
prepare() {
	sed -i -e "
		s/@appname@/${pkgname%-bin}/g
		s/@runname@/${pkgname%-bin}/g
	" "${srcdir}/${pkgname%-bin}.sh"
	chmod +x "${srcdir}/${_pkgname}.AppImage"
	rm -rf "${srcdir}/squashfs-root"
	"${srcdir}/${_pkgname%-bin}.AppImage" --appimage-extract > /dev/null
	find "${srcdir}/squashfs-root/doc" -type f -exec chmod 644 {} +
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "${srcdir}/squashfs-root/." "${pkgdir}/usr/lib/${pkgname%-bin}"
	_generate_icons
	install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}