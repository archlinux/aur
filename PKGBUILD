# Maintainer: dayvster <dayvi dot schuster at protonmail dot com>

# Builds a tagged release from source. Zig dependencies (libqt6zig, ziglua, kwinctl) are
# pinned in build.zig.zon and fetched in prepare(); build() and check() then run offline.
pkgname=zenkai
pkgver=1.7
pkgrel=1
pkgdesc="Fast application launcher with plugins, themes and window switching"
arch=('x86_64')
url="https://github.com/dayvster/zenkai"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('zig>=0.17' 'git')
optdepends=('qt6-wayland: Wayland support'
            'xdg-utils: open URLs and files'
            'wmctrl: window layout actions on X11'
            'xorg-xrandr: monitor layout actions on X11'
            'kwinctl: control KDE Plasma windows from the command line'
            'wl-clipboard: clipboard history on Wayland')
provides=('zenkai')
conflicts=('zenkai-bin')
# The build strips the binary, so a debug package would be empty.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dayvster/zenkai/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6496033b50861f05353ee41a3aae863749d2cb2a613fefdeb16267b3eaab4811')

prepare() {
    cd "$pkgname-$pkgver"
    export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
    # =all also fetches lazy dependencies (kwinctl), which the Linux build uses.
    zig build --fetch=all
}

build() {
    cd "$pkgname-$pkgver"
    export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
    # Baseline x86-64 rather than Zig's default of the build machine's own CPU.
    zig build -Dcpu=baseline --prefix "$srcdir/install"
}

check() {
    cd "$pkgname-$pkgver"
    export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
    QT_QPA_PLATFORM=offscreen zig build test -Dcpu=baseline
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$srcdir/install/bin/zenkai" "$pkgdir/usr/bin/zenkai"
    install -Dm644 zenkai.desktop "$pkgdir/usr/share/applications/zenkai.desktop"
    install -Dm644 assets/zenkai.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/zenkai.png"
    install -Dm644 README.md "$pkgdir/usr/share/doc/zenkai/README.md"
    install -Dm644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENCE.md"
    # zenkai looks for bundled plugins and translations in /usr/share/zenkai.
    install -dm755 "$pkgdir/usr/share/zenkai"
    cp -r external/plugins external/translations "$pkgdir/usr/share/zenkai/"
}
