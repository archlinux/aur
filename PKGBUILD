# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=karimz1
_gitname=open-file-lock-handle
_appname='oflh'
pkgname=(${_gitname}-bin ${_gitname}-desktop-bin)
pkgbase=${pkgname[0]}
_pkgdesc="Find processes using files, directories, and local ports"

pkgver=0.6.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux.amd64' 'linux.arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-cli.${_barch[0]}"
			   "${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}-desktop.${_barch[0]}.deb")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-cli.${_barch[1]}"
			   "${_appname}-${arch[1]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}-desktop.${_barch[1]}.deb")
sha256sums=('26f6890e412d9e0d5c56c7f76dd5877ac1a01d3b53997a5888d9edbc8fd09814'
            '79d2fcdb0c79c0bf33e1afd2151b0187115b190c78c806a6aaf99b507a73ab31')
sha256sums_x86_64=('13c8882aece59052ed4372df3c10fe81be4035ea6599eb974d1f39a0533f1f63'
                   'f73c8128dc7f3575f52a33e93e676ae78f0bc55673044fcc38c990c5c1cfdf8e')
sha256sums_aarch64=('ac467409cad99fa3800b31015a0c90e6d1a318ebed8a6f038d124e30636fa193'
                    '87d31f50ca8c81ca7272fc4e1c83d4125d14578a7c789a97f9386edbbf74a2f3')


package_open-file-lock-handle-bin() {
	pkgdesc="${_pkgdesc} (CLI/TUI)"

	provides=("${_appname}")
	depends+=('glibc' 'libgcc')
	optdepends+=("${_appname}-desktop")

	depends+=()

	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

package_open-file-lock-handle-desktop-bin() {
	pkgdesc="${_pkgdesc} (Desktop)"

	provides=("${_appname}-desktop")
	depends+=('glibc' 'libgcc' 'gtk3' 'glib2' 'dbus' 'cairo' 'gdk-pixbuf2' 'webkit2gtk-4.1' 'libsoup3' 'hicolor-icon-theme' "${_appname}")

	cd "${pkgdir}/" || exit

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
