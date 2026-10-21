# Maintainer: Max <tua-email@example.com>

pkgname=lumux-git
_pkgname=lumux
pkgver=0.6.2.r105.gd9e59fd
pkgrel=1
pkgdesc="Real-time ambient lighting sync for Philips Hue on Linux (Wayland), GTK4/libadwaita"
arch=('any')
url="https://github.com/enginkirmaci/lumux"
license=('MIT')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'python-numpy'
  'python-pillow'
  'python-requests'
  'python-urllib3'
  'python-pydbus'
  'python-zeroconf'
  'xdg-desktop-portal'
  'pipewire'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugin-pipewire'
  'openssl'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'xdg-desktop-portal-gnome: screen capture portal on GNOME'
  'xdg-desktop-portal-kde: screen capture portal on KDE Plasma'
  'xdg-desktop-portal-wlr: screen capture portal on wlroots compositors'
  'xdg-desktop-portal-hyprland: screen capture portal on Hyprland'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
_fork="https://github.com/max72bra/lumux.git"
source=("$_pkgname::git+$_fork")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  local _ver
  _ver=$(grep -m1 '^version' pyproject.toml | cut -d'"' -f2)
  printf "%s.r%s.g%s" "$_ver" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
