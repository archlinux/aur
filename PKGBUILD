# Maintainer: Nils Pukropp <contact@narl.io>

pkgname=proton-drive-for-linux
pkgver=2.0.0
pkgrel=1
pkgdesc="Unofficial Proton Drive client: files-on-demand FUSE mount, CLI, GTK4 app and tray"
arch=('x86_64')
url="https://github.com/narrrl/proton-drive-linux"
license=('MIT')
depends=('fuse3' 'gtk4' 'libadwaita' 'webkitgtk-6.0' 'dbus' 'gcc-libs' 'glibc'
         'hicolor-icon-theme')
makedepends=('cargo')
optdepends=('perl-image-exiftool: thumbnails for camera RAW files'
            'gnome-keyring: credential storage over the Secret Service API'
            'kwallet: credential storage over the Secret Service API'
            'xdg-utils: "Open folder" action in the tray menu'
            'fzf: search-as-you-type launcher (pdfs-prompt --fzf)'
            'foot: terminal that hosts pdfs-prompt --fzf when started from a keybinding')
provides=("proton-drive-linux=$pkgver" 'pdfs')
conflicts=('proton-drive-linux' 'proton-drive-for-linux-bin' 'proton-drive-for-linux-git')
# LTO has broken GTK/Rust links for this workspace; the release profile keeps it off.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4476aafe405cb91d81cec8cffcef345696f3169ac3fbde0121233913c8777eea')

_srcname="proton-drive-linux-$pkgver"

prepare() {
  cd "$_srcname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release \
    --bin pdfs \
    --bin pdfs-tray \
    --bin pdfs-app \
    --bin pdfs-prompt
}

check() {
  cd "$_srcname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd "$_srcname"

  install -Dm755 target/release/pdfs        "$pkgdir/usr/bin/pdfs"
  install -Dm755 target/release/pdfs-tray   "$pkgdir/usr/bin/pdfs-tray"
  install -Dm755 target/release/pdfs-app    "$pkgdir/usr/bin/pdfs-app"
  install -Dm755 target/release/pdfs-prompt "$pkgdir/usr/bin/pdfs-prompt"

  install -Dm644 packaging/io.narl.proton-drive-linux.desktop \
    "$pkgdir/usr/share/applications/io.narl.proton-drive-linux.desktop"
  install -Dm644 packaging/io.narl.proton-drive-linux-tray.desktop \
    "$pkgdir/etc/xdg/autostart/io.narl.proton-drive-linux-tray.desktop"
  install -Dm644 packaging/io.narl.proton-drive-linux.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.narl.proton-drive-linux.svg"

  # systemd user unit for the auto-mount daemon; enabled per user, not by pacman.
  install -Dm644 packaging/proton-drive.service \
    "$pkgdir/usr/lib/systemd/user/proton-drive.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
