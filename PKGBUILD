# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=buchable
_pkgname=buchable
pkgver=1.8.1
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
makedepends=(
    'flutter'
    'clang'
    'cmake'
    'ninja'
    'pkgconf'
    'xz'
    'gtk3'
    'imagemagick'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
provides=('buchable')
conflicts=('buchable')

prepare() {
    cd "abs_flutter-$pkgver"
    flutter pub get
}

build() {
    cd "abs_flutter-$pkgver"
    
    # Fix build error
    export CFLAGS="${CFLAGS} -Wno-error=deprecated-declarations"
    export CXXFLAGS="${CXXFLAGS} -Wno-error=deprecated-declarations"
    
    flutter build linux --release
}

package() {
    cd "abs_flutter-$pkgver"

    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/$_pkgname"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    cp -r build/linux/x64/release/bundle/* "$pkgdir/usr/lib/$_pkgname/"

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
        magick "assets/images/logo/logo_blue_big_abs.png" -resize ${size}x${size} \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
    done

    install -Dm644 "assets/images/logo/logo_blue_big_abs.png" \
        "$pkgdir/usr/share/pixmaps/$_pkgname.png"

    install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    cp "assets/images/logo/logo_blue_big_abs.png" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.png"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
