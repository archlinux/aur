# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2021.4.6
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
_tag=5ee373869a59266142001b62a5067d56c22bfddf
source=(
  git+https://github.com/home-assistant/home-assistant.git#tag=${_tag}
  home-assistant.service
  home-assistant-astral2.2.patch
)
b2sums=('SKIP'
        '0df7bbfdac09e37294ac27567e677855c72d13be3aefbd23e0a8f101cf2148302affbe9b6b586b893f77fc990f665d7b95f4916583680c06abd8f74b5cdf3da9'
        '4458692cb10e0832c1b321b96d74d7dd7e5e0e9e9b23d420efec9e27e5b0f34ef33f64789b05fbc5ec49337002ad26b026079b939741bbf16869c52c9316ef34')

pkgver() {
  cd home-assistant
  git describe --tags
}

prepare() {
  cd home-assistant
  patch -Np1 -i ../home-assistant-astral2.2.patch
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
