# Maintainer: PLFJY zero@plfjy.top

pkgname=cloudmusic-web-player-qt
pkgver=1.0.0
pkgrel=1
pkgdesc='基于网页播放器封装的网易云音乐客户端，使用了 QT6 Webview 组件'
arch=('x86_64')
url='https://github.com/PLFJY/cloudmusic-web-player-qt'
license=('MIT')

depends=(
    'qt6-base'
    'qt6-webengine'
)

makedepends=(
    'cmake'
)

source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('de51f08ecf92c77a91c445833d6c553217a4bad71164ebd5086ac3abdf44201d')

build() {
    cmake \
        -S "$srcdir/$pkgname-$pkgver" \
        -B "$srcdir/build" \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build "$srcdir/build" --parallel
}

package() {
    # Executable
    install -Dm755 \
        "$srcdir/build/cloudmusic-web-player-qt" \
        "$pkgdir/usr/bin/cloudmusic-web-player-qt"

    # Icon
    install -Dm644 \
        "$srcdir/$pkgname-$pkgver/favicon.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

    # Desktop entry
    install -d "$pkgdir/usr/share/applications"

    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Cloud Music Web Player (Qt)
Comment=Unofficial NetEase Cloud Music web player
Exec=cloudmusic-web-player-qt
Icon=cloudmusic-web-player-qt
Terminal=false
Categories=AudioVideo;Audio;Player;
StartupWMClass=cloudmusic-web-player-qt
EOF

    # License
    install -Dm644 \
        "$srcdir/$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
