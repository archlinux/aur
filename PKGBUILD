# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-geopy-git
pkgver=1.10.0.r431.ba50914
pkgrel=2
pkgdesc='Geocoding Toolbox for Python 2. Includes geocoder classes for the OpenStreetMap,ESRI ArcGIS,Google,Baidu,Bing,Yahoo,Yandex,IGN France,GeoNames,NaviData,OpenMapQuest,What3Words,OpenCage,SmartyStreets,geocoder.us, and GeocodeFarm geocoder services.'
arch=('any')
url='https://github.com/geopy/geopy'
license=('custom')
depends=('python2' 
         'python2-requests-oauthlib'
         'python2-pytz')
source=('git+https://github.com/geopy/geopy.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-geopy'
          'geopy'
          'geopy-svn'
          'geopy-svn-reverse-geocode-branch')
conflicts=('python2-geopy'
           'geopy'
           'geopy-svn'
           'geopy-svn-reverse-geocode-branch')

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

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

package() {
  cd geopy

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
