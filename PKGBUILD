# Maintainer: taxin-404 <taxin404@duck.com>

pkgname=flea-git
pkgver=0.3.1.r0.g6433131
pkgrel=2
pkgdesc='Fast, keyboard-first file manager for Omarchy (git version)'
arch=('x86_64' 'aarch64')
url="https://github.com/thisisgm/flea"
license=('MIT')
# gvfs-mtp, gvfs-gphoto2 and gvfs-afc are the three phone backends the rail reads, and usbmuxd is
# what AFC talks to. Stock Omarchy installs gvfs-mtp, gvfs-nfs and gvfs-smb only, so on a clean box
# an Android phone lists and nothing else does. Measured on an iPhone (iOS 26.6.2): its PTP leg mounts
# and answers zero folders, and AFC is the one that lists DCIM, so the iPhone needs both.
depends=('bubblewrap' 'expect' 'gcc-libs' 'glib2' 'glibc' 'gvfs' 'gvfs-afc' 'gvfs-dnssd' 'gvfs-gphoto2' 'gvfs-mtp' 'gvfs-nfs' 'gvfs-smb' 'hicolor-icon-theme' 'kimageformats' 'libheif' 'omarchy' 'python' 'python-gobject' 'qt6-multimedia' 'qt6-webengine' 'quickshell' 'shared-mime-info' 'usbmuxd' 'util-linux' 'wl-clipboard' 'xdg-terminal-exec' 'xdg-utils')
makedepends=('cargo' 'git')
provides=('flea')
conflicts=('flea')
options=('!debug')
source=("$pkgname::git+https://github.com/thisisgm/flea.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --locked
}

check() {
  cd "$pkgname"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo test --release --locked
  ./tests/js.sh
  ./tests/keymap-gen.sh
}

package() {
  cd "$pkgname"
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
  # The Shelf bar plugin ships as data too, and Flea's own Enable shelf switch copies it from here
  # into the user's plugin directory. The folder is flat, which is what src/shelfplugin.rs installs.
  install -Dm644 shelf/manifest.json shelf/README.md shelf/*.qml shelf/*.js -t "$pkgdir/usr/share/flea/shelf"
  ln -s /usr/share/omarchy/shell/Commons "$pkgdir/usr/share/flea/ui/Commons"
  ln -s /usr/share/omarchy/shell/Ui "$pkgdir/usr/share/flea/ui/Ui"
}
