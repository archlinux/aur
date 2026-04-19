# Maintainer: Sun Woo Kim <sun.kim101@outlook.com>
pkgname=livepaper-git
pkgver=r6.a0907c1
pkgrel=1
pkgdesc="Live wallpaper manager for Wayland using mpvpaper"
arch=('x86_64')
url="https://github.com/sunwoo101/livepaper"
license=('MIT')
depends=('mpvpaper' 'dotnet-runtime')
makedepends=('dotnet-sdk')
provides=('livepaper')
conflicts=('livepaper')
options=('!strip' '!debug')
source=("$pkgname::git+https://github.com/sunwoo101/livepaper.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    dotnet publish src/livepaper \
        -c Release \
        -r linux-x64 \
        --no-self-contained \
        -o publish
}

package() {
    cd "$pkgname"

    install -dm755 "$pkgdir/usr/lib/livepaper"
    cp -r publish/. "$pkgdir/usr/lib/livepaper/"

    # Remove non-linux-x64 platform runtimes bundled by NuGet packages
    find "$pkgdir/usr/lib/livepaper/runtimes" -mindepth 1 -maxdepth 1 \
        ! -name 'linux-x64' -exec rm -rf {} +

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/livepaper" <<'WRAPPER'
#!/bin/bash
exec dotnet /usr/lib/livepaper/livepaper.dll "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/livepaper"

    install -Dm644 src/livepaper/Assets/livepaper.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/livepaper.png"

    cat > "$srcdir/livepaper.desktop" <<'EOF'
[Desktop Entry]
Name=Livepaper
Comment=Live wallpaper manager for Wayland
Exec=livepaper
Icon=livepaper
Type=Application
Categories=Utility;
Keywords=wallpaper;live;wayland;video;
EOF
    install -Dm644 "$srcdir/livepaper.desktop" \
        "$pkgdir/usr/share/applications/livepaper.desktop"
}
