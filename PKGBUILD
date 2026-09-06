# Maintainer: Liviu Nicoara <lnicoara at thinkoid dot org>

pkgname=tyler-git
pkgver=r27.84565f9
pkgrel=1
pkgdesc="A dwm-shaped Wayland compositor: tiling, tags, in-compositor bar and menu"
arch=('x86_64')
url="https://github.com/thinkoid/tyler"
license=('WTFPL')
depends=('wlroots0.19' 'wayland' 'libxkbcommon' 'fcft' 'pixman' 'libdrm'
         'libinput')
# tllist: header-only, but fcft.pc Requires it, so meson's fcft lookup
# fails without the .pc at build time.
makedepends=('git' 'meson' 'wayland-protocols' 'tllist')
optdepends=('foot: default terminal (termcmd)'
            'libpulse: volume keys drive pactl'
            'light: brightness keys'
            'iw: wifi field in the bundled status feeder'
            'ttf-iosevkaterm-nerd: the bar glyphs config.h names')
provides=('tyler')
conflicts=('tyler')
source=("tyler::git+https://github.com/thinkoid/tyler.git")
sha256sums=('SKIP')

pkgver() {
    cd tyler
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    arch-meson tyler build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 tyler/LICENSE \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
