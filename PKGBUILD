# Maintainer: Rain Xelelo <rxelelo@outlook.com>

pkgname=rclient
pkgver=2.1.0
pkgrel=1
pkgdesc="Yet another fork of TaterClient for DDNet"
arch=('x86_64')
url="https://rushie-client.ru/"
license=()
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'ffmpeg' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
checkdepends=('gmock')
optdepends=('ddnet-maps-git: All the maps used on the official DDNet Servers.'
            'discord-game-sdk: Enable rich presence in Discord desktop client.')
backup=('usr/share/ddnet/data/autoexec_server.cfg')
install="rclient.install"
source=("https://github.com/RushieClient/RushieClient-ddnet/releases/download/V$pkgver/RClient-ubuntu.tar.xz" "rclient.png")
sha256sums=('eba588cee87c935dcbb8f78bea5c5eb790473e81e13abf2f2d7f62dfdd4726c8'
            'af258dd9345943c5024efa534ebbf5cc14340741f393f36375b8f3c89ca736ab')

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
    cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/bash
exec /opt/$pkgname/game/DDNet
EOF
    chmod +x $pkgdir/usr/bin/$pkgname
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
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
    install -Dm0644 "$srcdir/$pkgname.png" "$pkgdir/opt/$pkgname/pkgname.png"
}
