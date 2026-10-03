# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=karimz1
_gitname=open-file-lock-handle
_appname='oflh'
pkgname=(${_gitname}-bin ${_gitname}-desktop-bin)
pkgbase=${pkgname[0]}
_pkgdesc="Find processes using files, directories, and local ports"

pkgver=0.4.0
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
sha256sums=('246f9e7ddaf7aa567f972f3a3d669b786465eaed7b83f8e6b282b1bffab6941a'
            '79d2fcdb0c79c0bf33e1afd2151b0187115b190c78c806a6aaf99b507a73ab31')
sha256sums_x86_64=('cf4109ed7da046249153ef447721b3273111ae25091b530d0b95b1420b0c34ab'
                   '4d659a12c855f26883b847b0ae41f243a276d2477114b7f8af602384de98253b')
sha256sums_aarch64=('3e40cb4fccc823f9cc9ac897fe53621aad95cc344f9abaf386256b9710c221cc'
                    'ebea4561b086426ce10b4d90b3857d75fb821c0eb34b6a46e6c4cbcfc1a53eea')


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
