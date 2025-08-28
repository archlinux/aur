# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: RemixDev <RemixDev64@gmail.com>

pkgname="deemix-gui-git"
_pkgname="deemix-gui"
pkgver=r222.5d447b6035
pkgrel=4
pkgdesc="A gui electron app for the deemix lib"
arch=('any')
url="https://gitlab.com/RemixDev/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('electron27')
makedepends=('git' 'yarn')
provides=('deemix-gui')
source=(
	"${_pkgname}::git+https://gitlab.com/RemixDev/${_pkgname}"
	"deemix-webui::git+https://gitlab.com/RemixDev/deemix-webui"
	"${_pkgname}.desktop"
	"${_pkgname}.sh")
sha256sums=('SKIP'
            'SKIP'
            '87ae7b086c91a3ee8c9c29c5e920680416a1ca92d33b05c9276abb8d2bc4da3b'
            'e1c74c414423858b5ea845cabf75361aa330d34016939f2f97ed8e34fad13666')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=10 HEAD)"
}

prepare() {
	cd deemix-gui
	git submodule init
	git config submodule.webui.url "${srcdir}/deemix-webui"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "${srcdir}/${_pkgname}"

	# use system electron version
	# see: https://wiki.archlinux.org/index.php/Electron_package_guidelines
	_electronDist='/usr/lib/electron27'
	_electronVer=$(sed s/^v// /usr/lib/electron27/version)
	sed -i '/		"electron": /d' ./package.json
	HOME="${srcdir}/.electron-gyp" yarn install-all
	yarn predist
	./node_modules/.bin/electron-builder build --linux --x64 --dir -c.electronDist=${_electronDist} -c.electronVersion=${_electronVer}
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
	cp -dr --no-preserve=ownership dist/linux-unpacked/resources/* "${pkgdir}/usr/lib/${_pkgname}/"

	install -Dm644 build/icon.svg "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
