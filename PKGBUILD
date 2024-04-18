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
pkgver=1.1.0
pkgrel=1
pkgdesc="General purpose application launcher for X and Wayland inspired by Rofi/Wofi and Alfred"
arch=(x86_64)
url="https://github.com/$pkgname-launcher/$pkgname"
license=(MIT)
depends=(gcc-libs glibc fontconfig freetype2 libxkbcommon pop-launcher)
makedepends=(rust)
[[ -n $_sccache ]] && makedepends+=(sccache)
options=(!debug !lto)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('6a55eabc644e89ce3cab58369d8afec23e0a8c6fd497c87cbcb2b0343b2603bfce6ca246b3d892de56f04aa4f290049f8076feffa5181f130c43bb4f24f5914a')

prepare() {
    cd $pkgname-$pkgver
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
