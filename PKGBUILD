# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Justine Smithies <justine at smithies dot me dot uk>
# Contributor: Daniel Eklöf <daniel at ekloef dot se>

pkgname=fuzzel-git
_pkgname=fuzzel
pkgver=1.14.1.r21.g38e1c6e
pkgrel=1
pkgdesc='Application launcher for wlroots based Wayland compositors.'
arch=(x86_64)
url='https://codeberg.org/dnkl/fuzzel'
license=(MIT)
provides=(fuzzel)
conflicts=(fuzzel)
depends=(pixman wayland libxkbcommon libpng fcft resvg)
makedepends=(git meson ninja wayland-protocols scdoc tllist)
source=("git+$url"
        001-meson-build.patch)
sha256sums=('SKIP'
            '7749577ff177bffa29623609faf9359ed8e31b308b842d49268e2d1071c7ead2')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/-/.r/;s/-/./'
}

prepare() {
    ## use pkgconfig to find resvg and do not auto install license
    patch -p1 -d "$srcdir/$_pkgname" < 001-meson-build.patch
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
