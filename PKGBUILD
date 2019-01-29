# Maintainer: Anna <morganamilo@gmail.com>

pkgname=superproductivity-git
_pkgname=superProductivity
_reponame=super-productivity
_binname=superproductivity
pkgver=1.999.1000.r15.g08bd5c5e
pkgrel=1
pkgdesc='To Do List / Time Tracker with Jira Integration.'
arch=('x86_64')
url="http://super-productivity.com/"
license=('MIT')
depends=('gtk2' 'libxss' 'gconf' 'nss' 'nspr' 'libnotify' 'libappindicator'
'libxtst' 'alsa-lib' 'xprintidle')
makedepends=('npm' 'gulp' 'libicns' 'python3')
provides=('superproductivity')
conflicts=('superproductivity')
source=("git+https://github.com/johannesjo/${_reponame}")
md5sums=('SKIP')

build() {
	cd ${srcdir}/${_reponame}
	npm install
	npm run dist -- -l deb
}

package() {
	cd "${srcdir}/${_reponame}/app-builds"
	#use the deb because it contains icon files and a .desktop file
	local _pkgver=`git describe --abbrev=0 --tags | sed 's/^.//'`
	ar -x superProductivity_${_pkgver}_amd64.deb
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

	install -Dm644 "${srcdir}/${_reponame}/LICENSE" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}

pkgver() {
	cd ${srcdir}/${_reponame}
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
