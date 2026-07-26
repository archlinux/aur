# Maintainer: unstable-code <assa0620@gmail.com>
pkgname=wshowlyrics-git
pkgver=r553.a476390
pkgrel=1
pkgdesc="Wayland-based synchronized lyrics overlay with MPRIS integration"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/wshowlyrics/wshowlyrics"
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'curl'
    'fontconfig'
    'openssl'
    'pango'
    'wayland'
    'libappindicator-gtk3'
    'gdk-pixbuf2'
)
optdepends=(
    'snixembed: System tray support for Swaybar'
    'libexttextcat: Language detection for translation validation'
)
makedepends=(
    'git'
    'meson'
    'ninja'
    'wayland-protocols'
)
provides=('wshowlyrics')
conflicts=('wshowlyrics')
source=("git+https://gitlab.com/wshowlyrics/wshowlyrics.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/wshowlyrics"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/wshowlyrics"
    # Ensure a fresh meson setup. Without this, a cached build/ from an
    # older meson minor version (e.g. 1.10 -> 1.11) refuses to compile.
    rm -rf build
    arch-meson . build
    meson compile -C build
}

check() {
    cd "$srcdir/wshowlyrics"
    # Verify binary was built successfully
    test -f build/lyrics
}

package() {
    cd "$srcdir/wshowlyrics"

    # Install binary
    install -Dm755 build/lyrics "$pkgdir/usr/bin/wshowlyrics"

    # Install helper script for runtime offset control
    install -Dm755 wshowlyrics-offset "$pkgdir/usr/bin/wshowlyrics-offset"

    # Install system-wide configuration file
    install -Dm644 settings.ini.example "$pkgdir/etc/wshowlyrics/settings.ini"

    # Install systemd user service file
    install -Dm644 wshowlyrics.service "$pkgdir/usr/lib/systemd/user/wshowlyrics.service"

    # Install desktop file
    install -Dm644 wshowlyrics.desktop "$pkgdir/usr/share/applications/wshowlyrics.desktop"

    # Install icon
    install -Dm644 wshowlyrics.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/wshowlyrics.svg"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
