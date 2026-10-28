# Maintainer: Daan Hessen <daanhessen@notbadcompany.com>
pkgname=vector-fm
pkgver=0.1.1
pkgrel=1
pkgdesc='Fast GTK4 file manager with nvim-style keys, a terminal panel and Lua config'
arch=('x86_64' 'aarch64')
url='https://github.com/Not-Bad-Company/vector'
license=('MIT')
depends=('gtk4' 'gtksourceview5' 'vte4' 'glib2' 'pango' 'graphene' 'gdk-pixbuf2' 'glibc' 'libgcc' 'hicolor-icon-theme')
makedepends=('cargo')
optdepends=(
  'ttf-jetbrains-mono-nerd: the intended font and icons'
  'ffmpeg: video thumbnails, audio waveforms and media details'
  'poppler: pdf previews and details'
  'mpv: audio playback in the preview'
  'xdg-terminal-exec: open the terminal of your choice'
  'xdg-desktop-portal: use vector as the open/save dialog of other apps'
)
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('607f60ef4a28ad36d3cb07badae7828c2fa167fd6d668dbd8e45c7d3264ee9ea')

prepare() {
  cd "vector-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "vector-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release -p vector-fm
}

check() {
  cd "vector-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  VECTOR_NO_CLIPBOARD=1 cargo test --frozen -p vector-core
}

package() {
  cd "vector-$pkgver"
  local id=io.github.not_bad_company.Vector
  install -Dm755 target/release/vector-fm "$pkgdir/usr/bin/vector-fm"
  install -Dm644 "data/$id.desktop" "$pkgdir/usr/share/applications/$id.desktop"
  install -Dm644 "data/$id.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$id.svg"
  install -Dm644 data/vector.portal "$pkgdir/usr/share/xdg-desktop-portal/portals/vector.portal"
  sed 's|@BIN@|/usr/bin/vector-fm|' data/org.freedesktop.impl.portal.desktop.vector.service.in \
    > org.freedesktop.impl.portal.desktop.vector.service
  install -Dm644 org.freedesktop.impl.portal.desktop.vector.service \
    -t "$pkgdir/usr/share/dbus-1/services"
  # org.freedesktop.FileManager1 is left out on purpose: it would take "show in folder" away
  # from whatever file manager is installed; the README explains how to opt in.
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md data/org.freedesktop.FileManager1.service.in \
    -t "$pkgdir/usr/share/doc/$pkgname"
}
