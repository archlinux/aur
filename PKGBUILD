# Maintainer: ksandr <ru@ksandr.online>


_pkgname=python-rssd
pkgname=${_pkgname}-usermode
_commit=7392dd0
pkgver=1.${_commit}
pkgrel=1
pkgdesc='A service for displaying the latest news from RSS feeds via notify.'
_pkgdesc_ru='Cервис отображениея последних новостей из лент RSS через notify.'
arch=('any')
license=('GPL')
install=${pkgname}.install
provides=("${_pkgname}")
url="https://gitflic.ru/project/ksandr/${_pkgname}"
depends=('python' 'dbus-python' 'python-feedparser')
makedepends=('gendesk')
# optdepends=('python-requests-html: for parsing inaccessible RSS')
source=(git+${url}.git#commit=${_commit})
md5sums=('SKIP')

prepare() {
    tar -zxvf ${srcdir}/${_pkgname}/icons.tar.gz

    # Create .desktop file.
	gendesk -f -n \
		--pkgname "${_pkgname}" \
		--pkgdesc "${pkgdesc}" \
		--name "Last news loader..." \
		--genericname "Python RSS daemon" \
		--comment "Show last RSS-news in notify" \
		--exec "/usr/bin/env python $HOME/.local/bin/${_pkgname}.pyc" \
		--categories "Network;" \
		--icon "internet-news-reader"
}

build() {
	python -m compileall "${srcdir}/${_pkgname}/${_pkgname}.py" -b
}

package() {
	install -Dm644 "${srcdir}/${_pkgname}/${_pkgname}.pyc" "${pkgdir}/$HOME/.local/bin/${_pkgname}.pyc"
	chmod +x "${pkgdir}/$HOME/.local/bin/${_pkgname}.pyc"

	install -Dm644 "${srcdir}/${_pkgname}/config.py" "${pkgdir}/$HOME/.config/${_pkgname}/config.py"

	install -d "${pkgdir}/$HOME/.local/share/icons/hicolor/48x48/apps"
	install -Dm644 "${srcdir}/icons/"* "${pkgdir}/$HOME/.local/share/icons/hicolor/48x48/apps/"

	install -Dm644 "${srcdir}/${_pkgname}/${_pkgname}.service" "${pkgdir}/$HOME/.config/systemd/user/${_pkgname}.service"
	install -Dm644 "${srcdir}/${_pkgname}/${_pkgname}.timer" "${pkgdir}/$HOME/.config/systemd/user/${_pkgname}.timer"

	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/$HOME/.local/share/applications/${_pkgname}.desktop"

	chown $USER:$USER -Rc ${pkgdir}
}
