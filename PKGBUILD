# Maintainer: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>

_pkgname=lxqt-wayland-session
pkgname=$_pkgname-git
pkgver=0.0.0.r23.7e30673
pkgrel=1
pkgdesc='Files needed for the LXQt Wayland Session'
arch=('any')
url='https://github.com/lxqt/lxqt-wayland-session'
# see https://github.com/lxqt/lxqt-wayland-session/blob/master/LICENSE for more details
license=(
  'LGPL-2.1-only'       # most files
  'MIT'                 # files adapted from sway and wayfire
  'GPL-2.0-only'        # files adapted from labwc https://github.com/labwc/labwc/blob/0.8.0/meson.build#L5
  'GPL-3.0-only'        # files adapted from river (https://codeberg.org/river/river/src/tag/v0.3.5#licensing) and labwc-themes
  'GPL-3.0-or-later'    # files adopted from niri (https://github.com/YaLTeR/niri/blob/v0.1.9/Cargo.toml#L8)
  'BSD-3-Clause'        # files adapted from hyprland
  'CC-BY-SA-4.0'        # wallpapers
)
depends=(
  'sh'
  'lxqt-session-git'
  # Allow to use xdg-utils under LXQt, similar to https://github.com/lxqt/lxqt-session/blob/2.0.0/CHANGELOG#L27
  # startlxqtwayland sets XDG_CURRENT_DESKTOP
  'qtxdg-tools-git'
  # For applications that need layer-shell-qt (ex: lxqt-panel)
  'layer-shell-qt'
)
optdepends=(
  # See upstream README.md for supported compositors
  'labwc'
  'wayfire'
  'kwin'
  'hyprland'
  'niri'
  'river'
  'sway'
)
makedepends=('git' 'cmake' 'qt6-tools' 'lxqt-build-tools-git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "0.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$srcdir/$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install

  install -Dm644 $_pkgname/{COPYING.LESSER,COPYING,LICENSE.MIT,LICENSE.GPLv2,LICENSE.BSD} -t "$pkgdir"/usr/share/licenses/$pkgname
}
