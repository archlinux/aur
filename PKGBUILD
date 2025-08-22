# Maintainer: Rain Xelelo <rxelelo@outlook.com>

pkgname=cactus-client
pkgver=1.14
pkgrel=2
# allow testing locally a release candidate using pkgver like '19.3rc3'
_version=${pkgver/rc/-rc}
pkgdesc="A DDRaceNetwork modification adding new feauters"
arch=('x86_64')
url="https://cactuss.top//"
license=()
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'ffmpeg' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
checkdepends=('gmock')
optdepends=('ddnet-maps-git: All the maps used on the official DDNet Servers.'
            'discord-game-sdk: Enable rich presence in Discord desktop client.')
backup=('usr/share/ddnet/data/autoexec_server.cfg')

source=("https://dw.cactuss.top/$_version/Cactus-$_version-public-linux_x86_64.tar.xz" "cactus-client.png")
sha256sums=('88b44bb74ff954ee3ac3701257162593dc73ec9a849a7943ca0a84aec1dac7b5'
            '8508552983950820bd5c8829bd43e714a4a958a084211dc1a8be6619f8d0b742')

prepare() {
    mkdir -p cactus
    bsdtar -xf "Cactus-$_version-public-linux_x86_64.tar.xz" -C cactus
    chmod +x cactus/Cactus-$_version-public-linux_x86_64/DDNet
}


package() {
    install -dm0755 "$pkgdir/opt"
    install -dm0755 "$pkgdir/usr/bin"
    install -dm0755 "$pkgdir/usr/share/applications"
    cp -a cactus "$pkgdir/opt/$pkgname"
    cat > "$pkgdir/usr/bin/cactus-client"  << EOF
#!/bin/bash
exec /opt/cactus-client/Cactus-1.14-public-linux_x86_64/DDNet
EOF
    chmod +x $pkgdir/usr/bin/cactus-client
    cat > "$pkgdir/usr/share/applications/cactus-client.desktop"  << EOF
[Desktop Entry]
Version=1.14
Name=Cactus Client
StartupNotify=true
TryExec=cactus-client
Exec=cactus-client
Terminal=false
Icon=/opt/cactus-client/cactus-client.png
Type=Application
Categories=Game
EOF
    install -Dm0644 "$srcdir/cactus-client.png" "$pkgdir/opt/cactus-client/cactus-client.png"
}
