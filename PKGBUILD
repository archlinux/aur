# Maintainer: Kevin McNamara (github.com/kjmcnamara1)
pkgname=cecilia
pkgver=0.51.0
pkgrel=1
pkgdesc='Keyboard-first editor and player for guitar tab, standard notation and Gregorian chant'
arch=('x86_64' 'aarch64')
url='https://kjmcnamara1.github.io/cecilia/'
_repo='https://github.com/kjmcnamara1/cecilia'
license=('MIT' 'Apache-2.0')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('cargo')
# makepkg's -flto breaks the C++ in signalsmith-stretch (undefined symbols at link time).
options=('!lto')
# The window (--gui) loads these at run time; the terminal UI needs none of them.
optdepends=('vulkan-icd-loader: GPU drawing in the window'
            'libxkbcommon: keyboard input in the window'
            'wayland: Wayland window'
            'libx11: X11 window'
            'libxcursor: X11 mouse cursors')
source=("$pkgname-$pkgver.tar.gz::$_repo/archive/v$pkgver.tar.gz")
sha256sums=('76924b55839afe3e1ac3572c2763d0ffcccf19566c29144273b0addb5bdcdf96')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --release --frozen -p cecilia
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo test --release --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"
  packaging/linux/stage.sh "$pkgdir" /usr target/release/cecilia
}
