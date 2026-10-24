pkgname=nm-sidebar
pkgver=1.4.0
pkgrel=1
pkgdesc='GTK4/libadwaita NetworkManager sidebar for Wayland desktops'
arch=('x86_64')
url='https://github.com/Relz/network-manager-sidebar'
license=('GPL-3.0-or-later')
keywords=('gtk4' 'layer-shell' 'libadwaita' 'network-manager' 'networkmanager' 'sidebar' 'vpn' 'wayland' 'wifi')
# WireGuard import needs editor 1.32+ built against libnm 1.40+;
# upgrading runtime libnm alone cannot enable an omitted import path.
depends=(
  'glib2>=2.68'
  'json-glib>=1.6'
  'gtk4'
  'libadwaita>=1.6'
  'networkmanager>=1.40'
  'gtk4-layer-shell'
  'nm-connection-editor>=1.32'
  'polkit'
  'dbus'
)
makedepends=(
  'meson'
  'ninja'
  'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6b66108cdf2ba89e5275d716b98eaa6bab50e05ec6df36613fa56b866398d64e')

_github_repo='Relz/network-manager-sidebar'
_source_name="${_github_repo##*/}-$pkgver"
_build_name="build-$pkgver-$pkgrel"

build() {
  local source_dir="$srcdir/$_source_name"
  local build_dir="$srcdir/$_build_name"

  rm -rf "$build_dir"
  meson setup "$build_dir" "$source_dir" \
    --prefix=/usr \
    --libdir=lib \
    --libexecdir=libexec \
    --buildtype=plain
  meson compile -C "$build_dir"
}

package() {
  local build_dir="$srcdir/$_build_name"

  DESTDIR="$pkgdir" meson install -C "$build_dir"
}
