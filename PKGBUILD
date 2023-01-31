# Maintainer: Arthur Aslanyan <arthur.e.aslanyan@gmail.com>
_name=starc

pkgname="${_name}-appimage"
pkgver=0.4.1
pkgrel=1
pkgdesc="Text editor for film, theatre, radio scripts or comic books."
arch=('x86_64')
url='https://starc.app/'
license=('GPL3' 'custom')
depends=('zlib' 'bash')
provides=("${_name}=${pkgver}")
conflicts=("${_name}")
options=(!strip)
source=("${pkgname}-${pkgver}::https://github.com/story-apps/starc/releases/download/v${pkgver}/${_name}-setup.AppImage"
		"${_name}.desktop.patch"
		"${_name}.sh")
sha256sums=('5fb0e5f8e3e3182971419ac6131716b79b0b8f3a985b7572ad28dc9d86293c41'
			'583fcc57942d9c9e1a8e41a0a95fcc3f4cdd1660767e014921c30a3fa272f5fa'
			'642005557de950e4fd37bc87fe2fb051e7f93f61e7287161fe3c99c9918977c7')

prepare() {
	cd "${srcdir}"
	chmod +x "${pkgname}-${pkgver}"
	"./${pkgname}-${pkgver}" --appimage-extract
	patch -Np0 < "./${_name}.desktop.patch"
}

package() {
	# Install AppImage and bin
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/appimages/starc.AppImage"
	install -Dm755 "${srcdir}/${_name}.sh" "${pkgdir}/usr/bin/${_name}"

	# Install icon and desktop
	install -Dm644 "${srcdir}/squashfs-root/${_name}.png" "${pkgdir}/usr/share/pixmaps/${_name}.png"
	install -Dm644 "${srcdir}/squashfs-root/${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"

	# TODO: Install custom LICENSE when author makes it
	# install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
