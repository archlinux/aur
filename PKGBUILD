# Maintainer: Rain Xelelo <rxelelo@outlook.com>

pkgname=rclient
pkgver=3.0.1
pkgrel=0
pkgdesc="Yet another fork of TaterClient for DDNet"
arch=('x86_64')
url="https://rushie-client.ru/"
license=()
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'ffmpeg' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
checkdepends=('gmock')
optdepends=('ddnet-maps-git: All the maps used on the official DDNet Servers.'
	'discord-game-sdk: Enable rich presence in Discord desktop client.')
install="rclient.install"
source=("https://github.com/RushieClient/RushieClient-ddnet/releases/download/V$pkgver/RClient-ubuntu.tar.xz" "rclient.png")
sha256sums=('17d6dd80e79cfd5b32978eeba4264a26a4b59edcfb2479375bfc351e3beeaaa6'
            '99b0c10aafe311f6a26beb639dae27dbdd0d44c6394e7af224f865e397cd64de')

prepare() {
	mkdir -p rclient/game
	bsdtar -xf "RClient-ubuntu.tar.xz" -C rclient
	cp -r rclient/RClient-*-linux_x86_64/* rclient/game
	rm -rf rclient/RClient-*-linux_x86_64
	chmod +x rclient/game/DDNet
}

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a $pkgname "$pkgdir/opt/$pkgname"
	install -dm0755 "$pkgdir/usr/bin"
	install -dm0755 "$pkgdir/usr/share/applications/"
	cat >"$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/bash
exec /opt/$pkgname/game/DDNet
EOF
	chmod +x $pkgdir/usr/bin/$pkgname
	cat >"$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Version=$pkgver
Name=RClient
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
