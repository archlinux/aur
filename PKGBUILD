# Maintainer: Justine Smithies <justine at smithies dot me dot uk>
# Maintainer: Daniel Eklöf <daniel at ekloef dot se>

pkgname=fuzzel-git
_pkgname=fuzzel
pkgver=1.8.2.r12.gf1ab7eb
pkgrel=1
pkgdesc='Application launcher for wlroots based Wayland compositors.'
arch=('x86_64')
url='https://codeberg.org/dnkl/fuzzel'
license=('MIT')
provides=('fuzzel')
conflicts=('fuzzel')
depends=('git' 'pixman' 'wayland' 'libxkbcommon' 'cairo' 'libpng' 'librsvg' 'fcft')
makedepends=('meson' 'ninja' 'wayland-protocols' 'scdoc' 'tllist')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/-/.r/;s/-/./'
}

build() {
    cd "$srcdir/$_pkgname"
    arch-meson . build \
        -Denable-cairo=enabled \
        -Dpng-backend=libpng \
        -Dsvg-backend=librsvg
    meson compile -C build
}

package() {
    cd "$srcdir/$_pkgname"
    meson install -C build --destdir "$pkgdir"
    rm -f "$pkgdir/usr/share/doc/$_pkgname/LICENSE"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
