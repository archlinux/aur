# Maintainer: yeggis <yeggis@users.noreply.github.com>
pkgname=whisper2tr
pkgver=1.0.0
pkgrel=1
pkgdesc="İngilizce videolar için Türkçe altyazı oluşturucu — yerel Whisper + Gemini API"
arch=('x86_64')
url="https://github.com/yeggis/whisper2tr"
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/yeggis/whisper2tr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -dm755 "$pkgdir/opt/$pkgname"
    install -m644 app.py config.py library.py pipeline.py tray.py \
        "$pkgdir/opt/$pkgname/"

    install -m755 launch.sh "$pkgdir/opt/$pkgname/"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/usr/bin/env bash
exec bash /opt/whisper2tr/launch.sh "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=whisper2tr
Comment=İngilizce videolar için Türkçe altyazı oluşturucu
Exec=/usr/bin/$pkgname
Icon=accessories-dictionary
Terminal=false
Type=Application
Categories=AudioVideo;
EOF

    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"

    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -m644 README.md "$pkgdir/usr/share/doc/$pkgname/"
}

post_install() {
    echo ""
    echo "whisper2tr kuruldu!"
    echo "Başlatmak için: whisper2tr"
    echo "veya uygulama menüsünden whisper2tr'yi arayın."
    echo ""
    echo "İlk açılışta Ayarlar sekmesinden Gemini API key girmeyi unutmayın."
    echo "Ücretsiz key: https://aistudio.google.com"
    echo ""
}
