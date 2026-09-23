# Maintainer: taxin-404 <taxin404@duck.com>
# Contributor: GM <gianmarcomorales@icloud.com>

# The release workflow's binaries with flea's own closure, whose reasons live beside it in the root PKGBUILD.
pkgname=flea-bin
_pkgname=flea
pkgver=0.3.4
pkgrel=1
pkgdesc='Fast, keyboard-first file manager for Omarchy (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/thisisgm/flea'
license=('MIT')
depends=('bubblewrap' 'expect' 'gcc-libs' 'glib2' 'glibc' 'gvfs' 'gvfs-afc' 'gvfs-dnssd' 'gvfs-gphoto2' 'gvfs-mtp' 'gvfs-nfs' 'gvfs-smb' 'hicolor-icon-theme' 'kimageformats' 'libheif' 'omarchy' 'python' 'python-gobject' 'qt6-multimedia' 'qt6-webengine' 'quickshell' 'shared-mime-info' 'usbmuxd' 'util-linux' 'wl-clipboard' 'xdg-terminal-exec' 'xdg-utils')
optdepends=('libarchive: archive listing and extraction'
            '7zip: 7z archive support'
            'imagemagick: image conversion'
            'tailscale: Taildrop sharing'
             'ffmpeg: media metadata in the preview column'
             'ffmpegthumbnailer: video thumbnails, made by one pre-linked worker through libffmpegthumbnailer.so.4, or by the ffmpegthumbnailer program per video when that library will not load'
             'dropbox-cli: Dropbox share links')
provides=("$_pkgname=$pkgver")
# All three own /usr/bin/flea, so pacman refuses the pair rather than leaving one half-installed.
conflicts=("$_pkgname" "$_pkgname-git")
# The release profile already stripped the binary, so there is nothing to strip and no debug package.
options=('!strip' '!debug')
# SKIP here keeps a version bump to one line; the release workflow pins both before the AUR ever sees them.
source_x86_64=("$_pkgname-v$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$_pkgname-v$pkgver-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('bcba5bfb8661f8e350a2834eb057f4d0ffd2f78f52f46349c6a2451d9040730d')
sha256sums_aarch64=('7cb6172179a531d12b57ad18be018e3a7296609e1e9852b1c39cb53678e51611')

# The source PKGBUILD's package() with the binary read from the tarball's root; the release workflow diffs the two.
package() {
  cd "$_pkgname-$pkgver-linux-$CARCH"
  install -Dm755 flea "$pkgdir/usr/bin/flea"
  install -Dm755 tools/flea-gio-auth "$pkgdir/usr/lib/flea/flea-gio-auth"
  # The portal backend, its registration and its D-Bus activation; xdg-desktop-portal 1.22 reads every data dir's portals/.
  install -Dm755 tools/flea-portal "$pkgdir/usr/lib/flea/flea-portal"
  install -Dm644 packaging/flea.portal -t "$pkgdir/usr/share/xdg-desktop-portal/portals"
  install -Dm644 packaging/org.freedesktop.impl.portal.desktop.flea.service -t "$pkgdir/usr/share/dbus-1/services"
  # FileManager1 is Chromium's "Show in folder"; the file is vendor-named, as nautilus owns the plain one.
  install -Dm755 tools/flea-filemanager1 "$pkgdir/usr/lib/flea/flea-filemanager1"
  install -Dm644 packaging/com.thisisgm.flea.FileManager1.service -t "$pkgdir/usr/share/dbus-1/services"
  install -Dm644 packaging/com.thisisgm.flea.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/com.thisisgm.flea.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  # paths.rs looks for /usr/share/flea/ui/boot/shell.qml, so the UI ships as data beside the binary.
  install -Dm644 ui/qmldir ui/*.qml -t "$pkgdir/usr/share/flea/ui"
  install -Dm644 ui/js/*.js -t "$pkgdir/usr/share/flea/ui/js"
  # The two Quickshell entries, in their own directory so ui/qmldir's singletons stay off the startup path.
  install -Dm644 ui/boot/shell.qml ui/boot/picker.qml -t "$pkgdir/usr/share/flea/ui/boot"
  # The bar plugin ships as data, flat, for the Enable shelf switch to copy into the user's plugin directory.
  install -Dm644 shelf/manifest.json shelf/README.md shelf/*.qml shelf/*.js -t "$pkgdir/usr/share/flea/shelf"
  # Omarchy's own Commons and Ui, reached as qs.Commons, linked into both config roots the entries use.
  ln -s /usr/share/omarchy/shell/Commons "$pkgdir/usr/share/flea/ui/Commons"
  ln -s /usr/share/omarchy/shell/Ui "$pkgdir/usr/share/flea/ui/Ui"
  ln -s /usr/share/omarchy/shell/Commons "$pkgdir/usr/share/flea/ui/boot/Commons"
  ln -s /usr/share/omarchy/shell/Ui "$pkgdir/usr/share/flea/ui/boot/Ui"
}
