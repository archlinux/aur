# Maintainer:  Luigi Guevara <@killua99>
# Maintainer:  twa022 <twa022 at gmail dot com>
# Author:      Lorenzo Carbonell <lorenzo.carbonell.cerezo@gmail.com>
# Contributor: tari01

_pkgname=my-weather-indicator
pkgname=my-weather-indicator-git
pkgver=r86.b2b70c2
pkgrel=1
pkgdesc='A simple indicator for the weather'
arch=('any')
url='https://github.com/atareao/my-weather-indicator'
license=('GPL3')
depends=('libappindicator-gtk3' 'libnotify' 'webkitgtk' 'geocode-glib' 'python-pytz'
         'python-cairo' 'python-lxml' 'python-dateutil' 'osm-gps-map'
         'python-requests-oauthlib' 'geoclue2' 'geoip')
makedepends=('git' 'python-distutils-extra' 'python-polib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/atareao/my-weather-indicator")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  # Don't install to /opt and install locales to correct directory
  find . -type f -exec \
    sed -i -e 's:/opt/extras.ubuntu.com/my-weather-indicator:/usr:g' \
           -e 's:locale-langpack:locale:g' '{}' \;

  # async is a reserved keyword in python 3.7+
  cd src
  mv async.py mywi_async.py
  sed -i 's:from async import:from mywi_async import:' *py
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
