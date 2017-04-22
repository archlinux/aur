# Maintainer: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
pkgname="home-assistant"
pkgdesc='Home Assistant is an open-source home automation platform running on Python 3'
pkgver=0.43
pkgrel=1
url="https://home-assistant.io/"
license=('MIT')
arch=('any')
replaces=('python-home-assistant')
makedepends=('python-setuptools')
# NB: this package will install additional python packages in /var/lib/hass/lib depending on components present in the configuration files.
depends=('python>=3.4' 'python-pip' 'python-requests' 'python-yaml' 'python-pytz>=2017.2' 'python-vincenty' 'python-jinja>=2' 'python-voluptuous>=0.9.3' 'python-netifaces' 'python-webcolors' 'python-async-timeout>=1.2.0' 'python-aiohttp>=2.0.3' 'python-jinja>=2.9.5' 'python-yarl>=0.10.0' 'python-chardet>=2.3.0')
optdepends=('git: install component requirements from github'
            'net-tools: necessary for nmap discovery')
conflicts=('python-home-assistant' 'python-home-assistant-git')
source=("https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz"
"home-assistant.service")
sha256sums=('f1fc9061461eeec77119a3394cc1967de8de6d1b2a2b6e5962c2bd826aebc234'
            '2a87a3b529a1eeddfae0c02c415bed13586b002b9580226bdc749a27bbe83af5')
backup=('var/lib/hass/configuration.yaml')
install='hass.install'

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  set -e

  # typing package is a backport of standard library < 3.5
  replace 'typing>=3,<4' '' setup.py

  replace 'aiohttp==2.0.7' 'aiohttp==2.0.3' setup.py

  replace 'chardet==3.0.2' 'chardet==2.3.0' setup.py
}

replace() {
  pattern=$1
  substitute=$2
  file=$3
  echo -n "Replacing '$pattern' by '$substitute' in $file..."
  (grep -q $pattern $file && sed -i "s/$pattern/$substitute/" $file && echo "DONE") || (echo "FAILED" && exit 1)
}

package() {
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  cp home-assistant.service "${pkgdir}/usr/lib/systemd/system/"

  cd ${srcdir}/${pkgname}-${pkgver}

  python3 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
