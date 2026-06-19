# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=arnauda-gh
_gitname=Alwide
_appname=${_gitname,,}
_execname=al
pkgname=${_appname}-bin
pkgdesc="The Modern TUI IDE. The intuitive experience in your terminal."

pkgver=1.0.8
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

options=(!strip)

source=("ASSETS-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}-assets.zip"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('154d3364362f361cd30814a31d549355bddde8347ea02a17a9255600774c0447'
            'e643033bfd6fdc487531bb988f4aa0d44709a2c1ffdf4bec8676f6107addc664'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('5d8c233354211fd3d5084de94e1b6247b16101d39d333ced2ddaec04c538eed5')
sha256sums_aarch64=('e34c9ee1bf49f252d7116bcb51608aa4f2f7ccf2d5184e820de16fa7fd4bcd24')


prepare() {
	cd "${srcdir}/" || exit

	perl -i -0777 -pe "s|/usr/local/share/${_appname}|pack('A23', '/usr/share/${_appname}')|e" src/al
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
