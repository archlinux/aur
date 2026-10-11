# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Justine Smithies <justine at smithies dot me dot uk>
# Contributor: Daniel Eklöf <daniel at ekloef dot se>

pkgname=fuzzel-git
_pkgname=fuzzel
pkgver=1.15.0.r9.g815d438
pkgrel=2
pkgdesc='Application launcher for wlroots based Wayland compositors.'
arch=(x86_64)
url='https://codeberg.org/dnkl/fuzzel'
license=(MIT)
provides=(fuzzel)
conflicts=(fuzzel)
depends=(pixman wayland libxkbcommon libpng fcft resvg)
makedepends=(git meson ninja wayland-protocols scdoc tllist)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/-/.r/;s/-/./'
}

build() {
    cd "$srcdir/$_pkgname"
    arch-meson . build \
        -Denable-cairo=disabled \
        -Dpng-backend=libpng \
        -Dsvg-backend=resvg
    meson compile -C build
}

package() {
    cd "$srcdir/$_pkgname"
    meson install -C build --destdir "$pkgdir"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
