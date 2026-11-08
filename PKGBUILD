# Maintainer: Shaun McCloud <smccloud@smccloud.com>
pkgname=shauns_audio_visualizer
pkgver=1.0.0
pkgrel=6
pkgdesc="A retro audio visualizer for Linux (console renderer)"
arch=('x86_64')
url="https://github.com/smccloud/Shauns_Audio_Visualizer"
license=('MIT')
depends=('dotnet-runtime-10.0' 'dotnet-sdk-10.0')
options=(!strip)
optdepends=('pipewire: PipeWire audio support'
            'pulseaudio: PulseAudio audio support')
makedepends=('dotnet-sdk-10.0' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/Shauns_Audio_Visualizer-$pkgver"
    dotnet publish ShaunsAudioVisualizer/ShaunsAudioVisualizer.csproj \
        --configuration Release \
        --framework net10.0 \
        --runtime linux-x64 \
        --self-contained false \
        --output "$srcdir/publish"
}

package() {
    cd "$srcdir"
    install -d "$pkgdir/opt/$pkgname"
    cp -a publish/. "$pkgdir/opt/$pkgname/"

    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
exec /opt/shauns-audio-visualizer/ShaunsAudioVisualizer "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    install -d "$pkgdir/usr/share/pixmaps"
    install -m644 "$srcdir/Shauns_Audio_Visualizer-$pkgver/ShaunsAudioVisualizer/app-icon.ico" \
        "$pkgdir/usr/share/pixmaps/$pkgname.ico"

    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Shauns Audio Visualizer
Comment=Retro audio visualizer (console and GUI)
Exec=/usr/bin/$pkgname --gui
Icon=/usr/share/pixmaps/$pkgname.ico
Terminal=false
Categories=AudioVideo;Audio;
EOF

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 "$srcdir/Shauns_Audio_Visualizer-$pkgver/LICENSE.md" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
