# Maintainer:  Luigi Guevara <@killua99>
# Maintainer:  twa022 <twa022 at gmail dot com>
# Author:      Lorenzo Carbonell <lorenzo.carbonell.cerezo@gmail.com>
# Contributor: tari01

_pkgname=my-weather-indicator
pkgname=my-weather-indicator-git
epoch=1
pkgver=0.9.4.0extras19.10.10.r123.355bd96
pkgrel=1
pkgdesc='A simple indicator for the weather'
arch=('any')
url='https://github.com/atareao/my-weather-indicator'
license=('GPL3')
depends=('libappindicator-gtk3' 'libnotify' 'webkit2gtk' 'geocode-glib' 'python-pytz'
         'python-cairo' 'python-lxml' 'python-dateutil' 'osm-gps-map'
         'python-requests-oauthlib' 'geoclue' 'geoip')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/atareao/my-weather-indicator#branch=dev/19.10")
sha256sums=('SKIP')

_pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s.r%s.%s" "$(head -n 1 debian/changelog | cut -d'(' -f 2 | cut -d')' -f 1 | \
        sed 's/-/./')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  echo -e >> debian/install
}

package() {
  cd "${_pkgname}"
  while read _in _out ; do
    mkdir -p "${pkgdir}/${_out}/"
    install -m644 ${_in} "${pkgdir}/${_out}/"
  done < debian/install
  chmod 755 "${pkgdir}"/usr/bin/my-weather-indicator
  ./make_translations.sh
}
