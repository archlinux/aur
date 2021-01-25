# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2021.1.5
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
_tag=6715eae3d7f7d20a37c2c2aa85be6566c4e43939
source=(
  git+https://github.com/home-assistant/home-assistant.git#tag=${_tag}
  home-assistant.service
  home-assistant-astral2.2.patch
)
b2sums=('SKIP'
        '0df7bbfdac09e37294ac27567e677855c72d13be3aefbd23e0a8f101cf2148302affbe9b6b586b893f77fc990f665d7b95f4916583680c06abd8f74b5cdf3da9'
        'b21f1e662c242a10b0fdd8727dfb25a293e13ca3f431d49c2f7ef5b5427ad5b89ce6e7fe399a8bbad986c4e128c94be571227f67778764cf5441bf1f8dc00eaf')

pkgver() {
  cd home-assistant

  git describe --tags
}

prepare() {
  cd home-assistant

  patch -Np1 -i ../home-assistant-astral2.2.patch

  # lift hard dep constraints, we'll deal with breaking changes ourselves
  sed 's/==/>=/g' -i setup.py homeassistant/package_constraints.txt
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
