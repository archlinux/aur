# Maintainer: Nils Pukropp <contact@narl.io>

pkgname=proton-drive-for-linux-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Unofficial Proton Drive client: FUSE files-on-demand mount, CLI, GTK4 app, tray (binaries)"
arch=('x86_64')
url="https://github.com/narrrl/proton-drive-linux"
license=('MIT')
depends=('fuse3' 'gtk4' 'libadwaita' 'webkitgtk-6.0' 'dbus' 'gcc-libs' 'glibc'
         'hicolor-icon-theme')
optdepends=('perl-image-exiftool: thumbnails for camera RAW files'
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
sha256sums=('78d3bda3810964383cc0917cf8af276f1dc3776dcd4fe725754f5dafb371dfe6'
            '034083fd2f77b0b69ae638fdaba2bd772209ca325a78ca17d050f221cab9650b'
            '5c369d689926cbbd64803b55a9a6010ad59aded6c7bcfb3e8bd005c95ac10cc8'
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

  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
