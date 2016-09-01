# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=trailbot-client
pkgver=0.3.0
pkgrel=1
pkgdesc='Trailbot desktop app for managing watchers, policies, and file events.' 
arch=('x86_64')
url='https://github.com/trailbot/client'
license=('MIT' 'custom:chromium')
groups=('server' 'security')
depends=('gtk2' 'nss' 'alsa-lib' 'libnotify' 'gconf' 'libxtst' 'libxss')
makedepends=('npm' 'git' 'python2')
source=("https://github.com/trailbot/${pkgname}/archive/v${pkgver}.tar.gz"
		"${pkgname}.desktop")
md5sums=('6923a5ec9b3f6edf66461679c692aedc'
         'c7a3244a37bd51b07d6e269868d8507d')


build() {
	local HOME
	HOME="${srcdir}"

	cd "${srcdir}/client-${pkgver}"
	sed -i 's|--all|--platform=linux --arch=x64|g' package.json
	
	npm install removeNPMAbsolutePaths --sav-dev
	npm install
	npm run package
	node node_modules/remove*/bin/remove* .
}


package() {
	cd "${srcdir}/client-${pkgver}"

	mkdir -p \
		"${pkgdir}"/usr/bin \
		"${pkgdir}"/usr/share/{applications,licenses,pixmaps} \
		"${pkgdir}/usr/share/licenses/${pkgname}"

	cp ../"${pkgname}.desktop" "${pkgdir}/usr/share/applications"

	cp -R "${pkgname}-linux-x64" "${pkgdir}/usr/share/${pkgname}"

	cd "${pkgdir}/usr/share/${pkgname}"

	cp -t "${pkgdir}/usr/share/licenses/${pkgname}" \
		LICENSE \
		LICENSES.chromium.html

	ln -s "/usr/share/${pkgname}/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	ln -s "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# -*- mode: bash;-*-
