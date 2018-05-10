# Maintainer: Florian B. <gn0mish@protonmail.com>

pkgbase=python-geocoder
_pyname='geocoder'
pkgname=('python-geocoder' 'python2-geocoder')
pkgver=1.38.1
pkgrel=4
pkgdesc='A pure Python Geocoding module made easy. Supports ArcGIS, Bing,CanadaPost,FreeGeoIP Geocoder.ca, Geonames, Google, HERE, MapQuest, MaxMind, OpenCage, OpenStreetMap, GeoOttawa, TomTom, Yahoo )'
arch=('any')
url='https://github.com/DenisCarriere/geocoder'
license=('custom')
source=("https://github.com/DenisCarriere/geocoder/archive/master.zip")
md5sums=('633a52784503a40a2b3f810da358a2e5')
makedepends=('python' 'python-setuptools'
             'python2' 'python2-setuptools')

build() {
  cd ${_pyname}
  python setup.py build
  python2 setup.py build
}

package_python-geocoder() {
  depends=('flake8' 'python-nose' 'python-tox' 'python-requests' 'python-ratelim-git')
  provides=('python-geocoder-git')
  conflicts=('python-geocoder-git')
  cd ${_pyname}
  python setup.py install --root="${pkgdir}" --optimize=1
  # rename file that exists in both
  mv "${pkgdir}"/usr/bin/geocode{,-py3}
}

package_python2-geocoder() {
  depends=('python2-flake8' 'python2-nose' 'python2-tox' 'python2-requests' 'python2-ratelim-git')
  provides=('python2-geocoder-git')
  conflicts=('python2-geocoder-git')
  cd ${_pyname}
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
