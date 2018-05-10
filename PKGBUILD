# Maintainer: Florian B. <gn0mish@protonmail.com>

pkgbase=python-geocoder
_pyname='geocoder'
pkgname=('python-geocoder' 'python2-geocoder')
pkgver=1.38.1
pkgrel=4
pkgdesc='A pure Python Geocoding module made easy. Supports ArcGIS, Bing,CanadaPost,FreeGeoIP Geocoder.ca, Geonames, Google, HERE, MapQuest, MaxMind, OpenCage, OpenStreetMap, GeoOttawa, TomTom, Yahoo )'
arch=('any')
url='https://pypi.python.org/pypi/geocoder'
license=('custom')
source=("https://files.pythonhosted.org/packages/source/g/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('360f693a51f7ea4b4078f9ef96222ee8')
makedepends=('python' 'python-setuptools'
             'python2' 'python2-setuptools')

build() {
  cd ${_pyname}-${pkgver}
  python setup.py build
  python2 setup.py build
}

package_python-geocoder() {
  depends=('flake8' 'python-nose' 'python-tox' 'python-requests' 'python-ratelim-git')
  provides=('python-geocoder-git')
  conflicts=('python-geocoder-git')
  cd ${_pyname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
  # rename file that exists in both
  mv "${pkgdir}"/usr/bin/geocode{,-py3}
}

package_python2-geocoder() {
  depends=('python2-flake8' 'python2-nose' 'python2-tox' 'python2-requests' 'python2-ratelim-git')
  provides=('python2-geocoder-git')
  conflicts=('python2-geocoder-git')
  cd ${_pyname}-${pkgver}
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
