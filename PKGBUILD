# Maintainer: guglovich <guglovich164@gmail.com>
# Contributor: Dokja620 <revanamike620@gmail.com>
# Created with assistance from GLM 5.3 Flash.
# Based on upstream packaging/aur/PKGBUILD.
# One build, three packages, as Transmission splits its apps: linksy-common (the service and
# tools), linksy (the GTK app) and linksy-qt (the Qt app, for KDE Plasma).
pkgbase=linksy
pkgname=(linksy-common linksy linksy-qt)
pkgver=0.9.7
pkgrel=1
pkgdesc='Your phone and your Linux computer, working as one: files, clipboard, screens, webcam'
arch=('x86_64')
url='https://github.com/LinkSy-mg/linksy-desktop'
license=('AGPL-3.0-or-later')
# ring 0.17 не линкуется с -flto из makepkg CFLAGS (undefined symbols ring_core_*):
# LTO в Rust задаёт сам профиль (lto = "thin"), C-часть ring с LTO gcc ломается.
options=(!debug !lto)
makedepends=('cargo' 'lld' 'gtk4' 'libadwaita' 'gstreamer' 'gst-plugins-base' 'qt6-base' 'qt6-declarative')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('184d1ac7a0b915d04d934253f085b4cf5c65a7aa83bd1c201cccf36fd286c6bb')

prepare() {
  cd linksy-desktop-$pkgver
  _prepare_rust
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd linksy-desktop-$pkgver
  _prepare_rust
  export CARGO_TARGET_DIR=target QMAKE=/usr/bin/qmake6
  cargo build --frozen --release -p linksyd -p linksy -p linksy-app -p linksy-screen -p linksy-qt
}

check() {
  cd linksy-desktop-$pkgver
  _prepare_rust
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release -p linksy-core --lib
}

# Rust: workspace uses edition 2024, needs rustc >= 1.85.
#  - users of the plain `rust`/`cargo` packages have no rustup at all; there
#    RUSTUP_TOOLCHAIN is not read by anything and system rustc is current.
#  - rustup users may have an old default pinned (e.g. 1.78, which fails), so for
#    them we pin stable and install it when missing.
_prepare_rust() {
  if command -v rustup >/dev/null 2>&1; then
    if ! rustup run stable rustc --version >/dev/null 2>&1; then
      echo '==> rustup: installing the stable toolchain (edition 2024 needs rustc >= 1.85)'
      rustup toolchain install stable --profile minimal --no-self-update
    fi
    export RUSTUP_TOOLCHAIN=stable
  fi
}

package_linksy-common() {
  pkgdesc='Your devices, connected: the service and tools both Linksy apps share'
  depends=('dbus' 'gcc-libs' 'glibc' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugin-pipewire' 'xdg-desktop-portal')
  # Never without a window: pacman asks which, linksy (GTK) or linksy-qt (KDE Plasma)
  depends+=('linksy-window')
  optdepends=('gst-libav: H.264 decoding, to see screens'
              'gst-plugins-bad: H.264 encoding on the graphics card (VA-API)'
              'gst-plugins-ugly: H.264 encoding with x264'
              'wl-clipboard: shared clipboard while the window is not focused'
              'v4l2loopback-dkms: the phone as a webcam in every app'
              'v4l2loopback-utils: the phone as a webcam in every app')
  # Before 0.8.4, one linksy package held everything
  conflicts=('linksy<0.8.4')
  cd linksy-desktop-$pkgver
  for b in linksyd linksy linksy-screen; do
    install -Dm755 "target/release/$b" "$pkgdir/usr/bin/$b"
  done
  install -Dm755 data/linksy-open "$pkgdir/usr/bin/linksy-open"
  for s in linksy-camera-setup linksy-usb-setup linksy-system-setup; do
    install -Dm755 "data/$s" "$pkgdir/usr/lib/linksy/$s"
  done
  sed 's|@BINDIR@|/usr/bin|' data/linksyd.service | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/linksyd.service"
  install -Dm644 data/linksyd-autostart.desktop "$pkgdir/etc/xdg/autostart/linksyd.desktop"
  install -Dm644 data/70-linksy-usb.rules "$pkgdir/usr/lib/udev/rules.d/70-linksy-usb.rules"
  install -Dm644 data/linksy.firewalld.xml "$pkgdir/usr/lib/firewalld/services/linksy.xml"
  sed 's|^Exec=linksy-app|Exec=linksy-open|' data/mg.diary.linksy.Linksy.desktop | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/mg.diary.linksy.Linksy.desktop"
  install -Dm644 data/mg.diary.linksy.Linksy.metainfo.xml "$pkgdir/usr/share/metainfo/mg.diary.linksy.Linksy.metainfo.xml"
  install -Dm644 data/icons/mg.diary.linksy.Linksy.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/mg.diary.linksy.Linksy.svg"
  install -Dm644 data/icons/mg.diary.linksy.Linksy-symbolic.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/mg.diary.linksy.Linksy-symbolic.svg"
  install -Dm644 data/icons/mg.diary.linksy.Linksy-tray-symbolic.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/mg.diary.linksy.Linksy-tray-symbolic.svg"
  install -Dm644 data/icons/mg.diary.linksy.Linksy-tray-idle-symbolic.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/mg.diary.linksy.Linksy-tray-idle-symbolic.svg"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE THIRD-PARTY-NOTICES
}

package_linksy() {
  pkgdesc='Your phone and your Linux computer, working as one (GTK app, for GNOME and most desktops)'
  depends=("linksy-common=$pkgver" 'gtk4' 'libadwaita' 'gst-plugin-gtk4')
  provides=('linksy-window')
  cd linksy-desktop-$pkgver
  install -Dm755 target/release/linksy-app "$pkgdir/usr/bin/linksy-app"
}

package_linksy-qt() {
  pkgdesc='Your phone and your Linux computer, working as one (Qt app, for KDE Plasma)'
  depends=("linksy-common=$pkgver" 'gstreamer' 'qt6-base' 'qt6-declarative' 'kirigami' 'kirigami-addons' 'qqc2-desktop-style' 'gst-plugin-qml6')
  provides=('linksy-window')
  cd linksy-desktop-$pkgver
  install -Dm755 target/release/linksy-qt "$pkgdir/usr/bin/linksy-qt"
}
