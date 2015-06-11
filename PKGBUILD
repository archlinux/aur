# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-geopy-git
pkgver=1.10.0.r431.ba50914
pkgrel=2
pkgdesc='Geocoding Toolbox for Python 3. Includes geocoder classes for the OpenStreetMap,ESRI ArcGIS,Google,Baidu,Bing,Yahoo,Yandex,IGN France,GeoNames,NaviData,OpenMapQuest,What3Words,OpenCage,SmartyStreets,geocoder.us, and GeocodeFarm geocoder services.'
arch=('any')
url='https://github.com/geopy/geopy'
license=('custom')
depends=('python' 
         'python-requests-oauthlib'
         'python-pytz')
source=('git+https://github.com/geopy/geopy.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-geopy')
conflicts=('python-geopy')

pkgver() {
  cd geopy
  set -o pipefail
  _gitversion=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  if [ -f "geopy/__init__.py" ]; then
      printf "%s.%s" "$(grep -R "__version__ =" geopy/__init__.py | awk -F\" '{print $2}')" $_gitversion | sed 's/-/./g'
  else
    printf "%s" $_gitversion
  fi
}

build() {
  cd geopy

  python setup.py build
}

package() {
  cd geopy

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
