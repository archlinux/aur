pkgname=ioexplorer-git
pkgver=r76.0fd48fe
pkgrel=1
pkgdesc='Wayland-native provider-oriented file manager, spotlight, and other utilities for Wayland desktops'
arch=('x86_64')
url='https://github.com/LucasionGS/ioexplorer'
license=('MIT')
depends=('gtk4' 'glib2' 'gtk4-layer-shell')
makedepends=('cargo' 'git')
optdepends=(
  'xdg-desktop-portal: use ioexplorer as a desktop portal FileChooser backend'
  'xdg-utils: set ioexplorer as the default directory handler with xdg-mime'
  'grim: screen capture for ioexplorer-shot'
  'wl-clipboard: copy screenshots and quick menu picks to the clipboard, and record the quick menu clipboard history'
  'libnotify: screenshot notifications'
  'wf-recorder: screen recording with ioexplorer-shot record'
  'ffmpeg: finishing recordings and checking audio sources'
  'libpulse: recording audio and mixing in the microphone'
  'wtype: typing symbols and emoji picked in ioexplorer-quick'
  'ydotool: pasting ioexplorer-quick picks when wtype is missing'
)
source=("$pkgname::git+https://github.com/LucasionGS/ioexplorer.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  env -u RUSTFLAGS -u CFLAGS -u CXXFLAGS -u LDFLAGS cargo build --release --locked --bins
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/ioexplorer "$pkgdir/usr/bin/ioexplorer"
  install -Dm755 target/release/ioexplorer-start "$pkgdir/usr/bin/ioexplorer-start"
  install -Dm755 target/release/ioexplorer-spotlight "$pkgdir/usr/bin/ioexplorer-spotlight"
  install -Dm755 target/release/ioexplorer-file-manager "$pkgdir/usr/bin/ioexplorer-file-manager"
  install -Dm755 target/release/ioexplorer-portal "$pkgdir/usr/bin/ioexplorer-portal"
  install -Dm755 target/release/ioexplorer-desktop "$pkgdir/usr/bin/ioexplorer-desktop"
  install -Dm755 target/release/ioexplorer-shot "$pkgdir/usr/bin/ioexplorer-shot"
  install -Dm755 target/release/ioexplorer-quick "$pkgdir/usr/bin/ioexplorer-quick"
  install -Dm644 data/io.github.ionix.IoExplorer.desktop "$pkgdir/usr/share/applications/io.github.ionix.IoExplorer.desktop"
  install -Dm644 data/io.github.ionix.IoExplorer.metainfo.xml "$pkgdir/usr/share/metainfo/io.github.ionix.IoExplorer.metainfo.xml"
  install -Dm644 data/icons/hicolor/scalable/apps/io.github.ionix.IoExplorer.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.ionix.IoExplorer.svg"
  install -Dm644 data/ioexplorer.portal "$pkgdir/usr/share/xdg-desktop-portal/portals/ioexplorer.portal"
  install -Dm644 data/org.freedesktop.impl.portal.desktop.ioexplorer.service "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.ioexplorer.service"
  install -Dm644 data/org.freedesktop.FileManager1.service "$pkgdir/usr/share/doc/$pkgname/org.freedesktop.FileManager1.service"
  install -Dm644 data/ioexplorer-portals.conf "$pkgdir/usr/share/doc/$pkgname/ioexplorer-portals.conf"
  install -Dm644 data/ioexplorer-spotlight.service "$pkgdir/usr/lib/systemd/user/ioexplorer-spotlight.service"
  install -Dm644 data/ioexplorer-quick.service "$pkgdir/usr/lib/systemd/user/ioexplorer-quick.service"
  install -Dm644 data/ioexplorer-portal.service "$pkgdir/usr/lib/systemd/user/ioexplorer-portal.service"
  install -Dm644 data/ioexplorer-desktop.service "$pkgdir/usr/lib/systemd/user/ioexplorer-desktop.service"
}

post_install() {
  echo "------------------------------------------------------------"
  echo "Enable the Spotlight server with:"
  echo "  systemctl --user enable --now ioexplorer-spotlight.service"
  echo
  echo "Enable the quick menu server (instant opening, clipboard history) with:"
  echo "  systemctl --user enable --now ioexplorer-quick.service"
  echo
  echo "Enable the Portal server with:"
  echo "  systemctl --user enable --now ioexplorer-portal.service"
  echo
  echo "Enable desktop icons with:"
  echo "  systemctl --user enable --now ioexplorer-desktop.service"
  echo "------------------------------------------------------------"
}