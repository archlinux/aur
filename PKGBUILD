# Maintainer: Sparklyballs

pkgname=forkboard
_pkgname_src=fork-board
pkgver=1.0.4
pkgrel=1.1
pkgdesc='An ElectronJS Dashboard App to show wallets balances from Chia and Forks in one convenient location.'
arch=('x86_64')
url='https://github.com/aaroncarpenter/fork-board'
license=('MIT')
depends=('gtk3' 'nss')
makedepends=( 'git' 'npm' )
source=(${_pkgname_src}-${pkgver}.tar.gz::https://github.com/aaroncarpenter/fork-board/archive/refs/tags/v${pkgver}.tar.gz 
	forkboard.desktop
	forkboard.sh)
sha256sums=('84ee874b397e8f36e043685d5b07f2cf7325437996a80c9d0eca785e8737ce99'
            '20f8f8e3b757c7450be207ecc5a976e2b405cae20ea3e1290c1856d9c2f324a9'
            '81927d6ae46b4b4ab49bdfc798b1910d70b422adbd2d589501279155f6da3c90')
build() {
	cd ${_pkgname_src}-${pkgver}
	npm add electron-packager
	npm install
	node_modules/.bin/electron-packager . ${pkgname} --overwrite --linux --x64 --icon=assets/icons/fork-board-gray.png --prune=true --out=./out --ignore=^/assets/config
}
package() {
	cd "${_pkgname_src}-${pkgver}"
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -r out/"${pkgname}"-linux-x64/* "${pkgdir}/opt/${pkgname}"
	mkdir -p "${pkgdir}/opt/${pkgname}"/resources/app/{assets/config,logs}
	chmod a+rw -R "${pkgdir}/opt/${pkgname}"/resources/app/{assets/config,logs}
	chmod  a+rx "${pkgdir}/opt/${pkgname}/${pkgname}"
	install -vDm644 "assets/icons/${_pkgname_src}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
	install -vDm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -vDm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}"/usr/share/applications
}
