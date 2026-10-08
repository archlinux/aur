# Maintainer: Zan Skamljic <zan.skamljic@gmail.com>

pkgname=tde-session
pkgver=0.1.0
pkgrel=1
pkgdesc='The TDE desktop session: a wlroots compositor, overview, bar, lock screen and settings'
arch=(x86_64 aarch64)
url='https://github.com/zskamljic/tde-session'
license=(GPL-3.0-or-later)
depends=(
  glibc
  layer-shell-qt
  libcanberra
  libgcc
  libpulse
  libsecret
  libstdc++
  'libtde>=0.2.0'
  libxkbcommon
  openssh
  pam
  pango
  pixman
  polkit-qt6
  qt6-base
  qt6-wayland
  sound-theme-freedesktop
  systemd
  wayland
  wlroots0.20
  xdg-desktop-portal
  xdg-desktop-portal-gtk
  xdg-desktop-portal-wlr
)
makedepends=(
  cmake
  ninja
  wayland-protocols
  wlr-protocols
)
optdepends=(
  'tde-ariadne: the file manager, which picks files for other programs too'
  'xorg-xwayland: X11 programs'
  'networkmanager: networks and Wi-Fi in the bar and the settings'
  'bluez: Bluetooth in the bar and the settings'
  'upower: the battery, and suspending sooner on it'
  'power-profiles-daemon: the power mode'
  'pipewire-pulse: sound, with its volume in the bar'
  'gnome-keyring: remembering the passphrases of SSH keys'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('96409919f84554a186487550afbf3ea306903fc38558b2bd418586809928f508')

build() {
  cmake -B build -S "$pkgname-$pkgver" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  QT_QPA_PLATFORM=offscreen ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
