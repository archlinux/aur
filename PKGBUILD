# Maintainer: unstable-code <assa0620@gmail.com>
pkgname=wshowlyrics-git
pkgver=r48.d93da46
pkgrel=1
pkgdesc="Wayland-based synchronized lyrics overlay with MPRIS integration"
arch=('x86_64' 'aarch64')
url="https://github.com/unstable-code/lyrics"
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'curl'
    'fontconfig'
    'pango'
    'wayland'
    'playerctl'
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

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 README.ko.md "$pkgdir/usr/share/doc/$pkgname/README.ko.md"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
