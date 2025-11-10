# Maintainer: Vladimir Stoiakin <VStoiakin at lavabit dot com>

pkgbase=buffybox
pkgname=(buffyboard unl0kr)
pkgver=3.4.2
pkgrel=2
pkgdesc="A suite of graphical applications for the terminal"
url="https://gitlab.postmarketos.org/postmarketOS/buffybox/"
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
depends=(libinih libinput systemd-libs libxkbcommon libdrm)
makedepends=(meson scdoc)

_lvgl_commit=75557e5fe22196ebbba5bfd82386bd23c046a853
source=(
    "https://gitlab.postmarketos.org/postmarketOS/buffybox/-/archive/$pkgver/buffybox-$pkgver.tar.bz2"
    "https://github.com/lvgl/lvgl/archive/$_lvgl_commit.tar.gz"
    "sd-unl0kr"
)
b2sums=('3221e427c7b7c4ac77e738cf765f8147dfc155d1cc409353179f1b915d0b2b6af665d759bee142c0a547fc8f0b4c073b06b3fcb8183e26a36df25a0669d68dfb'
         '79b88cbec3c58d693adfa0e7f62234c0a1fb398da17a14cf135ca54be653ededf037eb42638ad6c7a7d934c0b6545b65fd7c9ae85970ea557f9dce634de6302e'
        'SKIP')

prepare() {
    rm -rf "buffybox-$pkgver/lvgl"
    mv -f "lvgl-$_lvgl_commit" "buffybox-$pkgver/lvgl"
}

build() {
    arch-meson "buffybox-$pkgver" build
    meson compile -C build
}

package_buffyboard() {
    depends=(libinih libinput systemd-libs)

    meson install -C build --tags=buffyboard --destdir "$pkgdir"
}

package_unl0kr() {
    meson install -C build --tags=unl0kr --destdir "$pkgdir"

    install -Dm644 "sd-unl0kr" "$pkgdir/usr/lib/initcpio/install/sd-unl0kr"
}
