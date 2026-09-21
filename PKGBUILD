# Maintainer: Nils Pukropp <contact@narl.io>

pkgname=proton-drive-for-linux-git
pkgver=1.11.1.r0.g860d29c
pkgrel=1
pkgdesc="Unofficial Proton Drive client: FUSE files-on-demand mount, CLI, GTK4 app, tray (git)"
arch=('x86_64')
url="https://github.com/narrrl/proton-drive-linux"
license=('MIT')
depends=('fuse3' 'gtk4' 'libadwaita' 'webkitgtk-6.0' 'dbus' 'gcc-libs' 'glibc'
         'hicolor-icon-theme')
makedepends=('cargo' 'git')
optdepends=('perl-image-exiftool: thumbnails for camera RAW files'
            'gnome-keyring: credential storage over the Secret Service API'
            'kwallet: credential storage over the Secret Service API'
            'xdg-utils: "Open folder" action in the tray menu'
            'fzf: search-as-you-type launcher (pdfs-prompt --fzf)'
            'foot: terminal that hosts pdfs-prompt --fzf when started from a keybinding')
provides=("${pkgname%-git}=$pkgver" "proton-drive-linux=$pkgver" 'pdfs')
conflicts=('proton-drive-linux' 'proton-drive-for-linux' 'proton-drive-for-linux-bin')
# LTO has broken GTK/Rust links for this workspace; the release profile keeps it off.
options=('!lto')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 --tags 2>/dev/null |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf '0.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release \
    --bin pdfs \
    --bin pdfs-tray \
    --bin pdfs-app \
    --bin pdfs-prompt
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname"

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
