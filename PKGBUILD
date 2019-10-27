# Maintainer:  Luigi Guevara <@killua99>
# Maintainer:  twa022 <twa022 at gmail dot com>
# Author:      Lorenzo Carbonell <lorenzo.carbonell.cerezo@gmail.com>
# Contributor: tari01

_pkgname=my-weather-indicator
pkgname=my-weather-indicator-git
pkgver=r104.9ce9b4c
pkgrel=1
pkgdesc='A simple indicator for the weather'
arch=('any')
url='https://github.com/atareao/my-weather-indicator'
license=('GPL3')
depends=('libappindicator-gtk3' 'libnotify' 'webkit2gtk' 'geocode-glib' 'python-pytz'
         'python-cairo' 'python-lxml' 'python-dateutil' 'osm-gps-map'
         'python-requests-oauthlib' 'geoclue2' 'geoip')
makedepends=('git' 'python-distutils-extra' 'python-polib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/atareao/my-weather-indicator"
        'https://raw.githubusercontent.com/atareao/my-weather-indicator/8701218dc218f5533590b995617f3f1e839135d9/setup.py')
sha256sums=('SKIP'
            '97e101e29ece53549ed1ce4c7958d9207cd1da9e60f6ea9f0aa7849baed82897')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  cp ../setup.py .

  # Don't install to /opt and install locales to correct directory
  find . -type f -exec \
    sed -i -e 's:/opt/extras.ubuntu.com/my-weather-indicator:/usr:g' \
           -e 's:locale-langpack:locale:g' '{}' \;

  # async is a reserved keyword in python 3.7+
#  cd src
#  mv async.py mywi_async.py
#  sed -i 's:from async import:from mywi_async import:' *py
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
