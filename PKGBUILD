# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gridplayer-appimage
_pkgname=GridPlayer
_appname="com.vzhd1701.${pkgname%-appimage}"
pkgver=0.6.0
pkgrel=1
pkgdesc="Simple VLC-based media player that can play multiple videos at the same time."
arch=(
	'aarch64'
	'x86_64'
)
url="https://github.com/vzhd1701/gridplayer"
license=('GPL-3.0-or-later')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('hicolor-icon-theme')
options=('!strip')
_install_path="/usr/lib/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.AppImage")
sha256sums_aarch64=('abfeb9405172d5ee9124024beaaec57b80a0e5b1ccdae5dfeebeacc4ace00653')
sha256sums_x86_64=('5f105360f7bce75c6189772b56f993b024759f8fe3c5a67cb0bcbfafcb34f949')
_install_icons() {
	local _s="${1:-$srcdir}" _n="${pkgname%-bin}" _i _e _z
	while IFS= read -r -d '' _i; do
		_e=${_i##*.}
		_z=$(printf %s "${_i%/*}"|grep -oE '[0-9]+x[0-9]+(@[0-9]+x?)?|scalable'|tail -n1)
		[[ $_z ]] || _z=$([[ $_e == svg ]]&&echo scalable||od -An -tx1 -j16 -N8 "$_i"| \
		{ read a b c d e f g h; printf %dx%d 0x$a$b$c$d 0x$e$f$g$h; })
		[[ $_z =~ ^[0-9]+x[0-9]+(@[0-9]+x?)?$ || $_z == scalable ]]||_z=scalable
		install -Dm644 "$_i" "$pkgdir/usr/share/icons/hicolor/$_z/apps/$_n.$_e"
	done < <(find "$_s" \( -path '*/share/icons/*' -o -path '*/share/pixmaps/*' \
		-o -path '*entries/icons/*' \) -type f \( -name '*.png' -o -name '*.svg' \) -print0 2>/dev/null)
}
prepare() {
	chmod +x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
	rm -rf "${srcdir}/squashfs-root"
	"${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
	sed -i "s/${_appname}/${pkgname%-appimage}/g" "${srcdir}/squashfs-root/${_appname}.desktop"
	sed -i "s/${_appname}/${pkgname%-appimage}/g" "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml"
	sed -i "s/${_appname}.gpls/${pkgname%-appimage}/g" "${srcdir}/squashfs-root/usr/share/mime/packages/${_appname}.xml"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
	install -Dm755 -d "${pkgdir}/usr/bin"
	ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
	_install_icons
	install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-appimage}.appdata.xml"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/${_appname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-appimage}.xml"
}