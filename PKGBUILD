# Maintainer: groctel <aur@taxorubio.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=lib32-duktape
pkgver=2.7.0
pkgrel=7
pkgdesc='Embeddable Javascript engine (32-bit)'
url='https://duktape.org/'
arch=(x86_64)
license=(MIT)
depends=(
  duktape
  lib32-glibc
  lib32-gcc-libs
)
provides=(libduktape{,d}.so)

# https://duktape.org/download.html
source=("https://duktape.org/duktape-$pkgver.tar.xz")
md5sums=('b3200b02ab80125b694bae887d7c1ca6')
b2sums=('da5eea88758201177f32c5611a3757433ef1b0173d6430eff1f067abd7535f3e4b9c3717290fbd8475827a53f7a2a74818287a65e563f14e91761f5cd0fe30d5')

prepare() {
    cd duktape-$pkgver

    # tools/configure.py needs Python 2
    sed -i 's/^#undef DUK_USE_FASTINT$/#define DUK_USE_FASTINT/' src/duk_config.h

    # Add missing NEEDED on libm.so
    sed -i 's/duktape\.c/& -lm/' Makefile.sharedlibrary
}

build() {
    cd duktape-$pkgver
    _make
}

package() {
    cd duktape-$pkgver
    _make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/include"
    install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE.txt
}

_make() {
    local make_options=(
        -f Makefile.sharedlibrary
        INSTALL_PREFIX=/usr
        LIBDIR=/lib32
        CC='gcc -m32'
    )

    make "${make_options[@]}" "$@"
}

# getver: github.com/svaarala/duktape
