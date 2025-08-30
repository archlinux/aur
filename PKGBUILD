# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=buchable-bin
_pkgname=buchable
pkgver=1.8.2
pkgrel=1
pkgdesc="The unofficial cross-platform app for Audiobookshelf"
arch=('x86_64')
url="https://github.com/Vito0912/abs_flutter"
license=('BSD-3-Clause')
depends=(
    'gtk3'
    'libsecret'
    'mpv'
    'libayatana-appindicator'
    'xdg-user-dirs'
)
source=("$pkgname-$pkgver.zip::https://github.com/Vito0912/abs_flutter/releases/download/v$pkgver/linux-release-$pkgver.zip")
sha256sums=('SKIP')
provides=('buchable')
conflicts=('buchable')

prepare() {
    mkdir -p src
    bsdtar -xf "$pkgname-$pkgver.zip" -C src
}

package() {
    cd src
    
    install -dm755 "$pkgdir/usr/lib/$_pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    
    cp -r data lib abs_flutter "$pkgdir/usr/lib/$_pkgname/"
    
    chmod +x "$pkgdir/usr/lib/$_pkgname/abs_flutter"

    cat > "$pkgdir/usr/bin/$_pkgname" << EOF
#!/bin/sh
exec /usr/lib/$_pkgname/abs_flutter "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$_pkgname"

    cat > "$pkgdir/usr/share/applications/buchable.desktop" << EOF
[Desktop Entry]
Name=Buchable
Comment=The unofficial cross-platform app for Audiobookshelf
Exec=buchable
Icon=buchable
Terminal=false
Type=Application
Categories=Audio;AudioVideo;Player;
StartupWMClass=buchable
X-GNOME-UsesNotifications=true
MimeType=audio/*;video/*;
EOF

    for size in 16 32 48 64 128 256; do
        install -dm755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        magick "data/flutter_assets/assets/images/logo/logo_blue_big_abs.png" -resize ${size}x${size} \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
    done

    install -Dm644 "data/flutter_assets/assets/images/logo/logo_blue_big_abs.png" \
        "$pkgdir/usr/share/pixmaps/$_pkgname.png"

    install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    cp "data/flutter_assets/assets/images/logo/logo_blue_big_abs.png" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.png"

    install -Dm644 "data/flutter_assets/NOTICES.Z" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
