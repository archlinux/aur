# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Arnaud Taffanel <dev@taffanel.org>
# Contributor: Victor Häggqvist <aur a snilius d com>

pkgname=solaar-git
pkgver=1.1.11.r165.gc70e8b54
pkgrel=1
pkgdesc="Device manager for Logitech's Unifying receiver peripherals"
url="https://pwr-solaar.github.io/Solaar/"
license=('GPL2')
arch=('any')
provides=("solaar")
conflicts=("solaar")
depends=(
  'gtk3'
  'libnotify'
  'python-dbus'
  'python-gobject'
  'python-pyudev'
  'python-yaml'
  'python-xlib'
  'python-psutil'
  'python-evdev'
  'python-hid-parser-git'
)
optdepends=('libappindicator-gtk3: tray icon support')
makedepends=('git')
source=("${pkgname}::git+https://github.com/pwr-Solaar/Solaar.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"

  tools/po-compile.sh
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  # udev
  install -vDm 644 rules.d/42-logitech-unify-permissions.rules \
    "${pkgdir}/usr/lib/udev/rules.d/42-logitech-unify-permissions.rules"
  # docs
  install -vDm 644 {CHANGELOG.md,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
# vim:set ts=2 sw=2 et:
