# Maintainer: Rain Xelelo <rxelelo@outlook.com>
_pkgname=CatClient
pkgname=catclient
pkgver=1.0.1
pkgrel=0
pkgdesc="Yet another fork of TaterClient for DDNet"
arch=('x86_64')
url="https://github.com/quomy/CatClient/"
license=()
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'ffmpeg' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
checkdepends=('gmock')
optdepends=('ddnet-maps-git: All the maps used on the official DDNet Servers.'
	'discord-game-sdk: Enable rich presence in Discord desktop client.')
backup=('usr/share/ddnet/data/autoexec_server.cfg')
install="$pkgname.install"
source=("https://github.com/quomy/CatClient/releases/download/$pkgver/CatClient-$pkgver-linux_x86_64.tar.gz" "$pkgname.png")
sha256sums=('a5cb759dd16794928e59bf38cd4648a39d938b578126850e9df808b25c0135ba'
            'ccdd296572e6d931e08ba6aca14f14791a045b1c1e0d3c18b91c3b105c9541f0')

prepare() {
	mkdir -p $pkgname/game
	tar -xf "$_pkgname-$pkgver-linux_x86_64.tar.xz" -C $pkgname
	cp -r $pkgname/$_pkgname-*-linux_x86_64/* $pkgname/game
	rm -rf $pkgname/$_pkgname-*-linux_x86_64
	chmod +x $pkgname/game/DDNet
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
