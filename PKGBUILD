# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=mimebind
pkgver=0.2.0
pkgrel=1
pkgdesc='Choose which application opens which file type'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/mimebind'
license=('GPL-3.0-or-later')
depends=('gtk4>=1:4.12' 'libadwaita>=1:1.5' 'glib2' 'shared-mime-info' 'hicolor-icon-theme'
         'libgcc' 'glibc')
makedepends=('cargo' 'blueprint-compiler' 'just' 'gettext')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('08040147b034b1b941acf0c9cf4eabff46bd9356fb380a35d9a4705a8d738401')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export MIMEBIND_LOCALEDIR=/usr/share/locale
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # association_round_trips needs an installed application that declares a MIME type,
  # which a clean build root does not have.
  cargo test --frozen -- --skip catalog::tests::association_round_trips
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" just prefix=/usr install
  # The install recipe refreshes the caches even when staged; pacman's hooks own them.
  rm -f "$pkgdir/usr/share/applications/mimeinfo.cache" \
    "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
}
