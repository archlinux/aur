# Maintainer: taxin-404 <taxin404@duck.com>

pkgname=flea
pkgver=0.3.0
pkgrel=1
pkgdesc='Fast, keyboard-first file manager for Omarchy'
arch=('x86_64' 'aarch64')
url="https://github.com/thisisgm/flea"
license=('MIT')
# omarchy owns /usr/share/omarchy/shell, which ui/Commons and ui/Ui link into; quickshell owns qs.
# util-linux ships prlimit, which the thumbnail and archive sandboxes require alongside bubblewrap.
# xdg-terminal-exec is what --terminal execs, so the topbar's terminal button needs it installed.
# wl-clipboard ships wl-copy, which ui/Opener.qml pipes into for the menu's Copy Path row; nothing
# else in this closure requires it, so on a clean Omarchy box that row failed silently without it.
# python-gobject is what tools/flea-portal answers org.freedesktop.impl.portal.FileChooser with, and
# what tools/flea-filemanager1 answers org.freedesktop.FileManager1 with; it is the same binding
# omarchy-file-select, the client that portal serves, is already written against.
# qt6-webengine ships QtQuick.Pdf and qt6-multimedia ships QtMultimedia, which ui/PreviewPdf.qml and
# ui/PreviewMedia.qml import: neither is in the omarchy plus quickshell closure, so a clean box
# installed a Flea whose PDF and media preview could not load at all.
# gcc-libs and glibc are the binary's only direct links, and hicolor-icon-theme owns the directory
# the desktop icon is installed into.
# python is the interpreter of two scripts this package installs and D-Bus activates at runtime, so
# it is a runtime dependency rather than only the checkdepend the sandboxed child needs.
# kimageformats with libheif is Qt's HEIC decoder: without it the Space preview of a phone photo is a sentence, not a picture.
# gvfs-mtp, gvfs-gphoto2 and gvfs-afc are the three phone backends the rail reads, and usbmuxd is
# what AFC talks to. Stock Omarchy installs gvfs-mtp, gvfs-nfs and gvfs-smb only, so on a clean box
# an Android phone lists and nothing else does. Measured on an iPhone (iOS 26.6.2): its PTP leg mounts
# and answers zero folders, and AFC is the one that lists DCIM, so the iPhone needs both.
depends=('bubblewrap' 'expect' 'gcc-libs' 'glib2' 'glibc' 'gvfs' 'gvfs-afc' 'gvfs-dnssd' 'gvfs-gphoto2' 'gvfs-mtp' 'gvfs-nfs' 'gvfs-smb' 'hicolor-icon-theme' 'kimageformats' 'libheif' 'omarchy' 'python' 'python-gobject' 'qt6-multimedia' 'qt6-webengine' 'quickshell' 'shared-mime-info' 'usbmuxd' 'util-linux' 'wl-clipboard' 'xdg-terminal-exec' 'xdg-utils')
makedepends=('cargo')
# Both packages own /usr/bin/flea, so pacman refuses the pair rather than leaving one half-installed.
conflicts=('flea-git')
optdepends=('libarchive: archive listing and extraction'
            '7zip: 7z archive support'
            'imagemagick: image conversion'
            'tailscale: Taildrop sharing'
            'ffmpeg: media metadata in the preview column'
            'dropbox-cli: Dropbox share links')
# The release profile strips, so a debug package would have nothing to hold.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thisisgm/flea/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e9655cf4898ddb522fd5f18069cdcb98db69dddb0ca5a066dd54febb6cab10ae')

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo test --release --locked
  ./tests/js.sh
  ./tests/keymap-gen.sh
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$srcdir/target/release/flea" "$pkgdir/usr/bin/flea"
  install -Dm755 tools/flea-gio-auth "$pkgdir/usr/lib/flea/flea-gio-auth"
  # The portal backend, its registration and its D-Bus activation: xdg-desktop-portal 1.22 reads
  # portals/ out of every data dir, and this is Flea's own package writing Flea's own files.
  install -Dm755 tools/flea-portal "$pkgdir/usr/lib/flea/flea-portal"
  install -Dm644 packaging/flea.portal -t "$pkgdir/usr/share/xdg-desktop-portal/portals"
  install -Dm644 packaging/org.freedesktop.impl.portal.desktop.flea.service -t "$pkgdir/usr/share/dbus-1/services"
  # org.freedesktop.FileManager1, which is what Chromium's "Show in folder" calls. The file is named
  # for Flea and not for the interface: nautilus owns the plain org.freedesktop.FileManager1.service
  # path here, and dolphin, thunar and nemo each ship their own vendor-named file declaring the same
  # Name=, so a vendor name is the convention and the only way to avoid a pacman file conflict.
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
  # Commons and Ui are Omarchy's own, reached as qs.Commons: the checkout links them and so does the package.
  ln -s /usr/share/omarchy/shell/Commons "$pkgdir/usr/share/flea/ui/Commons"
  ln -s /usr/share/omarchy/shell/Ui "$pkgdir/usr/share/flea/ui/Ui"
}
