# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=AlanKK
_gitname=everythingx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A blazing fast file name search tool"

pkgver=1.0.3
pkgrel=1
_gitversion=v${pkgver}

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
sha256sums=('201a474ca03af9a75d11f9fe97555d18c1495c4694d8e1d916be37e53e6a4787'
            'b47b5eeb5533dc7ebe52f56d65d161a624504ff8ee6653882c55b02a2affcea6')
sha256sums_x86_64=('1efbd633d1df7fa5c813a820e5dcaf908a3ec53c7fd09a97c7409326117a227d')
sha256sums_aarch64=('54a4bc2e93add3f1861503df3043894cce8a920edb836a06bbc1d0b852379873')


prepare() {
	cd "${srcdir}/" || exit

	sed -e 's|/usr/local/|/usr/|g' -i etc/systemd/system/*.service -i usr/share/applications/*.desktop
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 usr/local/bin/* -t "${pkgdir}/usr/bin/"

	install -Dm644 usr/share/applications/*.desktop -t "${pkgdir}/usr/share/applications/"

	for size in 32 64 128 256; do
		install -Dm644 usr/share/icons/hicolor/${size}x${size}/apps/*.png -t "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/"
	done

	install -Dm644 usr/share/pixmaps/*.png -t "${pkgdir}/usr/share/pixmaps/"

	install -Dm644 etc/systemd/system/*.service -t "${pkgdir}/usr/lib/systemd/system/"

	install -Dm644 README-${pkgver}.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 LICENSE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
