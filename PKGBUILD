# Maintainer: Morgana <morganamilo@gmail.com>

pkgname=superproductivity-git
_pkgname=superProductivity
_reponame=super-productivity
_binname=superproductivity
pkgver=1.7.5.r0.g20d6d67
pkgrel=2
pkgdesc='To Do List / Time Tracker with Jira Integration.'
arch=('x86_64')
url="http://super-productivity.com/"
license=('MIT')
depends=('gtk2' 'libxss' 'gconf' 'nss' 'nspr' 'libnotify' 'libappindicator' 'libxtst' 'alsa-lib')
makedepends=('npm' 'gulp' 'bower' 'yarn' 'chromium' 'libicns' 'graphicsmagick' 'python3')
provides=('superproductivity')
conflicts=('superproductivity')
source=("git+https://github.com/johannesjo/${_reponame}")
md5sums=('SKIP')

build() {
	cd ${srcdir}/${_reponame}
	npm install
	bower install
	CHROME_BIN=/usr/bin/chromium npm run dist -- -l deb

	#use the deb because it contains icon files and a .desktop file
	_pkgver=`git describe --abbrev=0 --tags | sed 's/^.//'`
	cd "${srcdir}/${_reponame}/dist/"
	ar -x superProductivity_${_pkgver}_amd64.deb
	tar -xf "data.tar.xz"
}



package() {
	cd ${srcdir}/${_reponame}
	install -d "${pkgdir}/opt/${_pkgname}"
	cp -a "${srcdir}/${_reponame}/dist/opt/${_pkgname}/." "${pkgdir}/opt/${_pkgname}"

	chmod 755 "${pkgdir}/opt/${_pkgname}/${_binname}"

	install -d "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/${_reponame}/dist/usr/share/applications/${_binname}.desktop" "${pkgdir}/usr/share/applications"

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_binname}" "${pkgdir}/usr/bin/${_binname}"

	for size in 16 24 32 48 64 96 128 256; do
		install -Dm644 "${srcdir}/${_reponame}/dist/usr/share/icons/hicolor/${size}x${size}/apps/${_binname}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_binname}.png"
    	done

	install -Dm644 "${srcdir}/${_reponame}/LICENSE" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"


}

pkgver() {
	cd ${srcdir}/${_reponame}
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


