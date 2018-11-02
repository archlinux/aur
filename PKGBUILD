# Maintainer: Ainola

pkgname=wlroots
pkgver=0.1
pkgrel=1
license=('custom:MIT')
pkgdesc='Modular Wayland compositor library'
url='https://github.com/swaywm/wlroots'
arch=('x86_64')
depends=('opengl-driver' 'xcb-util-errors'
         'xcb-util-image' 'xcb-util-wm' 'pixman' 'libinput' 'libxkbcommon')
makedepends=('meson' 'ninja' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://github.com/swaywm/wlroots/archive/$pkgver.tar.gz")
sha256sums=('cff055bc141eefea6fb1aa410d166890f1e6666d3fd321d70403a543494a6a84')

build() {
    arch-meson "$pkgname-$pkgver" build \
        -Dlibcap=enabled \
        -Dlogind=enabled \
        -Dlogind-provider=systemd \
        -Dxcb-errors=enabled \
        -Dxcb-icccm=enabled \
        -Dxcb-xkb=enabled \
        -Dxwayland=enabled \
        -Dx11-backend=enabled \
        -Dexamples=true
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 "$pkgname-$pkgver"/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
