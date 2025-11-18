# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Benjamin Schäfer <b-schaefer at posteo dot de>
# Contributor: Lorenzo Giuliani <lorenzo at giuliani dot me>
pkgname=pgmanage-bin
pkgver=1.4
pkgrel=1
pkgdesc="A modern multi-platform Postgres-centric database client/administration tool.(Prebuilt version)"
arch=('x86_64')
url="https://commandprompt.com/"
_ghurl="https://github.com/commandprompt/pgmanage"
license=('MIT')
depends=(
	'alsa-lib'
	'nspr'
	'libxext'
	'libxfixes'
	'libxkbcommon'
	'nss'
	'libxrandr'
	'cairo'
	'at-spi2-core'
	'pango'
	'libxcomposite'
	'libxdamage'
	'mesa'
	'libdrm'
	'libcups'
)
source=(
	"${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/${pkgver}-release/${pkgname%-bin}-${pkgver}.AppImage"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/commandprompt/pgmanage/${pkgver}-release/LICENSE"
	"${pkgname%-bin}.sh"
)
sha256sums=('fffd9215fb7dda18b8234a6e41187a55a61be430b41bfc9f313b7bb98904f9d4'
            'a62f1391fdfdce658169890e40e04d788c1386aade44c5271e3cae73d63e8dff'
            '7fc2b726adb41bfc30899035594c00ac4694e5cd37dd49e355d897b85f9fe355')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}-app/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
	if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
		s/AppRun/${pkgname%-bin}/g
		s/${pkgname%-bin}_icon/${pkgname%-bin}/g
	" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root" -type f -perm 600 -exec chmod 644 {} +
	find "${srcdir}/squashfs-root" -perm 700 -exec chmod 755 {} +
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
	install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
