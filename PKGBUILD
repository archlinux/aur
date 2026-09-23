# Maintainer: taxin-404 <taxin404@duck.com>
# Contributor: GM <gianmarcomorales@icloud.com>

# The root PKGBUILD of github.com/thisisgm/flea, built from the release's source tarball; its closure's reasons live there.
pkgname=flea
pkgver=0.3.3
pkgrel=1
pkgdesc='Fast, keyboard-first file manager for Omarchy'
arch=('x86_64' 'aarch64')
url='https://github.com/thisisgm/flea'
license=('MIT')
depends=('bubblewrap' 'expect' 'gcc-libs' 'glib2' 'glibc' 'gvfs' 'gvfs-afc' 'gvfs-dnssd' 'gvfs-gphoto2' 'gvfs-mtp' 'gvfs-nfs' 'gvfs-smb' 'hicolor-icon-theme' 'kimageformats' 'libheif' 'omarchy' 'python' 'python-gobject' 'qt6-multimedia' 'qt6-webengine' 'quickshell' 'shared-mime-info' 'usbmuxd' 'util-linux' 'wl-clipboard' 'xdg-terminal-exec' 'xdg-utils')
makedepends=('cargo')
# flea-bin declares its own conflict with this package, and pacman honours a conflict from either side.
conflicts=('flea-git')
optdepends=('libarchive: archive listing and extraction'
            '7zip: 7z archive support'
            'imagemagick: image conversion'
            'tailscale: Taildrop sharing'
            'ffmpeg: media metadata in the preview column'
            'ffmpegthumbnailer: video thumbnails, made by one pre-linked worker through libffmpegthumbnailer.so.4, or by the ffmpegthumbnailer program per video when that library will not load'
            'dropbox-cli: Dropbox share links')
options=('!debug')
# SKIP here keeps a version bump to one line; the release workflow pins it from SHASUMS256.txt before the AUR sees it.
source=("$url/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('98c5e71b8432f049c16bd05294048093fee0c83ab0f121c4816fd053a7148764')

build() {
  export CARGO_TARGET_DIR="$srcdir/target"
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  export CARGO_TARGET_DIR="$srcdir/target"
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --release --locked
  ./tests/js.sh
  ./tests/keymap-gen.sh
}

# The root PKGBUILD's package(), command for command; the release workflow refuses a tag where the two differ.
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$srcdir/target/release/flea" "$pkgdir/usr/bin/flea"
  install -Dm755 tools/flea-gio-auth "$pkgdir/usr/lib/flea/flea-gio-auth"
  install -Dm755 tools/flea-portal "$pkgdir/usr/lib/flea/flea-portal"
  install -Dm644 packaging/flea.portal -t "$pkgdir/usr/share/xdg-desktop-portal/portals"
  install -Dm644 packaging/org.freedesktop.impl.portal.desktop.flea.service -t "$pkgdir/usr/share/dbus-1/services"
  install -Dm755 tools/flea-filemanager1 "$pkgdir/usr/lib/flea/flea-filemanager1"
  install -Dm644 packaging/com.thisisgm.flea.FileManager1.service -t "$pkgdir/usr/share/dbus-1/services"
  install -Dm644 packaging/com.thisisgm.flea.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/com.thisisgm.flea.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  install -Dm644 ui/qmldir ui/*.qml -t "$pkgdir/usr/share/flea/ui"
  install -Dm644 ui/js/*.js -t "$pkgdir/usr/share/flea/ui/js"
  install -Dm644 ui/boot/shell.qml ui/boot/picker.qml -t "$pkgdir/usr/share/flea/ui/boot"
  install -Dm644 shelf/manifest.json shelf/README.md shelf/*.qml shelf/*.js -t "$pkgdir/usr/share/flea/shelf"
  ln -s /usr/share/omarchy/shell/Commons "$pkgdir/usr/share/flea/ui/Commons"
  ln -s /usr/share/omarchy/shell/Ui "$pkgdir/usr/share/flea/ui/Ui"
  ln -s /usr/share/omarchy/shell/Commons "$pkgdir/usr/share/flea/ui/boot/Commons"
  ln -s /usr/share/omarchy/shell/Ui "$pkgdir/usr/share/flea/ui/boot/Ui"
}
