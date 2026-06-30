# Maintainer: Vergil <root@feds.farm>
#
# A Hyprland plugin's ABI must match the EXACT Hyprland it is loaded into, so this is a
# -git package that rebuilds against whatever `hyprland` is installed. Rebuild it every
# time you update Hyprland, or it will refuse to load (or crash on load).
pkgname=gloview-git
pkgver=0.3.0.r3.8f83476
pkgrel=1
pkgdesc="macOS Mission Control-style overview plugin for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/fedsfarm/gloview"
license=('GPL-3.0-or-later')
groups=('hyprland-plugins')
depends=('hyprland')
makedepends=('cmake' 'git' 'pkgconf' 'lua')
provides=('gloview')
conflicts=('gloview')
install=gloview.install
source=("$pkgname::git+https://github.com/fedsfarm/gloview.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
      || printf "0.3.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$pkgname"
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build -j"$(nproc)"
}

package() {
  install -Dm755 "$pkgname/build/gloview.so" "$pkgdir/usr/lib/gloview.so"
}

# After install, load it from hyprland.conf:
#   plugin = /usr/lib/gloview.so
# then bind it, e.g.:  bind = SUPER, TAB, gloview:toggle
