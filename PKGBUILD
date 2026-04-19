# Maintainer: Sun Woo Kim <sun.kim101@outlook.com>
pkgname=livepaper-git
pkgver=r1.974c279
pkgrel=1
pkgdesc="Live wallpaper manager for Wayland using mpvpaper"
arch=('x86_64')
url="https://github.com/sunwoo101/livepaper"
license=('MIT')
depends=('mpvpaper')
makedepends=('dotnet-sdk')
provides=('livepaper')
conflicts=('livepaper')
source=("$pkgname::git+https://github.com/sunwoo101/livepaper.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    dotnet publish src/livepaper \
        -r linux-x64 \
        --self-contained \
        -c Release \
        -p:PublishSingleFile=true \
        -o publish
}

package() {
    cd "$pkgname"

    install -Dm755 publish/livepaper "$pkgdir/usr/bin/livepaper"

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
