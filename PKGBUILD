# Maintainer: afontenot <adam.m.fontenot@gmail.com>
# Contributor: euler23 <jordanpaldino@gmail.com>

pkgname=libipuz
pkgver=0.4.6.3
pkgrel=1
pkgdesc='Library for parsing .ipuz puzzle files'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/libipuz'
license=(LGPL-2.1-or-later OR MIT)
depends=(json-glib)
makedepends=(glib2-devel meson rust)
source=("${url}/-/archive/${pkgver}/libipuz-${pkgver}.tar.gz"
        "fix-rust-buildtype.diff")
sha256sums=("bdb3f246ca009849f4a3ab3247306e63ad4c814525bd69c22273bedce137693a"
            "b03dcce4c97c80931281686192297db305433e2069b899bb4da14ccf198d3656")

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -p1 < "${srcdir}/fix-rust-buildtype.diff"
}

build() {
    arch-meson "${pkgname}-${pkgver}" build --buildtype=release
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
