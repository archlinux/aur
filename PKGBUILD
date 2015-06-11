# Maintainer:  jyantis <yantis@yantis.net>

pkgbase=python-geocoder
pkgname=('python-geocoder' 'python2-geocoder')
pkgver=1.1.3
pkgrel=3
arch=('any')
url='https://pypi.python.org/pypi/geocoder'
license=('custom')
source=("https://pypi.python.org/packages/source/g/geocoder/geocoder-${pkgver}.zip")
md5sums=('c81e8a5d4516822802523f5de242c0cb')
makedepends=( 'python-setuptools'
             'python2-setuptools'
             'flake8'
             'python2-flake8'
             'python-nose'
             'python2-nose'
             'python-tox'
             'python2-tox'
             'python-requests'
             'python2-requests'
             'python-ratelim-git'
             'python2-ratelim-git')

build() {
  cd geocoder-${pkgver}

  python setup.py build
  python2 setup.py build
}

package_python-geocoder() {
  pkgdesc='A pure Python 3 Geocoding module made easy. Supports ArcGIS, Bing,CanadaPost,FreeGeoIP Geocoder.ca, Geonames, Google, HERE, MapQuest, MaxMind, OpenCage, OpenStreetMap, GeoOttawa, TomTom, Yahoo )'
  depends=('python' 'python-requests' 'python-ratelim-git')
  provides=('python-geocoder-git')
  conflicts=('python-geocoder-git')

  cd geocoder-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1

  # rename file that exists in both
  mv "${pkgdir}"/usr/bin/geocode{,-py3}
}

package_python2-geocoder() {
  pkgdesc='A pure Python 2 Geocoding module made easy. Supports ArcGIS, Bing,CanadaPost,FreeGeoIP Geocoder.ca, Geonames, Google, HERE, MapQuest, MaxMind, OpenCage, OpenStreetMap, GeoOttawa, TomTom, Yahoo )'
  depends=('python2' 'python2-requests' 'python2-ratelim-git')
  provides=('python2-geocoder-git')
  conflicts=('python2-geocoder-git')

  cd geocoder-${pkgver}

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
