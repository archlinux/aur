# Maintainer: Rain Xelelo <rxelelo@outlook.com>

_pkgname=BestClient
pkgname=bestclient
pkgver=2.2.2
pkgrel=1
pkgdesc="Yet another fork of TaterClient for DDNet"
arch=('x86_64')
url="https://bestclient.fun/"
license=()
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'ffmpeg' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
optdepends=('ddnet-maps-git: All the maps used on the official DDNet Servers.'
	'discord-game-sdk: Enable rich presence in Discord desktop client.')
source=(
	"https://github.com/BestProjectTeam/BestClient/releases/download/v${pkgver}/BestClient-linux.tar.xz"
	"bestclient.png")
sha256sums=('d756d58bf7806434952a7640fad7cd6a157f5c1e9fbf9e34912984a6770f6528'
            'a118504f690407019294b39bea26920e2cddee94c032a1e5fae1ea216c9ea64f')

prepare() {
	mkdir -p client/game
	bsdtar -xf "$_pkgname-linux.tar.xz" -C client
	cp -a client/${pkgname}-*-linux_x86_64/* client/game
	chmod +x client/game/DDNet
}

package() {
	install -dm0755 "$pkgdir/opt/$pkgname"
	cp -r $srcdir/client/game/* "$pkgdir/opt/$pkgname"
	install -dm0755 "$pkgdir/usr/bin"
	install -dm0755 "$pkgdir/usr/share/applications/"
	cat >"$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/bash
exec /opt/$pkgname/DDNet
EOF
	chmod +x $pkgdir/usr/bin/$pkgname
	cat >"$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Version=$pkgver
Name=$_pkgname
StartupNotify=true
TryExec=$pkgname
Exec=$pkgname
Terminal=false
Icon=/opt/$pkgname/$pkgname.png
Type=Application
Categories=Game
EOF
	install -Dm0644 "$srcdir/$pkgname.png" "$pkgdir/opt/$pkgname/$pkgname.png"
}
