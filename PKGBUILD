# Maintainer: Liviu Nicoara <lnicoara at thinkoid dot org>

pkgname=tyler-git
pkgver=r51.66cb0ae
pkgrel=1
pkgdesc="Tiling Wayland compositor on wlroots, with the bar and launcher built in"
arch=('x86_64' 'aarch64')
url="https://github.com/thinkoid/tyler"
license=('WTFPL')
depends=('wlroots0.20' 'wayland' 'libxkbcommon' 'fcft' 'pixman' 'libdrm'
         'libinput')
# tllist: header-only, but fcft.pc Requires it, so meson's fcft lookup
# fails without the .pc at build time.
makedepends=('git' 'meson' 'wayland-protocols' 'tllist')
optdepends=('foot: default terminal (termcmd)'
            'libpulse: volume keys drive pactl'
            'light: brightness keys'
            'iw: wifi field in the bundled status feeder'
            'ttf-nerd-fonts-symbols: the private-use glyphs the bundled status feeder emits')
provides=('tyler')
conflicts=('tyler')
# SceneFX 0.5, the release tyler's meson wrap pins: arch-meson forbids
# wrap downloads, so it comes in here and goes to the package cache.
source=("tyler::git+https://github.com/thinkoid/tyler.git"
        "scenefx-0.5.tar.gz::https://github.com/wlrfx/scenefx/archive/refs/tags/0.5.tar.gz")
noextract=('scenefx-0.5.tar.gz')
sha256sums=('SKIP'
            '0fa8ecca0e310f813efd052624c5ed7d9153d6a0fdead5cc957d34c07f9a86c6')

pkgver() {
    cd tyler
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    mkdir -p tyler/subprojects/packagecache
    ln -sf "$srcdir/scenefx-0.5.tar.gz" tyler/subprojects/packagecache/
}

build() {
    arch-meson tyler build
    meson compile -C build
}

package() {
    # SceneFX is linked in statically; its headers and archive stay out
    meson install -C build --destdir "$pkgdir" --skip-subprojects
    install -Dm644 tyler/LICENSE \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
