# Maintainer: Térence Clastres <t dot clastres at gmail dot com>
# Maintainer: redtide <redtid3 at gmail dot com>
# Maintainer: jgmdev <jgmdev at gmail dot com>

pkgname=lite-xl
pkgver=2.0.3
pkgrel=1
pkgdesc='A lightweight text editor written in Lua'
arch=('x86_64' 'aarch64')
url="https://lite-xl.github.io"
license=('MIT')
depends=('sdl2' 'freetype2' 'agg' 'reproc' 'luajit')
makedepends=('meson')
conflicts=("lite")
provides=("lite")
# Comment to build non-jit version
_commit=bc7f25a2901d3be72af4c66e52b7b30e443e5e5d
if [ "$_commit" = "" ]; then
    source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
    md5sums=('ff18ad08a5c12df37a212b44e4e3ccc8')
else
    source=("$pkgname-$_commit.tar.gz::https://github.com/lite-xl/lite-xl/archive/${_commit}.zip")
    md5sums=('57b67097e8f3593a3626e74a7090a132')
fi

build() {
    if [ "$_commit" = "" ]; then
        cd "$pkgname-$pkgver"
    else
        cd "$pkgname-$_commit"
    fi
    arch-meson build --wrap-mode=default
    meson compile -C build
}

package() {
    if [ "$_commit" = "" ]; then
        cd "$pkgname-$pkgver"
    else
        cd "$pkgname-$_commit"
    fi
    DESTDIR="$pkgdir" meson install --skip-subprojects -C build
    install -Dm 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
