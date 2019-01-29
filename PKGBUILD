# Maintainer: Anna <morganamilo@gmail.com>

pkgname=superproductivity
_pkgname=superProductivity
_reponame=super-productivity
_binname=superproductivity
pkgver=2.0.0
pkgrel=1
pkgdesc='To Do List / Time Tracker with Jira Integration.'
arch=('x86_64')
url="http://super-productivity.com/"
license=('MIT')
depends=('gtk2' 'libxss' 'gconf' 'nss' 'nspr' 'libnotify' 'libappindicator'
'libxtst' 'alsa-lib' 'xprintidle')
makedepends=('npm' 'gulp' 'yarn' 'libicns' 'python3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/johannesjo/super-productivity/archive/v${pkgver}.tar.gz")
md5sums=('0f81ee3baad0cbf87dc6e93a68d6ce9a')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	npm install
	npm run dist -- -l deb
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}/app-builds"
	npm install
	#use the deb because it contains icon files and a .desktop file
	ar -x superProductivity_${pkgver}_amd64.deb
	tar -xf "data.tar.xz"

	install -d "${pkgdir}/opt/${_pkgname}"
	cp -a "opt/${_pkgname}/." "${pkgdir}/opt/${_pkgname}"

	chmod 755 "${pkgdir}/opt/${_pkgname}/${_binname}"

	install -d "${pkgdir}/usr/share/applications"
	install -Dm644 "/usr/share/applications/${_binname}.desktop" "${pkgdir}/usr/share/applications"

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_binname}" "${pkgdir}/usr/bin/${_binname}"

	for size in `ls "usr/share/icons/hicolor/"`; do
		install -Dm644 "usr/share/icons/hicolor/${size}/apps/${_binname}.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_binname}.png"
    	done

	install -Dm644 "${srcdir}/${_reponame}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
