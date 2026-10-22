# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=AlanKK
_gitname=everythingx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A blazing fast file name search tool"

pkgver=0.2.21
pkgrel=1
_gitversion=v${pkgver}-beta

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libglvnd' 'wayland')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE.txt")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.rpm::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.rpm")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.rpm::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.rpm")
sha256sums=('efca097849327a593fff4b13e9aa0b7fd6cb6a4209ddc1ccbd768edc159e4907'
            'b47b5eeb5533dc7ebe52f56d65d161a624504ff8ee6653882c55b02a2affcea6')
sha256sums_x86_64=('b60f17d3026dd104789b0c83418501bee6f303bb1dd315922ad48adb85b02aa0')
sha256sums_aarch64=('165aaca35f98baed5441bd5b7d59bbd457bb0baa5d07d6b99441f2804b6c6be8')


prepare() {
	cd "${srcdir}/" || exit

	sed -e 's|/usr/local/|/usr/|g' -i etc/systemd/system/*.service -i usr/share/applications/*.desktop
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 usr/local/bin/* -t "${pkgdir}/usr/bin/"

	install -Dm644 usr/share/applications/*.desktop -t "${pkgdir}/usr/share/applications/"
	install -Dm644 usr/share/pixmaps/*.png -t "${pkgdir}/usr/share/pixmaps/"

	install -Dm644 etc/systemd/system/*.service -t "${pkgdir}/usr/lib/systemd/system/"

	install -Dm644 README-${pkgver}.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 LICENSE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
