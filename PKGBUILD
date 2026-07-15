# Maintainer: Tim Culverhouse <tim at timculverhouse dot com>

pkgname=monstar
pkgver=0.1.0
pkgrel=1
pkgdesc='Linux-native Wayland terminal built on Ghostty terminal core'
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
    'wayland-protocols>=1.49'
    'zig>=0.16.0'
)
optdepends=(
    'systemd: launch additional terminal windows'
    'xdg-desktop-portal: open links and files through a desktop portal'
    'xdg-utils: open links when a desktop portal is unavailable'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ac1ce9c85e9a1bdf960d1dce36ef3a70dbb547645f84e785e26fb9db0f90f89f3864d355c4ec9752e2f38085b991b9d2e66f43368d75050f96626dd30eada4c4')

prepare() {
    cd "$pkgname-$pkgver"
    zig build --fetch
}

build() {
    cd "$pkgname-$pkgver"
    rm -rf "$srcdir/monstar-build"

    DESTDIR="$srcdir/monstar-build" zig build \
        --prefix /usr \
        --build-id=sha1 \
        -Doptimize=ReleaseFast \
        -Dcpu=baseline
}

package() {
    cp -a "$srcdir/monstar-build/." "$pkgdir/"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
