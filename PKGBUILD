# Maintainer: Zan Skamljic <zan.skamljic@gmail.com>

pkgname=tde-session-git
_pkgname=tde-session
pkgver=0.1.0
pkgrel=1
pkgdesc='The TDE desktop session: a wlroots compositor, overview, bar, lock screen and settings (development version)'
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
  'libtde>=0.2.0'
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
  git
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
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # 0.1.0.r12.gabc1234 counting from tag v0.1.0; r12.gabc1234 before the first tag.
  if git describe --tags >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cmake -B build -S "$_pkgname" -G Ninja \
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
