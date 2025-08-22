# Maintainer: Rain Xelelo <rxelelo@outlook.com>

pkgname=tclient-ddnet
pkgver=10.4.0
shortened_ver=${pkgver%??}
pkgrel=3
pkgdesc="Extended DDNet Teeworlds client."
arch=('x86_64')
url="https://tclient.app/"
license=()
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'ffmpeg' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
checkdepends=('gmock')
optdepends=('ddnet-maps-git: All the maps used on the official DDNet Servers.'
            'discord-game-sdk: Enable rich presence in Discord desktop client.')
backup=('usr/share/ddnet/data/autoexec_server.cfg')

source=("https://github.com/sjrc6/TaterClient-ddnet/releases/download/V$pkgver/TClient-ubuntu.tar.xz" "tclient.png")
sha256sums=('18b9b5ef9a0877183e914e70ab668f35de8b4baa524799646a2764785f635fbf'
            '29ecb3376c3fe0a56af495f71754c72c54f3e7f97031446e23a355833b954b65')

prepare() {
    mkdir -p tclient
    bsdtar -xf "TClient-ubuntu.tar.xz" -C tclient
    chmod +x tclient/TClient-$shortened_ver-linux_x86_64/DDNet
}


package() {
    install -dm0755 "$pkgdir/opt"
    cp -a tclient "$pkgdir/opt/$pkgname"
    install -dm0755 "$pkgdir/usr/bin"
    install -dm0755 "$pkgdir/usr/share/applications/"
    cat > "$pkgdir/usr/bin/tclient" << EOF
#!/bin/bash
exec /opt/$pkgname/TClient-$shortened_ver-linux_x86_64/DDNet
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
