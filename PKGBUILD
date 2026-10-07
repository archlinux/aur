# Maintainer: PapyElGringo <adrien@pesler.be>
pkgname=veshell-git
pkgver=alpha.1.r402.ge954bb7
pkgrel=1
pkgdesc="An innovative Not-Desktop environment for Linux built with Flutter and Rust"
arch=('x86_64')
url="https://github.com/free-explorers/veshell"
license=('GPL-3.0-or-later')
depends=(
  'fontconfig' 'ttf-roboto' 'noto-fonts' 'noto-fonts-cjk'
  'libglvnd' 'mesa'
  'libinput' 'seatd' 'systemd-libs' 'libxkbcommon' 'libxkbcommon-x11'
  'libdisplay-info' 'wayland'
  'pipewire' 'libpulse'
  'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-good'
  'dbus' 'upower' 'polkit'
  'xorg-xwayland' 'xdg-desktop-portal' 'xdg-utils'
)
makedepends=(
  'rust' 'clang' 'cmake' 'ninja' 'pkgconf' 'git'
  'unzip' 'zstd' 'xz'
  'gtk3' 'libpulse'
  'libinput' 'seatd' 'mesa' 'openssl'
  'pipewire' 'gstreamer' 'gst-plugins-base-libs'
  'libxkbcommon' 'libdisplay-info' 'wayland' 'systemd-libs'
  'vulkan-icd-loader'
)
optdepends=(
  'networkmanager: network control panel'
  'bluez: Bluetooth control panel'
  'rtkit: real-time audio scheduling'
  'xdg-desktop-portal-gtk: GTK portal fallback backend'
)
provides=('veshell' 'wayland-compositor')
conflicts=('veshell' 'veshell-bin')
source=('git+https://github.com/free-explorers/veshell.git')
sha256sums=('SKIP')

pkgver() {
  cd veshell
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd veshell
  # The project's development bootstrap prepares the project-managed .flutter_sdk,
  # resolves Dart dependencies, runs code generation, builds the Flutter shell,
  # downloads the matching engine from free-explorers/flutter-engine and compiles
  # the compositor against the final /usr install paths.
  VESHELL_ENGINE_REPO=free-explorers/flutter-engine \
    make build PREFIX=/usr PROFILE=release
}

package() {
  cd veshell
  make install PREFIX=/usr PROFILE=release DESTDIR="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/veshell/LICENSE"
}
