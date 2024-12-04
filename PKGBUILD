# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Benjamin Schäfer <b-schaefer at posteo dot de>
# Contributor: Lorenzo Giuliani <lorenzo at giuliani dot me>
pkgname=pgmanage-bin
pkgver=1.2
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
makedepends=(
    'fuse2'
)
source=(
	"${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.AppImage"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/commandprompt/pgmanage/${pkgver}/LICENSE"
	"${pkgname%-bin}.sh"
)
sha256sums=('9e08568e658bb681e3b2a7fc94b1ab7c99dbd71241226a77dc61867497d12768'
            '1b4aea4a53aef96699473c225e6355234f814d8d09441b4835dda61a92710be6'
            '7fc2b726adb41bfc30899035594c00ac4694e5cd37dd49e355d897b85f9fe355')
build() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}-app/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -e "
		s/AppRun/${pkgname%-bin}/g
		s/${pkgname%-bin}_icon/${pkgname%-bin}/g
	" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
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

