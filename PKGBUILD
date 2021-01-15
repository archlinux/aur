# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jack-select
pkgver=1.5.1
pkgrel=1
pkgdesc="A systray app to set the JACK configuration from QjackCtl presets via DBus."
arch=('any')
url="https://github.com/SpotlightKid/jack-select"
license=('MIT')
depends=('python-dbus' 'python-gobject' 'python-pyudev' 'python-setuptools' 'python-xdg')
optdepends=(
    'a2jmidid: ALSA-MIDI to JACK bridge control'
)
source=("https://files.pythonhosted.org/packages/source/j/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('77e392dd73ef48294b925a1b542b87203a41c2d401ba066b0a09e03c1cc6935d')


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
