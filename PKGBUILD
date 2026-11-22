# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=AlanKK
_gitname=everythingx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A blazing fast file name search tool"

pkgver=1.1.0
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
sha256sums=('28c5949361556779253f761be5b96b2b73e3e257468b6c3729ff9656af4964a7'
            'b47b5eeb5533dc7ebe52f56d65d161a624504ff8ee6653882c55b02a2affcea6')
sha256sums_x86_64=('dbd6b6f1bf6f305a5e9cb74dfb5e6500e27a1aa17bae6195cdf37cef556088b8')
sha256sums_aarch64=('0dc08ebc25ddc2d01bff3455f2f88fec256b470f396c8e340a7eded93f3f2401')


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
