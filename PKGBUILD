# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jack-select
pkgver=1.5.2
pkgrel=3
pkgdesc="A systray app to set the JACK configuration from QjackCtl presets via DBus."
arch=('any')
url="https://github.com/SpotlightKid/jack-select"
license=('MIT')
depends=('dbus-python' 'hicolor-icon-theme' 'jack2-dbus' 'python-gobject' 'python-pyudev'
         'python-xdg')
makedepends=('python-setuptools')
optdepends=(
    'a2jmidid: ALSA-MIDI to JACK bridge control'
)
source=("https://files.pythonhosted.org/packages/source/j/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5fc02be221a3f5c810fa0cb635d7f6b1bfbf63ff32666ce9c64132b209f92d4b')


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i -e "s/'dbus-python',//" setup.py
  sed -i \
    -e '/update-desktop-database/D' \
    -e '/gtk-update-icon-cache/D' \
    Makefile
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr "DESTDIR=${pkgdir}" install
  # documentation
  install -Dm644 CHANGELOG.rst README.md *.png -t "${pkgdir}/usr/share/doc/$pkgname"
  # license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
