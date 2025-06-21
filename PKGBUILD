# Maintainer: Dan Johansen <strit@archlinux.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Librewish <librewish@gmail.com?

pkgname=('greetd-qtgreet')
_pkgname=QtGreet
pkgver=2.0.4
pkgrel=4
pkgdesc='Qt based greeter for greetd'
arch=('aarch64' 'x86_64')
url="https://gitlab.com/marcusbritanicus/${_pkgname}"
license=('GPL-3.0-only')
depends=(
        'python'
        'greetd'
        'dfl-applications'
        'dfl-login1'
        'dfl-wayqt'
        'dfl-utils'
        'libxkbcommon'
        'hicolor-icon-theme'
        'wayland'
        'mpv'
        'python-pyqt6'
        'qt6-base'
        'sway'
)
optdepends=(
            'wayfire: for wayfire support'
            'labwc: for labwc support'
)
makedepends=(
            'meson'
            'ninja'
)
backup=(
       "etc/qtgreet/config.ini"
       "etc/qtgreet/sway.cfg"
       "etc/qtgreet/users.conf"
       "etc/qtgreet/wayfire.ini"
)
install=${pkgname}.install
source=("${_pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('be7ead0355f9f3ee367c70bac659569c024679f1e1306535f6b0970ff0c438fc')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT6 version..."
  meson setup .build --prefix=/usr -Duse_qt_version=qt6 --buildtype=release
  ninja -C .build
}

package_greetd-qtgreet() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
  install -d 755 "${pkgdir}/var/lib/qtgreet"
  chown greeter:greeter "${pkgdir}/var/lib/qtgreet"
  echo "At least one of wayfire, sway or labwc is required"
}
