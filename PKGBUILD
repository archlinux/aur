# Maintainer: ksandr <ru@ksandr.online>


_pkgname=python-rssd
pkgname="${_pkgname}-usermode"
_commit=1e62ca2
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
# optdepends=('python-requests-html: for parsing inaccessible RSS')
source=(git+${url}.git#commit=${_commit})
md5sums=('SKIP')

prepare() {
    tar -zxvf ${srcdir}/${_pkgname}/icons.tar.gz
}

build() {
	python -m compileall "${srcdir}/${_pkgname}/${_pkgname}.py" -b
}

package() {
	install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}.pyc" "${pkgdir}/$HOME/.local/bin/${_pkgname}.pyc"

	install -Dm644 "${srcdir}/${_pkgname}/config.py" "${pkgdir}/$HOME/.config/${_pkgname}/config.py"
	install -Dm644 "${srcdir}/${_pkgname}/readme.md" "${pkgdir}/$HOME/.config/${_pkgname}/readme.md"
	install -Dm644 "${srcdir}/${_pkgname}/readme_EN.md" "${pkgdir}/$HOME/.config/${_pkgname}/readme_EN.md"

	install -d "${pkgdir}/$HOME/.local/share/icons/hicolor/48x48/apps"
	install -Dm444 "${srcdir}/icons/"* "${pkgdir}/$HOME/.local/share/icons/hicolor/48x48/apps/"

	install -Dm644 "${srcdir}/${_pkgname}/${_pkgname}-usermode.service" "${pkgdir}/$HOME/.local/share/systemd/user/${_pkgname}.service"
	install -Dm644 "${srcdir}/${_pkgname}/${_pkgname}.timer" "${pkgdir}/$HOME/.local/share/systemd/user/${_pkgname}.timer"

	chown $USER:$USER -Rc ${pkgdir}
}
