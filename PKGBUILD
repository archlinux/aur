# Maintainer: Tim Culverhouse <tim at timculverhouse dot com>

pkgname=monstar-git
pkgver=r170.7538e56
pkgrel=1
pkgdesc='Small Wayland terminal emulator built on Ghostty terminal core'
arch=(x86_64)
url='https://github.com/rockorager/monstar'
license=(MIT)
depends=(
    dbus
    fontconfig
    freetype2
    ghostty-terminfo
    glibc
    harfbuzz
    libxkbcommon
    wayland
)
makedepends=(
    git
    'wayland-protocols>=1.49'
    'zig>=0.16.0'
)
optdepends=(
    'systemd: launch additional terminal windows'
    'xdg-desktop-portal: open links and files through a desktop portal'
    'xdg-utils: open links when a desktop portal is unavailable'
)
provides=("monstar=$pkgver")
conflicts=(monstar)
source=("monstar::git+$url.git")
b2sums=(SKIP)

pkgver() {
    printf 'r%s.%s' \
        "$(git -C monstar rev-list --count HEAD)" \
        "$(git -C monstar rev-parse --short=7 HEAD)"
}

prepare() {
    cd monstar
    zig build --fetch
}

build() {
    cd monstar
    rm -rf "$srcdir/monstar-build"

    DESTDIR="$srcdir/monstar-build" zig build \
        --prefix /usr \
        --build-id=sha1 \
        -Doptimize=ReleaseFast \
        -Dcpu=baseline
}

package() {
    cp -a "$srcdir/monstar-build/." "$pkgdir/"
    install -Dm644 "$srcdir/monstar/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
