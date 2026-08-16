# Maintainer: Orion <128988082+Orion-zhen@users.noreply.github.com>

pkgname=onechat-git
pkgver=r118.670a90b
pkgrel=1
pkgdesc='Your last one chatbox app. (git)'
arch=('x86_64')
options=('!debug' '!lto')
url='https://github.com/Orion-zhen/OneChat'
license=('AGPL-3.0-only')
depends=(
  'alsa-lib'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk4'
  'hicolor-icon-theme'
  'libgcc'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-driver'
  'vulkan-icd-loader'
  'wayland'
  'webkitgtk-6.0'
)
makedepends=('cargo' 'git')
provides=('onechat')
conflicts=('onechat')
source=(
  'onechat::git+https://github.com/Orion-zhen/OneChat.git'
  'onechat.desktop'
)
sha256sums=(
  'SKIP'
  'd1fb19cdb48496baa8971542eae7d1b83acd19a8455d75a5650fa56eff5f26dd'
)

pkgver() {
  cd onechat
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd onechat
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd onechat
  cargo build --release --frozen
}

package() {
  cd onechat

  install -Dm755 target/release/onechat "$pkgdir/usr/bin/onechat"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/onechat.desktop" \
    "$pkgdir/usr/share/applications/onechat.desktop"

  local icon size
  for icon in assets/icons/linux/hicolor/*/apps/onechat.png; do
    size=${icon#assets/icons/linux/hicolor/}
    size=${size%%/*}
    install -Dm644 "$icon" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/onechat.png"
  done
}
