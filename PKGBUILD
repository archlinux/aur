# Maintainer: Vitalii Rybalko <vilko dot a at gmail dot com>

pkgname=playkey-linux
pkgver=1.3
pkgrel=1
pkgdesc='Client for game streaming service playkey.net'
arch=('x86_64')
url='https://www.playkey.net'
license=('custom')
options=('!strip')
provides=('playkey-linux')
conflicts=()
depends=(
	'chromium'
	'wine'
	'python3'
	'winetricks'
	'openal'
	'lib32-openal'
)
makedepends=(
	'git'
	'innoextract'
)
install=
source_x86_64=(
	'https://static.playkey.net/clientdownload.aspx?file=windows-desktop/Release/PlaykeySetup.exe&name=PlaykeySetup.exe'
	'git+https://github.com/vilkoz/playkey-linux-launcher.git'
)
sha256sums_x86_64=(
	'c26b3bcd1ad2b6236ef88be013f7cde65682d4377537438f5d352704d0fdcff3'
	'SKIP'
)

prepare() {
	msg2 'Extracting PlaykeySetup.exe'
	innoextract 'PlaykeySetup.exe&name=PlaykeySetup.exe'
}

package() {
	msg2 'Creating installation folder'
	install -d -m755 $pkgdir/usr/share/playkey-linux

	msg2 'Copying windows binaries'
	cp -ra app/* $pkgdir/usr/share/playkey-linux
	find $pkgdir/usr/share/playkey-linux -type d -exec chmod 755 "{}" \;
	find $pkgdir/usr/share/playkey-linux -type f -exec chmod 644 "{}" \;

	msg2 'Copying playkey-linux-launcher scripts'
	install playkey-linux-launcher/xdg-open $pkgdir/usr/share/playkey-linux
	install -d -m755 $pkgdir/usr/bin
	install -m755 playkey-linux-launcher/playkey-linux $pkgdir/usr/bin

	msg2 'Copying playkey-linux-launcher chrome user-agent extension'
	install -d -m755 $pkgdir/usr/share/playkey-linux/extension
	cp -ra playkey-linux-launcher/extension/* $pkgdir/usr/share/playkey-linux/extension/
	find $pkgdir/usr/share/playkey-linux/extension/ -type f -exec chmod 644 "{}" \;
}

