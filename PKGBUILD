# Maintainer: Kuro <kuro@kuro.sh>
pkgname=nihongolofi
pkgver=1.1.0
pkgrel=1
pkgdesc="Temporizador Pomodoro con musica lofi japonesa en vivo"
arch=('x86_64')
url="https://github.com/kurojs/NihongoLofi"
license=('MIT')
depends=('electron>=28' 'yt-dlp' 'hicolor-icon-theme')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kurojs/NihongoLofi/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/NihongoLofi-$pkgver"
    npm install --omit=dev
}

package() {
    cd "$srcdir/NihongoLofi-$pkgver"

    local install_dir="/usr/lib/$pkgname"
    install -dm755 "$pkgdir$install_dir"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    cp -dr --no-preserve=ownership \
        main.js timer.js package.json package-lock.json \
        pages/ img/ sounds/ \
        "$pkgdir$install_dir/"

    # Binaries (yt-dlp bundled for Windows only — Linux uses system package)
    install -dm755 "$pkgdir$install_dir/bin"
    cp -dr --no-preserve=ownership bin/yt-dlp.exe "$pkgdir$install_dir/bin/"

    # Desktop entry
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=日本語
Comment=$pkgdesc
Exec=/usr/bin/$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=Utility;Audio;
StartupWMClass=NihongoLofi
EOF

    # Icon
    install -Dm644 celeste.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

    # Launcher
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
exec /usr/bin/electron /usr/lib/nihongolofi "$@"
EOF
}
