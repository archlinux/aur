# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=tonyantony300
_gitname=dashbeam
_appname=DashBeam
pkgname=${_appname,,}-bin
pkgdesc="Send files and folders anywhere in the world without storing in cloud"

pkgver=0.7.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('AGPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'gdk-pixbuf2' 'libsoup3' 'cairo' 'webkit2gtk-4.1' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.deb")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.deb")
sha256sums=('95635d9946e98f58475f7f9ddb55034e52ff94b6d84c26be6b6fc49c7f2c00a4'
            '4df3c306dddaaf4baffdff5ca820cc679ac8cd6dc263c6a74517783e42fa7a3b')
sha256sums_x86_64=('900b22744f5f7d5d8c0dde4ac02861205c130f83d4fdd970a10687ea0f0e9715')
sha256sums_aarch64=('f68cb5207a8838fac7c648c94cb63a74935712258623a38b4739cce3fb423b4d')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	bsdtar --uid 0 --gid 0 -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"

	sed -i "${pkgdir}/usr/share/applications/${_appname}.desktop" \
		-e "s|Categories=|Categories=GTK;FileTransfer;Utility;|"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
