# Maintainer: icepie, icepie.dev@gmail.com

_pkgname=macast
__pkgname=Macast
pkgname=${_pkgname}-git
pkgver=r115.a5d4a9c
pkgrel=1
pkgdesc="DLNA Media Renderer"
arch=('any')
url="https://github.com/xfangfang/Macast"
license=('GPL3')
conflicts=('macast')
depends=(
	'python'
	'python-pillow'
	'python-pystray'
	'python-lxml'
	'python-pyperclip'
	'python-cherrypy'
	'mpv'
	)
source=(git+"${url}.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
	cd "$__pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${__pkgname}"
	echo -e '#! /bin/bash\ncd "/opt/Macast/" && python Macast.py || exit 1' > macast.sh
	#python setup.py build
}

package() {
	install -d  "${pkgdir}/opt/${__pkgname}"
	cp -r  "${__pkgname}/assets" "${pkgdir}/opt/${__pkgname}"
	cp -r  "${__pkgname}/i18n" "${pkgdir}/opt/${__pkgname}"
	cp -r  "${__pkgname}/LICENSE" "${pkgdir}/opt/${__pkgname}"
	cp -r  "${__pkgname}/macast" "${pkgdir}/opt/${__pkgname}"
	cp "${__pkgname}/Macast.py" "${pkgdir}/opt/${__pkgname}"
	cp "${__pkgname}/.version" "${pkgdir}/opt/${__pkgname}"

	install -d "${pkgdir}/usr/share/icons"
	cp "${__pkgname}"/assets/icon.png "${pkgdir}/usr/share/icons/Macast.png"
 	install -d "${pkgdir}/usr/share/applications"
	echo -e "[Desktop Entry]\nName=Macast\nComment=DLNA Media Renderer\nExec=/usr/bin/macast\nIcon=/usr/share/icons/Macast.png\nTerminal=false\nType=Application\nCategories=Video" > "${pkgdir}/usr/share/applications/macast.desktop"
	install -d "${pkgdir}/usr/bin"
	install -m 755 "${__pkgname}"/macast.sh "${pkgdir}/usr/bin/macast"
}
