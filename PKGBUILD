# Maintainer: yeggis <yeggis@users.noreply.github.com>
pkgname=subsync
pkgver=1.0.0
pkgrel=1
pkgdesc="İngilizce videolar için Türkçe altyazı oluşturucu — yerel Whisper + Gemini API"
arch=('x86_64')
url="https://github.com/yeggis/subsync"
license=('MIT')
depends=(
    'python'
    'ffmpeg'
    'yt-dlp'
    'python-pip'
)
optdepends=(
    'mpv: varsayılan video oynatıcı'
    'vlc: alternatif video oynatıcı'
    'cuda: NVIDIA GPU hızlandırması'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/yeggis/subsync/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Ana dizin
    install -dm755 "$pkgdir/opt/$pkgname"
    install -m644 app.py config.py library.py pipeline.py tray.py \
        "$pkgdir/opt/$pkgname/"

    # launch.sh
    install -m755 launch.sh "$pkgdir/opt/$pkgname/"

    # Başlatıcı script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/usr/bin/env bash
exec bash /opt/subsync/launch.sh "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # Desktop dosyası
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=SubSync
Comment=İngilizce videolar için Türkçe altyazı oluşturucu
Exec=/usr/bin/$pkgname
Icon=accessories-dictionary
Terminal=false
Type=Application
Categories=AudioVideo;
EOF

    # Lisans
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"

    # README
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -m644 README.md "$pkgdir/usr/share/doc/$pkgname/"
}

post_install() {
    echo ""
    echo "SubSync kuruldu!"
    echo "Başlatmak için: subsync"
    echo "veya uygulama menüsünden SubSync'i arayın."
    echo ""
    echo "İlk açılışta Ayarlar sekmesinden Gemini API key girmeyi unutmayın."
    echo "Ücretsiz key: https://aistudio.google.com"
    echo ""
}
