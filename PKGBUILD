# Maintainer:  jyantis <yantis@yantis.net>

pkgbase=python-geocoder-git
pkgname=('python-geocoder-git' 'python2-geocoder-git')
pkgver=geocoder.r507.a40d6af
pkgrel=2
arch=('any')
url='https://github.com/DenisCarriere/geocoder'
license=('MIT')
source=('git+https://github.com/DenisCarriere/geocoder.git')
sha256sums=('SKIP')
makedepends=('git'
             'python-setuptools'
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

pkgver() {
  cd geocoder
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  # If there is a setup.py then pull the version tag from the file
  if [ -f "setup.py" ]; then
    if grep --quiet "version = " setup.py; then
      printf "%s.%s" "$(grep -R "version = " setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
    elif grep --quiet "version=" setup.py; then
      printf "%s.%s" "$(grep -R "version=" setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
    else
      printf "%s" $_gitversion
    fi
  else
    printf "%s" $_gitversion
  fi
}

build() {
  cd geocoder

  python setup.py build
  python2 setup.py build
}


package_python-geocoder-git() {
  pkgdesc='A pure Python 3 Geocoding module made easy. Supports ArcGIS, Bing,CanadaPost,FreeGeoIP Geocoder.ca, Geonames, Google, HERE, MapQuest, MaxMind, OpenCage, OpenStreetMap, GeoOttawa, TomTom, Yahoo )'
  depends=('python' 'python-requests' 'python-ratelim-git')
  provides=('python-geocoder')
  conflicts=('python-geocoder')

  cd geocoder

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # rename file that exists in both
  mv "${pkgdir}"/usr/bin/geocode{,-py3}

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

package_python2-geocoder-git() {
  pkgdesc='A pure Python 2 Geocoding module made easy. Supports ArcGIS, Bing,CanadaPost,FreeGeoIP Geocoder.ca, Geonames, Google, HERE, MapQuest, MaxMind, OpenCage, OpenStreetMap, GeoOttawa, TomTom, Yahoo )'
  depends=('python2' 'python2-requests' 'python2-ratelim-git')
  provides=('python2-geocoder')
  conflicts=('python2-geocoder')

  cd geocoder

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}


# vim:set ts=2 sw=2 et:
