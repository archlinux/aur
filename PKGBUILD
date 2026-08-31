# Maintainer: Groctel <git@taxorubio.com>
# Contributor: TryA <tryagainprod@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_name="libproxy"

pkgbase="lib32-$_name"
pkgname="lib32-$_name"
pkgver=0.5.12
pkgrel=1
pkgdesc="Automatic proxy configuration management library (32-bit)"
url="https://libproxy.github.io/libproxy/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
    "lib32-curl"
    "lib32-duktape"
    "lib32-gcc-libs"
    "lib32-glib2"
    "lib32-glibc"
    "$_name"
)
makedepends=(
    "git"
    "gsettings-desktop-schemas"
    "meson"
)
source=("https://github.com/libproxy/libproxy/archive/refs/tags/$pkgver.tar.gz")
b2sums=('e7728c1f975ccb84e5037e667a341921712db452626fd41affbdb6a180ec1beff600070e7a798d27a4a9f4a555cd04fff8256301df081604b9627efb09a2a259')

build() {
    cd "$srcdir"

    local meson_options=(
        --cross-file lib32
        -D docs=false
        -D introspection=false
        -D release=true
        -D vapi=false
    )

    arch-meson "$_name-$pkgver" build "${meson_options[@]}"
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package_lib32-libproxy() {
    provides=(libproxy.so)
    conflicts=()

    meson install -C build --destdir "$pkgdir"
    rm -r "$pkgdir"/usr/{bin,include,share}
}
