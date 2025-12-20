# Maintainer: unstable-code <assa0620@gmail.com>
pkgname=wshowlyrics-git
pkgver=r297.16dc6ea
pkgrel=1
pkgdesc="Wayland-based synchronized lyrics overlay with MPRIS integration"
arch=('x86_64' 'aarch64')
url="https://github.com/unstable-code/lyrics"
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'curl'
    'fontconfig'
    'openssl'
    'pango'
    'wayland'
    'playerctl'
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
source=("git+https://github.com/unstable-code/lyrics.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/lyrics"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/lyrics"
    arch-meson . build
    meson compile -C build
}

check() {
    cd "$srcdir/lyrics"
    # Verify binary was built successfully
    test -f build/lyrics
}

package() {
    cd "$srcdir/lyrics"

    # Install binary
    install -Dm755 build/lyrics "$pkgdir/usr/bin/wshowlyrics"

    # Install system-wide configuration file
    install -Dm644 settings.ini.example "$pkgdir/etc/wshowlyrics/settings.ini"

    # Install systemd user service file
    install -Dm644 wshowlyrics.service "$pkgdir/usr/lib/systemd/user/wshowlyrics.service"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
