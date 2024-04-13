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

pkgname=wlr-which-key
pkgver=0.1.3
pkgrel=1
pkgdesc="Keymap manager for wlroots-based compositors"
arch=(x86_64)
url="https://github.com/MaxVerevkin/$pkgname"
license=(GPL-3.0-only)
depends=(cairo gcc-libs glib2 glibc libxkbcommon pango)
makedepends=(rust)
[[ -n $_sccache ]] && makedepends+=(sccache)
options=(!debug !lto)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('5ff853ae1d8c79877681593bffac7f147d9f0c938b26a26d9743ad36dfa83601607588411e1e2a4f8de01f9845c693f89244a566c8907a8126fef74f997e835f')

prepare() {
    cd $pkgname-$pkgver
    export CARGO_HOME="$srcdir"/$pkgname-$pkgver/.cargo
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
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
    install -Dm644 README.md               -t "$pkgdir"/usr/share/doc/$pkgname/
}
