# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2021.5.3
pkgrel=1
arch=(any)
url=https://home-assistant.io/
license=(APACHE)
depends=(
  gcc
  python-aiohttp
  python-aiohttp-cors
  python-astral
  python-async-timeout
  python-attrs
  python-awesomeversion
  python-bcrypt
  python-certifi
  python-ciso8601
  python-cryptography
  python-defusedxml
  python-httpx
  python-jinja
  python-mutagen
  python-pillow
  python-pip
  python-pyjwt
  python-pytz
  python-requests
  python-ruamel-yaml
  python-slugify
  python-sqlalchemy
  python-voluptuous
  python-voluptuous-serialize
  python-yaml
  python-yarl
  python-zeroconf
)
makedepends=(
  git
  python-setuptools
)
optdepends=(
  'net-tools: Nmap host discovery'
  'openzwave: Z-Wave integration'
  'python-dtlssocket: Ikea Tradfri integration'
  'python-lxml: Meteo France integration'
)
_tag=88adc8801cf533caab4b04f91b78d77c8b22f213
source=(
  git+https://github.com/home-assistant/home-assistant.git#tag=${_tag}
  home-assistant.service
)
b2sums=('SKIP'
        'c56b88e4d8d6d10ea132d22916468109ffaa83c1176a75e0c0ead16b261c34fe4c279cec6dca415b1addfcd873ad35b294f60a3e1ba62cc917a9dbb73cce47d4')

pkgver() {
  cd home-assistant
  git describe --tags
}

prepare() {
  cd home-assistant
  # lift hard dep constraints, we'll deal with breaking changes ourselves
  sed 's/==/>=/g' -i requirements.txt setup.py homeassistant/package_constraints.txt
  # allow pip >= 20.3 to be used
  sed 's/,<20.3//g' -i requirements.txt setup.py homeassistant/package_constraints.txt
}

build() {
  cd home-assistant
  python setup.py build
}

package() {
  cd home-assistant
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
  install -Dm 644 ../home-assistant.service -t "${pkgdir}"/usr/lib/systemd/system/
}

# vim: ts=2 sw=2 et:
