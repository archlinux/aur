# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=arnauda-gh
_gitname=Alwide
_appname=${_gitname,,}
_execname=al
pkgname=${_appname}-bin
pkgdesc="The Modern TUI IDE. The intuitive experience in your terminal."

pkgver=1.0.9
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")

makedepends=('perl')
depends=('glibc' 'ncurses')

install="${_appname}.install"

options=(!strip)

source=("ASSETS-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}-assets.zip"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('c4cd2d728a3890b20eced436b9f9e9b44ee0c7f13c46abb89e3eb78211cc205f'
            'e643033bfd6fdc487531bb988f4aa0d44709a2c1ffdf4bec8676f6107addc664'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('39903e1e6e4ff24a900df8a2618ce137930e4fd5535c7fb8d7c2e25b55be893e')
sha256sums_aarch64=('388e8079638f6c98bcc428e7c4af7a33f473d357d1fcfc1ba9aaf5ad87a8154d')


prepare() {
	cd "${srcdir}/" || exit

	_new_path="/usr/share/${_appname}"
	_old_path="/usr/local/share/${_appname}"
	_old_len=$(echo -n "${_old_path}" | wc -m)
	perl -i -0777 -pe "s|${_old_path}|pack('A' . ${_old_len}, '${_new_path}')|e" "${_execname}"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_execname}" "${pkgdir}/usr/bin/${_appname}"

	_assets_folder="${pkgdir}/usr/share/${_appname}"
	install -dm755 "${_assets_folder}/"
	cp -rf "assets/"* "${_assets_folder}/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
