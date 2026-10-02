# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=karimz1
_gitname=open-file-lock-handle
_appname='oflh'
pkgname=(${_gitname}-bin ${_gitname}-desktop-bin)
pkgbase=${pkgname[0]}
_pkgdesc="Find processes using files, directories, and local ports"

pkgver=0.3.0
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
sha256sums=('9eca4e5c25d1b96f40ba144f979b6aaa78b8b9e1990fb757497fd52f4b75ae34'
            '79d2fcdb0c79c0bf33e1afd2151b0187115b190c78c806a6aaf99b507a73ab31')
sha256sums_x86_64=('5fa8ee1235b0b1906fb3a5be9cc14d5318e4e265bfc4af838ea1ca4f1c271301'
                   '45f3bec87d205379b412f56721ad8ccc167d5d54e2269ee8b1d44a41e3e61b88')
sha256sums_aarch64=('695c326ff375bc26a46a1b9a682c07898f19c72eee0b4ee0c1d8e11f5368000c'
                    '5a7079cea7b6c93aef5550ae95d2d9e88fa9e23c8ceb09de3c42eebacdff441e')


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
