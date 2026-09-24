# Maintainer: Nils Pukropp <contact@narl.io>

pkgname=proton-drive-for-linux-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="Unofficial Proton Drive client: FUSE files-on-demand mount, CLI, GTK4 app, tray (binaries)"
arch=('x86_64')
url="https://github.com/narrrl/proton-drive-linux"
license=('MIT')
depends=('fuse3' 'gtk4' 'libadwaita' 'webkitgtk-6.0' 'dbus' 'gcc-libs' 'glibc'
         'hicolor-icon-theme')
optdepends=('perl-image-exiftool: thumbnails for camera RAW files'
            'ffmpeg: video thumbnails'
            'gnome-keyring: credential storage over the Secret Service API'
            'kwallet: credential storage over the Secret Service API'
            'xdg-utils: "Open folder" action in the tray menu'
            'fzf: search-as-you-type launcher (pdfs-prompt --fzf)'
            'foot: terminal that hosts pdfs-prompt --fzf when started from a keybinding')
provides=("${pkgname%-bin}=$pkgver" "proton-drive-linux=$pkgver" 'pdfs')
conflicts=('proton-drive-linux' 'proton-drive-for-linux' 'proton-drive-for-linux-git')
# Upstream ships the binaries already built on Ubuntu 24.04; do not rewrite them.
options=('!strip' '!debug')
_tag="v$pkgver"
_raw="https://raw.githubusercontent.com/narrrl/proton-drive-linux/$_tag"
# The release tarball holds the four binaries only, so the desktop integration
# files come straight from the tagged tree.
source=("proton-drive-linux-$pkgver-x86_64.tar.gz::$url/releases/download/$_tag/proton-drive-linux-$pkgver-x86_64.tar.gz"
        "io.narl.proton-drive-linux.desktop::$_raw/packaging/io.narl.proton-drive-linux.desktop"
        "io.narl.proton-drive-linux-tray.desktop::$_raw/packaging/io.narl.proton-drive-linux-tray.desktop"
        "io.narl.proton-drive-linux.svg::$_raw/packaging/io.narl.proton-drive-linux.svg"
        "proton-drive.service::$_raw/packaging/proton-drive.service"
        "LICENSE-$pkgver::$_raw/LICENSE")
sha256sums=('69f0d6996feb95b18d81bb96e9373c61fddb64ab17b50c94cd83ef8d5e0a1425'
            'd190d6771fff0b975271fb62fd3fb0fa8bbf17d7278c10853c18557855b0c123'
            '1d95e250370220e3bb6aead6ce34d1d6cc759f42c4803b75f1667e78ff47c6c0'
            'e598a93c2715c3a9fdc7fb937902083d4a1135e8fbdfe6fe7e37f0383ebbd828'
            '25fa3bd9ba52df534be9d8bc66f77d7502fe1423177237d0d14b673dedeb1b60'
            '02c419e7f9af08dda720e4f852f3e57cf5a69e192605440f750e9d244fa2817c')

package() {
  install -Dm755 "$srcdir/pdfs"        "$pkgdir/usr/bin/pdfs"
  install -Dm755 "$srcdir/pdfs-tray"   "$pkgdir/usr/bin/pdfs-tray"
  install -Dm755 "$srcdir/pdfs-app"    "$pkgdir/usr/bin/pdfs-app"
  install -Dm755 "$srcdir/pdfs-prompt" "$pkgdir/usr/bin/pdfs-prompt"

  install -Dm644 "$srcdir/io.narl.proton-drive-linux.desktop" \
    "$pkgdir/usr/share/applications/io.narl.proton-drive-linux.desktop"
  install -Dm644 "$srcdir/io.narl.proton-drive-linux-tray.desktop" \
    "$pkgdir/etc/xdg/autostart/io.narl.proton-drive-linux-tray.desktop"
  install -Dm644 "$srcdir/io.narl.proton-drive-linux.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.narl.proton-drive-linux.svg"

  # systemd user unit for the auto-mount daemon; enabled per user, not by pacman.
  install -Dm644 "$srcdir/proton-drive.service" \
    "$pkgdir/usr/lib/systemd/user/proton-drive.service"

  # Translations ship precompiled in the release tarball.
  install -dm755 "$pkgdir/usr/share"
  cp -r --no-preserve=ownership "$srcdir/locale" "$pkgdir/usr/share/locale"

  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
