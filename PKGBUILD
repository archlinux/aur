# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Paul-Carouge
_gitname=Ferry-SFTP
_appname=ferry
_debname=app
pkgname=${_appname}-bin
pkgdesc="A modern, native SFTP client"

pkgver=0.5.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'gdk-pixbuf2' 'dbus' 'libsoup3' 'zlib' 'cairo' 'webkit2gtk-4.1' 'hicolor-icon-theme')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md" "LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.deb")
sha256sums=('c8a8785b8f1947a79a478d1475d8438bc8dea3ea06dc4e035a92dbdeb8a03f7b'
            'bdfcb630e95374bb466f5120b5387e1c6cf9ada7b6e7127d1e3bc90bf65b1b6b')
sha256sums_x86_64=('860ed62649379bc28a798ae05b54ffdfa97e62b5b91ec7541bfb6b869ab2feb5')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"

	find "${pkgdir}" -type f -name "${_debname}*" -execdir bash -c '
		deb="$1"; app="$2"; shift 2
		for file; do
			mv "$file" "${file/$deb/$app}"
		done
	' _ "${_debname}" "${_appname}" {} +

	sed \
		-e "s/Categories=.*/Categories=Network;FileTransfer;/g" \
		-e "s/Name=${_appname}/Name=${_appname^}/g" \
		-e "s/Comment=.*/Comment=${pkgdesc}/g" \
		-e "s/${_debname}/${_appname}/g" \
		-i "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
