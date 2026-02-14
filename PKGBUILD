# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=spaceshot
pkgver=0.5
pkgrel=1
pkgdesc="A batteries-included screenshot tool for wlroots-compatible Wayland compositors"
arch=('x86_64' 'aarch64')
url="https://github.com/Mabi19/spaceshot"
license=('MIT')
depends=(
    'glibc'
    'glib2'
    'gcc-libs'
    'cairo'
    'pango'
    'libxkbcommon'
    'wayland'
    'wlr-protocols'
    'vala'
    'libpng'
    'zlib-ng-compat'
    'freetype2'
    'libx11'
    'libxext'
    'libxrender'
    'libxcb'
    'pixman'
    'fribidi'
    'libthai'
    'harfbuzz'
    'libffi'
    'expat'
    'bzip2'
    'brotli'
    'libxau'
    'libxdmcp'
    'pcre2'
    'util-linux-libs'
    'graphite'
    'libdatrie'
)
makedepends=(
    'meson'
    'python'
    'pkg-config'
)
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('1f32f80059576914789b002d382eceb35530d2b7d6bb855425d7e30255f545dbd24ad292ea507ca9fbb2576b7371d67488a8f91007174a6a6ab2f06e959dc3fe')

build()
{
    cd "$pkgname-$pkgver"

    export CFLAGS="$CFLAGS -fvisibility=hidden"

    rm -rf build
    meson setup build
    meson compile -C build
}

package()
{
    cd "$pkgname-$pkgver"

    DESTDIR="$pkgdir" ninja -C build install

    # Correct directories
    mv "$pkgdir/usr/local/bin" "$pkgdir/usr/bin"
    mv "$pkgdir/usr/local/share" "$pkgdir/usr/share"
    rmdir "$pkgdir/usr/local"

    install -Dm644 -t"$pkgdir/usr/share/doc/$pkgname/" README.md
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
