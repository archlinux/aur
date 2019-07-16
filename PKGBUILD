# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ethan Skinner <aur@etskinner.com>
# Contributor: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
# Contributor: NicoHood <archlinux@nicohood.de>

pkgname=home-assistant
pkgdesc='Open source home automation that puts local control and privacy first'
pkgver=0.95.4
pkgrel=3
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
  'net-tools: nmap host discovery'
  'python-lxml: meteo france integration'
)
source=(
  git+https://github.com/home-assistant/home-assistant.git#tag=${pkgver}
  home-assistant.service
  home-assistant.sysusers
  home-assistant.tmpfiles
)
sha512sums=('SKIP'
            'fe96bd3df3ba666fd9f127c466d1dd1dd7314db2e57826a2b319c8a0bfad7aedeac398e748f93c6ecd9c2247ebbae196b8b0e7263b8681e2b7aeab6a8bfeab80'
            '100665ac35370c3ccec65d73521568de21cebf9e46af364124778861c94e338e32ad9abb675d3917f97d351dd7867e3ab2e80c26616330ae7cf0d9dc3f13369b'
            '3e93118c84954f829767dc71ce534c5d02c1c95fc8748714c7a2df28a3a297f59962f8fb7cddf721987eb97d62feabb25acda5d38209e365646ca4a4ef4356e3')

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
