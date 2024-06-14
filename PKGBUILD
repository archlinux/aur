# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=flatpak-ext
pkgver=0.1.3
pkgrel=1
pkgdesc="Tool for run flatpaks without installing them"
arch=(x86_64)
url="https://github.com/ryanabx/$pkgname"
license=(MIT)
depends=(
  flatpak
  gcc-libs
  glib2
  glibc
  hicolor-icon-theme
)
makedepends=(
  clang
  rust
)
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('030f1514b13d9a26e7cc7b40698f13040815b94ee6f996c31f1bc869bd3cd9f8b0f05b1be6e84b7dffd1b3603915f86c9f91f6db2e6cfc5c57b71f3b1e52d58d')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir"/.cargo
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir"/.cargo
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd $pkgname-$pkgver
  install -vDm755 target/release/flatrun         -t "$pkgdir"/usr/bin/
  install -vDm755 target/release/flatrun-agent   -t "$pkgdir"/usr/lib/
  install -vDm644 data/flatrun{,-bundle}.desktop -t "$pkgdir"/usr/share/applications/
  install -vDm644 data/flatrun.metainfo.xml      -t "$pkgdir"/usr/share/metainfo/
  install -vDm644 data/flatrun.png               -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps/
  install -vDm644 LICENSE                        -t "$pkgdir"/usr/share/licenses/$pkgname/
}
