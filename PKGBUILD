# Maintainer: aksh1618 <aakarshituppal at gmail dot com>
pkgname=kwtype-git
pkgver=0.1.0.r2.gac2c386
pkgrel=1
pkgdesc='Virtual keyboard input tool for KDE Plasma Wayland (kde-fake-input protocol)'
arch=('x86_64')
url='https://github.com/Sporif/KWtype'
license=('MIT')
depends=('qt6-base' 'kwayland' 'libxkbcommon' 'wayland')
makedepends=('git' 'meson' 'ninja' 'pkgconf')
provides=('kwtype')
conflicts=('kwtype')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g' \
        || printf '0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    arch-meson "$pkgname" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
