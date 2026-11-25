# Maintainer: dzcorp <https://github.com/dzcorp>

pkgname=lumen-kde-git
_repo=kdewin
pkgver=1.1.0.r0.g3a605b9
pkgrel=1
pkgdesc='Windows 11 style desktop for KDE Plasma 6: widget style, window decoration, Mica and Acrylic, taskbar, Start, Quick Settings, File Explorer'
arch=('x86_64' 'aarch64')
url='https://github.com/dzcorp/kdewin'
license=('GPL-3.0-or-later' 'GPL-2.0-or-later' 'LGPL-2.0-or-later')
depends=(
  'baloo' 'baloo-widgets' 'dolphin' 'kbd' 'kcmutils' 'kdecoration' 'kio' 'kirigami' 'kirigami-addons' 'knewstuff'
  'kparts' 'kpipewire' 'kquickcharts' 'kstatusnotifieritem' 'kuserfeedback' 'kwin' 'kxmlgui' 'libksysguard'
  'libplasma' 'patch' 'plasma-activities' 'plasma-activities-stats' 'plasma-desktop' 'plasma-workspace'
  'qqc2-desktop-style' 'qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-tools'
  'inter-font' 'ttf-liberation'
)
makedepends=('cargo' 'cmake' 'extra-cmake-modules' 'git' 'ninja' 'plasma-wayland-protocols' 'vulkan-headers')
optdepends=(
  'bluedevil: Bluetooth tile in Quick Settings'
  'ttf-ms-win11-auto: Segoe UI, Segoe UI Variable, Segoe Fluent Icons and Consolas (needs a Windows licence)'
  'ttf-selawik: open Segoe UI look-alike, preferred over Inter'
  'kde-gtk-config: GTK apps follow light and dark'
  'limine: boot menu theme (lumen boot on)'
  'plasma-login-manager: Lumen login screen (lumen login on)'
  'plasma-nm: Wi-Fi tile in Quick Settings'
  'plasma-pa: volume tile in Quick Settings'
  'plymouth: boot splash (lumen boot on)'
  'powerdevil: brightness, battery and power profile tiles'
)
provides=('lumen-kde')
conflicts=('lumen-kde' 'lumen' 'lumen-git')
install=lumen-kde.install
source=("$_repo::git+https://github.com/dzcorp/kdewin.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_repo"
  local desc
  if desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' <<<"$desc"
  else
    printf '%s.r%s.g%s' "$(sed -n 's/^version = "\(.*\)"$/\1/p' tokens/tokens.toml | head -1)" \
      "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "$_repo"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path tools/lumen/Cargo.toml --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_repo"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --manifest-path tools/lumen/Cargo.toml
  tools/lumen/target/release/lumen --root "$PWD" gen
  cmake -S . -B build/cmake -G Ninja -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DLUMEN_GEN_DIR="$PWD/build/gen/cpp" \
    -DLUMEN_DOLPHIN_BINDIR=/usr/lib/lumen/bin \
    -DLUMEN_DOLPHIN_APPDIR=/usr/share/lumen/xdg/applications
  cmake --build build/cmake
}

package() {
  cd "$_repo"
  tools/lumen/target/release/lumen --root "$PWD" install --destdir "$pkgdir"
}
