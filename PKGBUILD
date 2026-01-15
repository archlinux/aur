# Maintainer: Andy Stewart <lazycat.manatee@gmail.com>
pkgname=lazycat-terminal
pkgver=0.1.6
pkgrel=1
pkgdesc="A high-performance terminal emulator with tabs, splits and transparent background"
arch=('x86_64')
url="https://github.com/manateelazycat/lazycat-terminal"
license=('GPL-3.0-or-later')
depends=(
    'gtk4'
    'vte4'
    'gdk-pixbuf2'
    'fontconfig'
)
makedepends=(
    'meson'
    'vala'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a394767939c2c1ba0d3ea880ce536c75d1ff28e563a080a6d19bf40909fa8165')

build() {
    cd "$pkgname-$pkgver"
    arch-meson build
    meson compile -C build
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm755 build/lazycat-terminal "$pkgdir/usr/bin/lazycat-terminal"

    # Install desktop file
    install -Dm644 lazycat-terminal.desktop "$pkgdir/usr/share/applications/lazycat-terminal.desktop"

    # Fix Exec path in desktop file
    sed -i 's|Exec=.*|Exec=/usr/bin/lazycat-terminal|' "$pkgdir/usr/share/applications/lazycat-terminal.desktop"

    # Install icons
    install -Dm644 icons/lazycat-terminal.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/lazycat-terminal.svg"
    for size in 32 48 96 128; do
        install -Dm644 "icons/${size}x${size}/lazycat-terminal.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/lazycat-terminal.png"
    done

    # Install themes
    install -dm755 "$pkgdir/usr/share/lazycat-terminal/theme"
    install -m644 theme/* "$pkgdir/usr/share/lazycat-terminal/theme/"

    # Install default config
    install -Dm644 config.conf "$pkgdir/usr/share/lazycat-terminal/config.conf"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
