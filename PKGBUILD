# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=jack-select
pkgname="${_pkgname}-git"
pkgver=1.5.1.r178.acb6cfa
pkgrel=1
pkgdesc="A systray app to set the JACK configuration from QjackCtl presets via DBus (git version)"
arch=('any')
url="https://github.com/SpotlightKid/${_pkgname}"
license=('MIT')
depends=('dbus-python' 'hicolor-icon-theme' 'jack2-dbus' 'python-gobject' 'python-pyudev'
         'python-xdg')
optdepends=(
    'a2jmidid: ALSA-MIDI to JACK bridge control'
)
makedepends=('git' 'python-docutils' 'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/SpotlightKid/${_pkgname}")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=$(grep __version__ jackselect/version.py | cut -f 2 -d "'")
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  sed -i -e "s/'dbus-python',//" setup.py
  sed -i \
    -e '/update-desktop-database/D' \
    -e '/gtk-update-icon-cache/D' \
    Makefile
}

build() {
  cd "${srcdir}/${_pkgname}"

  make build
}

package() {
  cd "${srcdir}/${_pkgname}"

  make PREFIX=/usr "DESTDIR=${pkgdir}" install
  # documentation
  install -Dm644 CHANGELOG.rst README.md *.png -t "${pkgdir}/usr/share/doc/$pkgname"
  # license
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"
}
