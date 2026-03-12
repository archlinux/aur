# Maintainer: Eduardo Vozniak <evozniak@users.noreply.github.com>
pkgname=tupiscreen
pkgver=1.0.0
pkgrel=1
pkgdesc="Auto-switch display layout and audio output when a game controller is connected"
arch=('x86_64')
url="https://github.com/evozniak/TupiScreen"
license=('MIT')
depends=('kscreen' 'libpipewire')
makedepends=('dotnet-sdk>=9')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('670ecd54ac624c2dc29cb82dda55537bd65a44a60e84ba1b341294b4d91a0460')

build() {
    cd "TupiScreen-$pkgver"
    dotnet publish -c Release -r linux-x64 \
        -o "$srcdir/publish"
}

package() {
    # Install native libs + binary to /usr/lib/tupiscreen/
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    install -Dm755 "$srcdir/publish/TupiScreen"           "$pkgdir/usr/lib/$pkgname/TupiScreen"
    install -Dm755 "$srcdir/publish/libSkiaSharp.so"      "$pkgdir/usr/lib/$pkgname/libSkiaSharp.so"
    install -Dm755 "$srcdir/publish/libHarfBuzzSharp.so"  "$pkgdir/usr/lib/$pkgname/libHarfBuzzSharp.so"

    # Wrapper script in /usr/bin so the native libs are on LD_LIBRARY_PATH
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
export LD_LIBRARY_PATH="/usr/lib/tupiscreen:$LD_LIBRARY_PATH"
exec /usr/lib/tupiscreen/TupiScreen "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # .desktop file
    install -Dm644 "TupiScreen-$pkgver/packaging/tupiscreen.desktop" \
        "$pkgdir/usr/share/applications/tupiscreen.desktop"

    # Icon (512x512 PNG)
    install -Dm644 \
        "TupiScreen-$pkgver/assets/icons/hicolor/512x512/apps/tupiscreen.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/tupiscreen.png"

    # License
    install -Dm644 "TupiScreen-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
