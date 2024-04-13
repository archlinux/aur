# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

## The following variable can be customized at build time.
## Use env or export to change at your wish
##
##   Example: env _sccache=y makepkg -sc
##
## Default is: None => not use sccache
##
## More info: https://github.com/mozilla/sccache
: ${_sccache:=}

pkgname=onagre
pkgver=1.0.0
pkgrel=1
pkgdesc="General purpose application launcher for X and Wayland inspired by Rofi/Wofi and Alfred"
arch=(x86_64)
url="https://github.com/$pkgname-launcher/$pkgname"
license=(MIT)
depends=(gcc-libs glibc fontconfig freetype2 libxkbcommon pop-launcher)
makedepends=(rust)
[[ -n $_sccache ]] && makedepends+=(sccache)
options=(!debug !lto)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz
        001.patch::$url/commit/33655e33586818946377515945abb415ab105de5.patch # feat: switch to redb for cache performance
        )
b2sums=('6ce9539df1b222ca8e19f9b6463b03c77f982555038c008f9f66abdd00f67cc1ee5536133c4e0b447a032cc6cc7f7d7f12cf4cb40067c4b63116f05264f910b8'
        '63c8724514311254e16b273fb152ea6c641f2d6f142edac910d33e681e93506d0b71fdf6702d816e13f5e20769b75a5883434a2cd141eb2abb38b4a122c2aecd')

prepare() {
    cd $pkgname-$pkgver
    patch -Np1 < ../001.patch
    export CARGO_HOME="$srcdir"/$pkgname-$pkgver/.cargo
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    [[ -n $_sccache ]] && export RUSTC_WRAPPER=sccache
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
    export CARGO_HOME="$srcdir"/$pkgname-$pkgver/.cargo
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/$pkgname -t "$pkgdir"/usr/bin/
    install -Dm644 LICENSE                 -t "$pkgdir"/usr/share/licenses/$pkgname/
}
