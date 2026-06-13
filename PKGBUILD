# Maintainer: Daniel Grasso

_pkgname=wayland-scroll-factor
pkgname=wayland-scroll-factor-git
pkgver=0.3.0.10.ge29a231
pkgrel=1
pkgdesc='Touchpad scroll and gesture tuning for Wayland (GNOME and Hyprland)'
arch=('x86_64')
url='https://github.com/daniel-g-carrasco/wayland-scroll-factor'
license=('MIT')
options=('!debug')
depends=('gtk4' 'libadwaita' 'python' 'python-gobject')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'gcc')
optdepends=(
  'libinput-tools: for wsf doctor diagnostics'
  'hyprland: for Hyprland native scroll and gesture support'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
install=wayland-scroll-factor.install
source=("$_pkgname::git+https://github.com/daniel-g-carrasco/wayland-scroll-factor.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  local ver
  ver=$(git describe --long --tags --abbrev=7 2>/dev/null)
  if [[ -n "$ver" ]]; then
    echo "$ver" | sed 's/^v//; s/-/./g'
  else
    printf "0.0.0.r%s.g%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$srcdir/$_pkgname"
  meson setup build --prefix=/usr --buildtype=release
  ninja -C build
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
