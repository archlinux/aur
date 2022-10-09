# Maintainer: Natasha Nox <natanox@tutanota.com>
pkgname=booru-downloader-git
pkgver=1.0
pkgrel=1
pkgdesc="Downloader for different boorus"
arch=(x86_64)
url="https://gitlab.com/enigmatico/boorudownloader/"
license=('GPLv3')
depends=(python mpdecimal)
makedepends=(git pyinstaller)
backup=("~/.local/share/$pkgdir/")
_srcname=boorudownloader
source=("$_srcname::git+https://gitlab.com/enigmatico/boorudownloader.git")
md5sums=('SKIP')

build() {
	cd $_srcname
	pyinstaller --onefile --noconfirm downloader.py
	cd dist
	echo '{' > config.json
	echo '"COLLECTIONPATH": "'$HOME'/Downloads/boorudownloader/collections",' >> config.json
	echo '"CACHEPATH": "'$HOME'/.cache/boorudownloader",' >> config.json
	echo '"FAILED": "'$HOME'/Downloads/boorudownloader/failed-downloads",' >> config.json
	echo '"DATABASEPATH": "'$HOME'/.local/share/$pkgdir/db",' >> config.json
	echo '"LOGPATH": "'$HOME'/.local/share/$pkgdir/debug.log",' >> config.json
	echo '"LOG_MAX_RECURSION": 11,' >> config.json
	echo '"LOG_WRITE_TO_STDOUT": "True",' >> config.json
	echo '"LOG_VERBOSE_STDOUT": "False",' >> config.json
	echo '"LOG_ROLLER": "True",' >> config.json
	echo '"LOG_ROLLER_LINES": 30000,' >> config.json
	echo '"LOG_DUMP_BYTES": "True",' >> config.json
	echo '"LOG_DUMP_BYTES_LENGTH": 512' >> config.json
	echo '}' >> config.json
	echo "Created standard config file in /var/boorudownloader"
}

package() {
	cd $_srcname/dist
	install -d "$pkgdir/var/boorudownloader/"
	cp -av config.json "$pkgdir/var/boorudownloader/"
	
	install -d "$pkgdir/usr/bin/"
	cp -av downloader "$pkgdir/usr/bin/$pkgname"
	chmod 755 "$pkgdir/usr/bin/$pkgname"
}