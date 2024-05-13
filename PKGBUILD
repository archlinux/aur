# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Arnaud Taffanel <dev@taffanel.org>
# Contributor: Victor Häggqvist <aur a snilius d com>

pkgname=solaar-git
pkgver=1.1.13.r2.g9d2cedbe
pkgrel=2
pkgdesc="Linux device manager for a wide range of Logitech devices"
url="https://pwr-solaar.github.io/Solaar/"
_url="https://github.com/pwr-Solaar/Solaar"
license=(GPL-2.0-or-later)
arch=(any)
depends=(
  glib2
  gobject-introspection-runtime
  gtk3
  hicolor-icon-theme
  libnotify
  python
  python-dbus
  python-evdev
  python-gobject
  python-psutil
  python-pyudev
  python-xlib
  python-yaml
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=('libayatana-appindicator: Display tray icon')

provides=("solaar" "python-hid-parser")
conflicts=("solaar" "python-hid-parser")
replaces=("python-hid-parser")

source=(
  "${pkgname}::git+https://github.com/pwr-Solaar/Solaar.git"
)
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  tools/po-compile.sh
}

build() {
  cd $pkgname
  rm -rf dist # clean up old builds so dist/*.whl works in package
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  # udev
  rm -rf "$pkgdir/etc"
  install -vDm 644 rules.d/42-logitech-unify-permissions.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  # docs
  install -vDm 644 {CHANGELOG,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
# vim:set ts=2 sw=2 et:
