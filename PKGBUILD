# Maintainer: Rain Xelelo <rxelelo@outlook.com>

pkgname=tclient-ddnet
pkgver=10.7.0
pkgrel=1
pkgdesc="Extended DDNet Teeworlds client."
arch=('x86_64')
url="https://tclient.app/"
license=()
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'ffmpeg' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
checkdepends=('gmock')
optdepends=('ddnet-maps-git: All the maps used on the official DDNet Servers.'
            'discord-game-sdk: Enable rich presence in Discord desktop client.')
backup=('usr/share/ddnet/data/autoexec_server.cfg')
install="tclient.install"
source=("https://github.com/sjrc6/TaterClient-ddnet/releases/download/V$pkgver/TClient-ubuntu.tar.xz" "tclient.png")
sha256sums=('987bd5d948e97aa3cc82861a36b7903e7d53592950ff8417bbce8fd34662b1a4'
            '29ecb3376c3fe0a56af495f71754c72c54f3e7f97031446e23a355833b954b65')

prepare() {
    mkdir -p tclient/game
    bsdtar -xf "TClient-ubuntu.tar.xz" -C tclient
    cp -r tclient/TClient-*-linux_x86_64/* tclient/game
    rm -rf tclient/TClient-*-linux_x86_64
    chmod +x tclient/game/DDNet
}


package() {
    install -dm0755 "$pkgdir/opt"
    cp -a tclient "$pkgdir/opt/$pkgname"
    install -dm0755 "$pkgdir/usr/bin"
    install -dm0755 "$pkgdir/usr/share/applications/"
    cat > "$pkgdir/usr/bin/tclient" << EOF
#!/bin/bash
exec /opt/$pkgname/game/DDNet
EOF
    chmod +x $pkgdir/usr/bin/tclient
    cat > "$pkgdir/usr/share/applications/tclient.desktop" << EOF
[Desktop Entry]
Version=$pkgver
Name=Tater Client
StartupNotify=true
TryExec=tclient
Exec=tclient
Terminal=false
Icon=/opt/$pkgname/tclient.png
Type=Application
Categories=Game
EOF
    install -Dm0644 "$srcdir/tclient.png" "$pkgdir/opt/$pkgname/tclient.png"
}
