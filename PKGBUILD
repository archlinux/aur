# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=0.100.1
pkgrel=1
arch=(any)
url=https://home-assistant.io/
license=(APACHE)
depends=(
  python-aiohttp
  python-astral
  python-async-timeout
  python-attrs
  python-bcrypt
  python-certifi
  python-cryptography
  python-importlib-metadata
  python-jinja
  python-pyjwt
  python-pip
  python-pytz
  python-requests
  python-ruamel-yaml
  python-slugify
  python-sqlalchemy
  python-voluptuous
  python-voluptuous-serialize
  python-yaml
)
makedepends=(
  git
  python-setuptools
)
optdepends=(
  'net-tools: Nmap host discovery'
  'openzwave: Z-Wave integration'
  'python-lxml: Meteo France integration'
)
source=(
  git+https://github.com/home-assistant/home-assistant.git#tag=8f384e6b8214d1271ce3250e8657b30db235bce6
  home-assistant.service
  home-assistant.sysusers
  home-assistant.tmpfiles
)
sha256sums=(
  SKIP
  2a87a3b529a1eeddfae0c02c415bed13586b002b9580226bdc749a27bbe83af5
  319c7790d3cdb076bf527b1d478edbc99e00b22fbf4a884b395e46460114ee41
  f9e43edb276e0fbbbc2273b836ef1da0ac43347b5c3e4c63774e7f7ecdf25660
)

pkgver() {
  cd home-assistant

  git describe --tags
}

prepare() {
  cd home-assistant

  # lift hard dep constraints, we'll deal with breaking changes ourselves
  sed 's/==/>=/g' -i setup.py
}

build() {
  cd home-assistant

  python setup.py build
}

package() {
  cd home-assistant

  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build

  install -Dm 644 ../home-assistant.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 ../home-assistant.sysusers "${pkgdir}"/usr/lib/sysusers.d/home-assistant.conf
  install -Dm 644 ../home-assistant.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/home-assistant.conf
}

# vim: ts=2 sw=2 et:
