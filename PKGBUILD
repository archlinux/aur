# Maintainer: yeggis <yeggis@users.noreply.github.com>
pkgname=whisper2tr-git
pkgver=r1.05d87c3
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
provides=('whisper2tr')
conflicts=('whisper2tr')
source=("$pkgname::git+https://github.com/yeggis/whisper2tr.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"

    install -dm755 "$pkgdir/opt/whisper2tr"
    install -m644 app.py config.py library.py pipeline.py tray.py \
        "$pkgdir/opt/whisper2tr/"

    install -m755 launch.sh "$pkgdir/opt/whisper2tr/"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/whisper2tr" << 'EOF'
#!/usr/bin/env bash
exec bash /opt/whisper2tr/launch.sh "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/whisper2tr"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/whisper2tr.desktop" << EOF
[Desktop Entry]
Name=whisper2tr
Comment=İngilizce videolar için Türkçe altyazı oluşturucu
Exec=/usr/bin/whisper2tr
Icon=accessories-dictionary
Terminal=false
Type=Application
Categories=AudioVideo;
EOF

    install -dm755 "$pkgdir/usr/share/licenses/whisper2tr"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/whisper2tr/"

    install -dm755 "$pkgdir/usr/share/doc/whisper2tr"
    install -m644 README.md "$pkgdir/usr/share/doc/whisper2tr/"
}

post_install() {
    echo ""
    echo "whisper2tr kuruldu!"
    echo "Başlatmak için: whisper2tr"
    echo ""
    echo "İlk açılışta Ayarlar sekmesinden Gemini API key girmeyi unutmayın."
    echo "Ücretsiz key: https://aistudio.google.com"
    echo ""
}
