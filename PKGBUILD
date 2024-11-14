# Maintainer: l0gic <l0gic@invalid.invalid>
# Contributor: TheK0tYaRa
# Inspired by: FabioLolix, éclairevoyant, ThatOneCalculator <kainoa at t1c dot dev>

pkgname=hyprland-protocols
pkgver=0.4.0
pkgrel=1
pkgdesc="Wayland protocol extensions for Hyprland"
arch=("x86_64" "aarch64")
url="https://github.com/hyprwm/hyprland-protocols"
license=("BSD-3-Clause")
makedepends=('make' 'meson' 'ninja')
# optdepends=(
#   'cmake: to build and install plugins using hyprpm'
#   'cpio: to build and install plugins using hyprpm'
#   'meson: to build and install plugins using hyprpm'
# )
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ab3525d8bad576db911d4ba1b586f303dd988660b3b8980022c1795fd574b165')

build() {
  cd "${pkgname}-${pkgver}"

  #export CXXFLAGS="-w" # suppress all compiler warnings
  meson setup build \
    --wipe \
    --prefix /usr \
    --libexecdir lib \
    --buildtype release \
    --wrap-mode nodownload \
    -D warning_level=0 \
    -D b_lto=true \
    -D b_pie=true \
    -D default_library=shared # \
    # -D xwayland=enabled \
    # -D systemd=enabled

  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"

  meson install -C build --destdir "${pkgdir}"

  # FIXME: remove after xdg-desktop-portal-hyprland disowns hyprland-portals.conf
  rm -rf "$pkgdir/usr/share/xdg-desktop-portal"

  # license
  install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE
}
# vi: et ts=2 sw=2
