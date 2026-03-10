# Maintainer: Vladimir Stoiakin <VStoiakin at lavabit dot com>

pkgbase=buffybox
pkgname=(buffyboard unl0kr)
pkgver=3.5.1
pkgrel=1
pkgdesc="A suite of graphical applications for the terminal"
url="https://gitlab.postmarketos.org/postmarketOS/buffybox/"
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
depends=(libinih libinput systemd-libs libxkbcommon libdrm)
makedepends=(meson scdoc)

_lvgl_commit=85aa60d18b3d5e5588d7b247abf90198f07c8a63
source=(
    "https://gitlab.postmarketos.org/postmarketOS/buffybox/-/archive/$pkgver/buffybox-$pkgver.tar.bz2"
    "https://github.com/lvgl/lvgl/archive/$_lvgl_commit.tar.gz"
    "sd-unl0kr"
    "unl0kr-install"
    "unl0kr-hooks"
)
b2sums=('c697780785c6ad63a9820eb72219bf90febe6dddd8b171a52fcf82e8fef9da6e130ac4f0f66a2c7123d71cd56bc079ee09c0471a64c6ea27fd0ee6f38d170124'
        '8aa93853b58f4ab589dde891136b2de4353353f663808b111ab8672fb5a4e55686ea90ff90ea041dae6f6198dc97ba6a1d72204080bb608787a818459bb1b46c'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
    rm -rf "buffybox-$pkgver/lvgl"
    mv -f "lvgl-$_lvgl_commit" "buffybox-$pkgver/lvgl"
}

build() {
    arch-meson "buffybox-$pkgver" build -Dsystemd=true
    meson compile -C build
}

package_buffyboard() {
    depends=(libinih libinput systemd-libs)

    meson install -C build --tags=buffyboard --destdir "$pkgdir"
}

package_unl0kr() {
    meson install -C build --tags=unl0kr --destdir "$pkgdir"

    install -Dm644 "sd-unl0kr" "$pkgdir/usr/lib/initcpio/install/sd-unl0kr"

    install -Dm644 "unl0kr-install" "$pkgdir/usr/lib/initcpio/install/unl0kr"
    install -Dm644 "unl0kr-hooks" "$pkgdir/usr/lib/initcpio/hooks/unl0kr"
}
