# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=rill-torrent
_name=rill
pkgver=0.3.1
pkgrel=1
pkgdesc='A small BitTorrent client'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/rill'
license=('GPL-3.0-or-later' 'Apache-2.0')
depends=('gtk4>=1:4.20' 'libadwaita>=1:1.8' 'glib2' 'cairo' 'hicolor-icon-theme' 'libgcc' 'glibc')
makedepends=('cargo' 'blueprint-compiler' 'just' 'gettext')
conflicts=('rill' 'rill-git' 'rill-bin')
# SQLite is compiled in; the Rust linker cannot read the objects makepkg's LTO makes of it.
options=('!lto')
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('81c589720fe00b3139aca3d442d5666c82948c825e56c63b3c9c52ed1e9156b7')

prepare() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RILL_LOCALEDIR=/usr/share/locale
  cargo build --frozen --release
}

check() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$_name-$pkgver"
  DESTDIR="$pkgdir" just prefix=/usr install
  # The install recipe refreshes the caches even when staged; pacman's hooks own them.
  rm -f "$pkgdir/usr/share/applications/mimeinfo.cache" \
    "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
}
