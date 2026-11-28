# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=karimz1
_gitname=open-file-lock-handle
_appname='oflh'
pkgname=(${_gitname}-bin ${_gitname}-desktop-bin)
pkgbase=${pkgname[0]}
_pkgdesc="Find processes using files, directories, and local ports"

pkgver=0.9.0
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
sha256sums=('73b6ed3bcbb82aba1c723181eefde2c539172c376e4cc5504273bc942dc4726c'
            '79d2fcdb0c79c0bf33e1afd2151b0187115b190c78c806a6aaf99b507a73ab31')
sha256sums_x86_64=('b3b6b651f90d68e8ca47f9e9d6a741e1538f6abab308e0c48c5b6c89f27a2f38'
                   '84b78e35974805187bb9f236e14c9d9a6e3b590f19acc8398df517d9ffb4e2ca')
sha256sums_aarch64=('ad0df8b287eef75220818a1bc4908ce982db348f12919535674de1d62e1b579a'
                    '2ec5ffbe04b79d8278873549d9d6e4d9892d4e7f31c08710bf3cb70a0c425954')


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
