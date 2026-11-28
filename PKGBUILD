# Maintainer: Nils Pukropp <contact@narl.io>

pkgname=proton-drive-for-linux
pkgver=4.0.0
pkgrel=1
pkgdesc="Unofficial Proton Drive client: files-on-demand FUSE mount, CLI, GTK4 app and tray"
arch=('x86_64')
url="https://proton-drive.narl.io"
_repo="https://github.com/narrrl/proton-drive-linux"
license=('MIT')
depends=('fuse3' 'polkit' 'gtk4' 'libadwaita' 'webkitgtk-6.0' 'dbus' 'gcc-libs' 'glibc'
         'hicolor-icon-theme')
makedepends=('cargo' 'gettext')
optdepends=('perl-image-exiftool: thumbnails for camera RAW files'
            'ffmpeg: video thumbnails'
            'iso-codes: country names in your language under Places'
            'gnome-keyring: credential storage over the Secret Service API'
            'kwallet: credential storage over the Secret Service API'
            'xdg-utils: "Open folder" action in the tray menu'
            'fzf: search-as-you-type launcher (pdfs-prompt --fzf)'
            'foot: terminal that hosts pdfs-prompt --fzf when started from a keybinding')
provides=("proton-drive-linux=$pkgver" 'pdfs')
conflicts=('proton-drive-linux' 'proton-drive-for-linux-bin' 'proton-drive-for-linux-git')
# LTO has broken GTK/Rust links for this workspace; the release profile keeps it off.
options=('!lto')
# Stops the running daemon before removal, so the mount stops mirroring deletes.
install=proton-drive.install
source=("$pkgname-$pkgver.tar.gz::$_repo/archive/refs/tags/v$pkgver.tar.gz"
        "basemap-v1.pmtiles::https://github.com/narrrl/proton-rs/releases/download/basemap-v1/basemap-v1.pmtiles")
sha256sums=('59cfe5dc1172be6fa73cda898cfe70081d74582e8064168dde3758ed765affa4'
            'ce9acab1b7ed7f15b23e2365b1b6a580db79f4bc4421851ee673eff4c920d280')

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
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/status" crates/pdfs-gui/resources/icons/tray/*.svg

  # systemd user unit for the auto-mount daemon; enabled per user, not by pacman.
  install -Dm644 packaging/proton-drive.service \
    "$pkgdir/usr/lib/systemd/user/proton-drive.service"

  install -Dm644 "packaging/io.narl.proton-drive-linux.policy" \
    "$pkgdir/usr/share/polkit-1/actions/io.narl.proton-drive-linux.policy"

  # The offline Places basemap.
  install -Dm644 "$srcdir/basemap-v1.pmtiles" \
    "$pkgdir/usr/share/proton-drive-linux/basemap-v1.pmtiles"

  # Translations: compiled from po/ into /usr/share/locale.
  po/build.sh "$pkgdir/usr/share/locale"

  # Shell completion for bash, zsh and fish.
  packaging/completions.sh target/release/pdfs "$pkgdir/usr/share"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # pacman brings new releases, so the app never checks for them itself.
  install -Dm644 /dev/null "$pkgdir/usr/share/proton-drive-linux/managed-updates"
}
