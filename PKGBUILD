# Maintainer: Sparklyballs

pkgname=forkboard
_pkgname_src=fork-board
pkgver=1.1.0
pkgrel=1.0
pkgdesc='An ElectronJS Dashboard App to show wallets balances from Chia and Forks in one convenient location.'
arch=('x86_64')
url='https://github.com/aaroncarpenter/fork-board'
license=('MIT')
depends=('gtk3' 'nss')
makedepends=( 'git' 'npm' )
source=(${_pkgname_src}-${pkgver}.tar.gz::https://github.com/aaroncarpenter/fork-board/archive/refs/tags/v${pkgver}.tar.gz 
	forkboard.desktop
	forkboard.sh)
sha256sums=('dc13fb04d6cd5cb9da2df3509e3a379a7bbb3814d0e14671fb76bde8a646c67b'
            '20f8f8e3b757c7450be207ecc5a976e2b405cae20ea3e1290c1856d9c2f324a9'
            '81927d6ae46b4b4ab49bdfc798b1910d70b422adbd2d589501279155f6da3c90')
build() {
	cd ${_pkgname_src}-${pkgver}
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
