# Maintainer: icepie, icepie.dev@gmail.com

_pkgname=macast
__pkgname=Macast
pkgname=${_pkgname}-git
pkgver=r105.4815a2c
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
source=(git+"${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$__pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${__pkgname}"
	echo '{}' > macast_setting.json
	echo -e '#! /bin/bash\ncd "/opt/Macast/" && python Macast.py || exit 1' > macast.sh
	#python setup.py build
}

package() {
	install -d  "${pkgdir}/opt/${__pkgname}"
	cp -r  "${__pkgname}" "${pkgdir}/opt/"
	install -d "${pkgdir}/usr/share/icons"
	cp "${__pkgname}"/assets/icon.png "${pkgdir}/usr/share/icons/Macast.png"
 	install -d "${pkgdir}/usr/share/applications"
	echo -e "[Desktop Entry]\nName=Macast\nComment=DLNA Media Renderer\nExec=/usr/bin/macast\nIcon=/usr/share/icons/Macast.png\nTerminal=false\nType=Application\nCategories=Video" > "${pkgdir}/usr/share/applications/macast.desktop"
	install -m 777 "${__pkgname}"/macast_setting.json "${pkgdir}/opt/${__pkgname}/macast_setting.json"
	install -d "${pkgdir}/usr/bin"
	install -m 755 "${__pkgname}"/macast.sh "${pkgdir}/usr/bin/macast"
}