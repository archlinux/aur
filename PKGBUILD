# Maintainer: Térence Clastres <t dot clastres at gmail dot com>
# Maintainer: jgmdev <jgmdev at gmail dot com>
# Contributor: redtide <redtid3 at gmail dot com>

pkgname=lite-xl
pkgver=2.0.4
pkgrel=1
pkgdesc='A lightweight text editor written in Lua'
arch=('x86_64' 'aarch64')
url="https://lite-xl.github.io"
license=('MIT')
depends=('sdl2' 'freetype2' 'reproc' 'luajit')
makedepends=('meson')
conflicts=("lite")
provides=("lite")
# Comment to build non-jit version
_commit=afaed9efefb8652c42e4eee6eed45ffc64e0341c
if [ "$_commit" = "" ]; then
    source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
    md5sums=('10feea8f7c86dc1c29038eabcc429f53')
else
    source=("$pkgname-$_commit.tar.gz::https://github.com/lite-xl/lite-xl/archive/${_commit}.zip")
    md5sums=('25beaf9fd70c148ae5fdf263635721bc')
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
