# Maintainer: Vladimir Stoiakin <VStoiakin at lavabit dot com>

pkgname=buffybox
pkgver=3.2.0
pkgrel=1
pkgdesc="A suite of graphical applications for the terminal"
url="https://gitlab.com/postmarketOS/buffybox/"
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
provides=( buffyboard unl0kr )
depends=(libinih libinput systemd-libs libxkbcommon libdrm)
makedepends=(meson scdoc)

_lvgl_commit=ceadda8a468b7d5fa6ba973bd82cf610166278d8
source=(
    https://gitlab.com/postmarketOS/buffybox/-/archive/${pkgver}/buffybox-${pkgver}.tar.bz2
    https://github.com/lvgl/lvgl/archive/${_lvgl_commit}.tar.gz
)
sha256sums=('f2dfc4d34baa1ae5b19a6f2c434cdd4acc7ab5b51785fbe128b8162d5598b22a'
            '03c55df27395cc3b7e352672d71b82df4ad00fe99898740a9db9845c1ea44b57')

prepare() {
    cd "${srcdir}"
    rm -rf "buffybox-${pkgver}/lvgl"
    mv -f "lvgl-${_lvgl_commit}" "buffybox-${pkgver}/lvgl"
}

build() {
    cd "${srcdir}/buffybox-${pkgver}/buffyboard"
    arch-meson build .
    meson compile -C build

    cd "${srcdir}/buffybox-${pkgver}/unl0kr"
    arch-meson build .
    meson compile -C build
}

package() {
    cd "${srcdir}/buffybox-${pkgver}/buffyboard"
    meson install -C build --destdir "${pkgdir}"

    cd "${srcdir}/buffybox-${pkgver}/unl0kr"
    meson install -C build --destdir "${pkgdir}"
}
