# Maintainer:  Luigi Guevara <@killua99>
# Maintainer:  twa022 <twa022 at gmail dot com>
# Author:      Lorenzo Carbonell <lorenzo.carbonell.cerezo@gmail.com>
# Contributor: tari01

_pkgname=my-weather-indicator
pkgname=my-weather-indicator-git
epoch=1
pkgver=0.10.6.0+r221+63258d2
pkgrel=1
pkgdesc='A simple indicator for the weather'
arch=('any')
url='https://github.com/atareao/my-weather-indicator'
license=('GPL3')
depends=('libayatana-appindicator' 'libnotify' 'webkit2gtk' 'geocode-glib' 'python-pytz'
         'python-cairo' 'python-lxml' 'python-dateutil' 'osm-gps-map'
         'python-requests-oauthlib' 'geoclue' 'geoip')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/atareao/my-weather-indicator")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s+r%s+%s" \
      "$(head -n 1 debian/changelog | cut -d'(' -f 2 | cut -d')' -f 1 | sed 's/-/./;s:[^0-9\.].*::')" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  # Don't install to /opt and install locales to correct directory
  find . -type f -exec \
    sed -i -e 's:/opt/extras.ubuntu.com/my-weather-indicator:/usr:g' \
           -e 's:locale-langpack:locale:g' '{}' \;
  # Create a script to install the translations from the debian rules file
  grep -A 1000 "Create languages directories" debian/rules | \
    grep -B 1000 "End comile languages" | \
    sed "s:\${CURDIR}/debian/my-weather-indicator:\"${pkgdir}\":g" > make_translations.sh
  chmod +x make_translations.sh
  # Missing newline at the end of the file makes the package function not install the file on the last line 
  # echo -e >> debian/install
}

package() {
  cd "${_pkgname}"
  while read _in _out ; do
    mkdir -p "${pkgdir}/${_out}/"
    cp -r ${_in} "${pkgdir}/${_out}/"
  done < debian/install
  find "${pkgdir}" -type d -exec chmod 755 '{}' \;  
  find "${pkgdir}" -type f -exec chmod 644 '{}' \;
  chmod 755 "${pkgdir}"/usr/bin/my-weather-indicator
  ./make_translations.sh
}
