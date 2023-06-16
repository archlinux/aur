# Maintainer: Titouan (Stalone) S. <stalone@boxph.one>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Mark (yochananmarqos) Wagie <mark.wagie@proton.me>

pkgname=authenticator
_pkgname=Authenticator
pkgver=4.3.1
pkgrel=1
pkgdesc="2FA code generator for GNOME"
arch=('any')
url="https://gitlab.gnome.org/World/Authenticator"
license=('GPL3')
depends=('gst-plugins-bad' 'libadwaita' 'libsecret' 'pipewire' 'zbar')
makedepends=('cargo' 'clang' 'git' 'meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=('fe16666d499ec543032401e4e69e29b442c5aaba882dd067b304585f43b78df2')
options=('!lto')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  # https://gitlab.gnome.org/World/Authenticator/-/issues/362
  export BINDGEN_EXTRA_CLANG_ARGS="$BINDGEN_EXTRA_CLANG_ARGS -DPW_ENABLE_DEPRECATED"

  export RUSTUP_TOOLCHAIN=stable
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
