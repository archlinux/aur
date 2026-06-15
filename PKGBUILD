# Maintainer: Tokyob0t <tokyob0t.business[at]proton.me>

_pkgname=gtk4-layer-shell
pkgname="$_pkgname-git"
pkgdesc='Library to create panels and other desktop components for Wayland.'
pkgver=1.3.0.r21.gcbfdd73
pkgrel=1
arch=(x86_64)
license=(MIT)
url="https://github.com/wmww/$_pkgname"
depends=(
    "gtk4"
    "wayland"
)
makedepends=(
    "git"
    "gtk-doc"
    "gobject-introspection"
    "meson"
    "ninja"
    "valabind"
    "python"
    "luajit"
    "wayland-protocols"
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    meson setup \
        --prefix=/usr \
        --wrap-mode=nofallback \
        --buildtype=plain \
        -Dtests=false \
        -Ddocs=true \
        -Dintrospection=true \
        -Dvapi=true \
        -Dexamples=true \
        -Dsmoke-tests=false \
        "$_pkgname" \
        build

    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build

    install -D -m 644 "$_pkgname/LICENSE" \
        "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
