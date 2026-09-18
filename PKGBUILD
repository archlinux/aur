# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=blink-markdown
_name=blink
pkgver=0.7.0
pkgrel=1
pkgdesc='A Markdown editor with a live preview, for GNOME'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/blink'
# The KaTeX fonts math is typeset with are built into the binary.
license=('GPL-3.0-or-later' 'OFL-1.1')
depends=('gtk4>=1:4.20' 'libadwaita>=1:1.8' 'gtksourceview5' 'glib2' 'cairo' 'pango'
         'gdk-pixbuf2' 'graphene' 'hicolor-icon-theme' 'libgcc' 'glibc')
makedepends=('cargo' 'blueprint-compiler' 'just' 'gettext')
conflicts=('blink')
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('fa074964cc3aa8ce4bb797f30cf37ac889a327e1f92cdb6195e1cd111c79044d')

prepare() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export BLINK_LOCALEDIR=/usr/share/locale
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
  rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled" \
    "$pkgdir/usr/share/applications/mimeinfo.cache" \
    "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
}
