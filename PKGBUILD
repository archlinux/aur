# Maintainer: Grégoire Seux <grego_aur@familleseux.net>
# Contributor: Dean Galvin <deangalvin3@gmail.com>
_pkgname="home-assistant"
pkgname="python-home-assistant"
pkgdesc='Home Assistant is an open-source home automation platform running on Python 3'
pkgver=0.25.2
pkgrel=1
url="https://home-assistant.io/"
license=('MIT')
arch=('any')
makedepends=('python-setuptools')
# NB: this package will install additional python packages in /var/lib/hass/lib depending on components present in the configuration files.
depends=('python>=3.4' 'python-pip' 'python-requests' 'python-yaml' 'python-pytz>=2016.6.1' 'python-vincenty' 'python-jinja>=2' 'python-voluptuous>=0.8.9' 'python-netifaces' 'python-webcolors' 'python-eventlet>=0.19.0' 'python-sqlalchemy')
optdepends=('git: install component requirements from github'
            'net-tools: necessary for nmap discovery')
conflicts=('python-home-assistant' 'python-home-assistant-git')
source=("https://github.com/${_pkgname}/${_pkgname}/archive/${pkgver}.tar.gz"
        "home-assistant.service")
sha256sums=('4ddce8d0c7ad2e900f764a0e559863c51545be65d2158991b8e3b0acbe7ce49f'
            'SKIP')
backup=('var/lib/hass/configuration.yaml')
install='hass.install'

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  # package for voluptuous is more recent on AUR
  sed -i 's/voluptuous==0.8.9/voluptuous>=0.8.9,<1/' setup.py
  # package for sqlalchemy is less recent
  sed -i 's/sqlalchemy==1.0.14/sqlalchemy>=1.0.13/' setup.py

  # typing package is a backport of standard library < 3.5
  sed -i '/typing>=3,<4/d' setup.py
}

package() {
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  cp home-assistant.service "${pkgdir}/usr/lib/systemd/system/"

  cd ${srcdir}/${_pkgname}-${pkgver}

  python3 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
