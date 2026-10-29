# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=timbornemann
_gitname=Open-Git-Control
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="Free, open-source desktop Git client with visual history, GitHub workflows, conflict resolution, secret scanning and optional AI-assisted commits"

pkgver=3.2.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

makedepends=('imagemagick')
depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'libxfixes' 'libxkbcommon' 'at-spi2-core' 'libxrandr' 'cairo' 'nspr' 'systemd-libs' 'expat' 'libcups' 'libxdamage' 'nss' 'dbus' 'libx11' 'pango' 'fontconfig' 'libxcomposite' 'mesa' 'libxcb' 'alsa-lib' 'libxext' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${pkgver}-${_barch[0]}.deb")
sha256sums=('581685fee6113ae4499c1a4e94709d9b4d049ba2a990da1188ee80e0ffe82d64'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('ad92ec0548606db5feb4559d5f4abd4a28c8cbe011f4ddbe90e032093ce728b6')


package() {
	cd "${srcdir}/" || exit

	tar -xf "data.tar.xz" -C "${pkgdir}"

	rm -rf "${pkgdir}/usr/share/doc/${_appname}"

	mv "${pkgdir}/usr/share/applications/${_gitname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
	rm -rf "${pkgdir}/usr/share/applications/${_appname}-recovery.desktop"

	magick mogrify -resize 512x512 "${pkgdir}/usr/share/icons/hicolor/3378x3378/apps/${_appname}.png"
	mv "${pkgdir}/usr/share/icons/hicolor/3378x3378" "${pkgdir}/usr/share/icons/hicolor/512x512"
	chmod 644 "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png"

	install -dm755 "${pkgdir}/usr/bin/"
	ln -sf "/opt/${_gitname}/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
