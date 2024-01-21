# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
# Contributor: Aron Young <tkf6fkt at gmail dot com>
pkgname=chatbox-bin
pkgver=1.2.2
pkgrel=3
pkgdesc="a cross-platform desktop client for OpenAI API, also a prompt debugging and management tool."
arch=(x86_64 aarch64)
url="https://chatboxapp.xyz"
license=('GPL')
depends=(electron22 bash hicolor-icon-theme)
provides=(chatbox)
install=.install

source=(.install)
source_x86_64=("https://github.com/Bin-Huang/chatbox/releases/download/v$pkgver/Chatbox-${pkgver}-amd64.deb")

source_aarch64=("https://github.com/Bin-Huang/chatbox/releases/download/v$pkgver/Chatbox-${pkgver}-arm64.deb")
sha256sums=('d431b60cb72f37d595f3703e26e5603e5bf487b463b10e65b49416498489a286')
sha256sums_x86_64=('04ba834634dbdee9b902e1a60788aadb8e74c43a61a81250467fdbcf3d370548')
sha256sums_aarch64=('e1d48f491b2edc596fa68670507c3e787212a3eacf723f470b0e9beedaf8e66a')

package() {
	install -vDm755 /usr/lib/electron22/electron $pkgdir/usr/lib/electron22/electron22 # cheat isPackaged
	tar -xvpf data.tar.xz -C $pkgdir
	find $pkgdir/opt -type f -not -path "*/resources/*" -delete
	printf "#!/bin/sh
exec /usr/lib/electron22/electron22 /opt/Chatbox/resources/app.asar \"\$@\"
" | install -vDm755 /dev/stdin $pkgdir/usr/bin/chatbox
	find $pkgdir -name "*.desktop" -exec sed -i -r "s/Exec=.*/Exec=chatbox/" {} \;
	find $pkgdir -type d -empty -delete
}
