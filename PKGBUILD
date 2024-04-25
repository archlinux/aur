# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
# Contributor: Aron Young <tkf6fkt at gmail dot com>
pkgname=chatbox-bin
pkgver=1.3.5
pkgrel=1
pkgdesc="a cross-platform desktop client for OpenAI API, also a prompt debugging and management tool."
arch=(x86_64)
url="https://chatboxapp.xyz"
license=(private) # the newest version is close sourced, github version is old
depends=(electron22 bash hicolor-icon-theme libindicator-gtk2)
provides=(chatbox)
install=.install
conflict=(chatbox)

source=(.install
	chatbox.desktop)
source_x86_64=(
	"https://download.chatboxai.app/releases/Chatbox-${pkgver}-x86_64.AppImage")

# source_aarch64=("https://github.com/Bin-Huang/chatbox/releases/download/v$pkgver/Chatbox-${pkgver}-arm64.deb")
sha256sums=('d431b60cb72f37d595f3703e26e5603e5bf487b463b10e65b49416498489a286'
            '964150e544005d46d0024f77d6853ae8ea03412992ea9a3035ccc4ba21bd7a28')
sha256sums_x86_64=('d6a5db781c6d0be05c63e86ad96c6b0ed94d31d06746f766666a8d5c031a52b4')

prepare() {
	chmod +x ./*.AppImage
	./*.AppImage --appimage-extract
}

package() {
	install -vDm755 /usr/lib/electron22/electron $pkgdir/usr/lib/electron22/electron22 # cheat isPackaged
	cp -av squashfs-root/usr $pkgdir/
	find $pkgdir \( -name "libXss.so*" -or -name "libXtst.so*" -or -name "libnotify*" -or -name "libindicator*" \) -print -delete

	install -d $pkgdir/opt/Chatbox
	cp -av squashfs-root/resources/ $pkgdir/opt/Chatbox/
	find $pkgdir/opt -type f -not -path "*/resources/*" -delete
	printf "#!/bin/sh
exec /usr/lib/electron22/electron22 /opt/Chatbox/resources/app.asar \"\$@\"
" | install -vDm755 /dev/stdin $pkgdir/usr/bin/chatbox
	find $pkgdir -name "*.desktop" -exec sed -i -r "s/Exec=.*/Exec=chatbox/" {} \;
	install -Dm644 chatbox.desktop -t $pkgdir/usr/share/applications/
	find $pkgdir -type d -empty -delete
}
