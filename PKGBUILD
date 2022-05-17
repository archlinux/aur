# Maintainer: ksandr <ru@ksandr.online>

pkgname=python-rssd-usermode
pkgver=1
pkgrel=1
pkgdesc='A service for displaying the latest news from RSS feeds via notify.'
_pkgdesc_ru='Cервис отображениея последних новостей из лент RSS через notify.'
arch=('x86_64')
license=('GPL')
install=$pkgname.install
provides=("${pkgname}")
url="https://gitflic.ru/project/ksandr/python-rssd"
depends=('python' 'python-dbus' 'python-feedparser')
optdepends=('python-requests-html: for parsing inaccessible RSS')
source=(git+$url.git)
md5sums=('SKIP')

prepare() {
    tar -zxvf ${srcdir}/$pkgname/icons.tar.gz
}

package() {
	install -Dm644 ${srcdir}/$pkgname/python-rssd.py "$pkgdir/$HOME/.local/bin/python-rssd.py"
	chmod +x $pkgdir/$HOME/.local/bin/python-rssd.py

	install -Dm644 ${srcdir}/$pkgname/config.py "$pkgdir/$HOME/.config/$pkgname/config.py"

	install -d $pkgdir/$HOME/.config/$pkgname/icons
	install -Dm644 ${srcdir}/icons/* "$pkgdir/$HOME/.config/$pkgname/icons/"

	install -Dm644 ${srcdir}/$pkgname/python-rssd.service "$pkgdir/$HOME/.config/systemd/user/python-rssd.service"
	install -Dm644 ${srcdir}/$pkgname/python-rssd.timer "$pkgdir/$HOME/.config/systemd/user/python-rssd.timer"

	install -d $pkgdir/$HOME/.local/share/applications
	echo "[Desktop Entry]
Version=1.0
Type=Application
Name=Python RSS daemon
Comment=Show last RSS-news in notify
Categories=Network
Exec=$HOME/.local/bin/python-rssd.py
Terminal=false
Icon=internet-news-reader
GenericName=Python RSS daemon
Name[ru]=Загрузка новостей..." > "$pkgdir/$HOME/.local/share/applications/python-rssd.desktop"

	chown $USER:$USER -Rc $pkgdir
}
