# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=2022.10.5
pkgrel=1
epoch=1
arch=(any)
url=https://home-assistant.io/
license=(APACHE)
depends=(
  gcc
  python-aiodiscover
  python-aiohttp
  python-aiohttp-cors
  python-astral
  python-async-timeout
  python-atomicwrites
  python-attrs
  python-awesomeversion
  python-bcrypt
  python-certifi
  python-ciso8601
  python-cryptography
  python-dateutil
  python-defusedxml
  python-fnvhash
  python-home-assistant-bluetooth
  python-httpx
  python-ifaddr
  python-jinja
  python-lru-dict
  python-mutagen
  python-orjson
  python-pillow
  python-pip
  python-pyjwt
  python-pytz
  python-requests
  python-ruamel-yaml
  python-slugify
  python-sqlalchemy
  python-typing_extensions
  python-voluptuous
  python-voluptuous-serialize
  python-yaml
  python-yarl
  python-zeroconf
  python-setuptools
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
)
optdepends=(
  'net-tools: Nmap host discovery'
  'openzwave: Z-Wave integration'
  'python-dtlssocket: Ikea Tradfri integration'
  'python-lxml: Meteo France integration'
  'python-paho-mqtt: mqtt integration'
)
_tag=83d617737f2b3db9a4994bc127dfa52493526a37
source=(
  git+https://github.com/home-assistant/home-assistant.git#tag=${_tag}
  home-assistant.service
)
b2sums=('SKIP'
        'b5e181e00e499cd0c6e3922af44afe7e8043063d49c89c207beeff9b56ea2920a6f7b6d211be027cb4b6cf8450396623515dadcebdbdbdf0f934d3d16963790e')

pkgver() {
  cd home-assistant
  git describe --tags
}

prepare() {
  cd home-assistant
  # lift hard dep constraints, we'll deal with breaking changes ourselves
  sed 's/==/>=/g' -i pyproject.toml requirements.txt setup.cfg homeassistant/package_constraints.txt
  # allow pip >= 20.3 to be used
  sed 's/,<20.3//g' -i pyproject.toml requirements.txt setup.cfg homeassistant/package_constraints.txt
  # allow any setuptools to be used
  sed 's/~=62.3//' -i pyproject.toml
}

build() {
  cd home-assistant
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" home-assistant/dist/*.whl
  install -Dm 644 home-assistant.service -t "${pkgdir}"/usr/lib/systemd/system/
}

# vim: ts=2 sw=2 et:
