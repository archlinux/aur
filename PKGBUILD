# Maintainer: Vladimir Stoiakin <VStoiakin at lavabit dot com>

pkgname=buffybox
pkgver=3.3.0
pkgrel=3
pkgdesc="A suite of graphical applications for the terminal"
url="https://gitlab.postmarketos.org/postmarketOS/buffybox/"
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
provides=(buffyboard unl0kr)
depends=(libinih libinput systemd-libs libxkbcommon libdrm)
makedepends=(meson scdoc)

_lvgl_commit=7f07a129e8d77f4984fff8e623fd5be18ff42e74
source=(
    "https://gitlab.postmarketos.org/postmarketOS/buffybox/-/archive/$pkgver/buffybox-$pkgver.tar.bz2"
    "https://github.com/lvgl/lvgl/archive/$_lvgl_commit.tar.gz"
    "sd-unl0kr"
)
b2sums=('f7b1a26c456699454bd7dd1b36610ebeaf3fb3c6625026b365aed95ea1d90e9e2c354fbb6c432e7c5465e2e338cc68999aad4ff5a5c501ec7f8544fb1fffc14a'
        '8d8d8d8483c12dec7762c1ea5a805005b3ce0b16e367d901476793d388cc18d834860f4f6454b8f23ed661b39b497ac0c6cface92752fc254334bc64c994448f'
        'SKIP')

prepare() {
    rm -rf "buffybox-$pkgver/lvgl"
    mv -f "lvgl-$_lvgl_commit" "buffybox-$pkgver/lvgl"
}

build() {
    arch-meson "buffybox-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    install -Dm644 "sd-unl0kr" "$pkgdir/usr/lib/initcpio/install/sd-unl0kr"
}
