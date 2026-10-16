# Maintainer: Zan Skamljic <zan.skamljic@gmail.com>

pkgname=tde-session
pkgver=0.3.2
pkgrel=2
pkgdesc='The TDE desktop session: a wlroots compositor, overview, bar, lock screen and settings'
arch=(x86_64 aarch64)
url='https://github.com/zskamljic/tde-session'
license=(GPL-3.0-or-later)
depends=(
  glibc
  layer-shell-qt
  libcanberra
  libgcc
  libinput
  libpulse
  libsecret
  libstdc++
  'libtde>=0.3.0'
  libxkbcommon
  lua
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
  'fprintd: unlocking the screen with a finger'
  'brightnessctl: the keyboard light keys, where the keyboard does not change it itself'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d7fbbb5a32213575c5e48f9312a3b7e2b611d234d7ac60a40fff6759a8e61eb0')

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
