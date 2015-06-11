# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-skdata-git
pkgver=0.0.4.r441.3cfc359
pkgrel=2
pkgdesc='Skdata is a library of data sets for machine learning and statistics. This module provides standardized Python 2 access to toy problems as well as popular computer vision and natural language processing data sets'
arch=('any')
url='https://github.com/jaberg/skdata'
license=('custom')
depends=('python2'
         'python2-nose'
         'python2-scikit-learn'
         'python2-joblib'
         'python2-numpy'
         'python2-lockfile'
        )
source=('git+https://github.com/jaberg/skdata.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-skdata')
conflicts=('python2-skdata')

pkgver() {
  cd skdata
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  # If there is a setup.py then pull the version tag from the file
  if [ -f "setup.py" ]; then
    if grep --quiet "version = " setup.py; then
      printf "%s.%s" "$(grep -R "version = " setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
    elif grep --quiet "VERSION =" setup.py; then
      printf "%s.%s" "$(grep -R "VERSION =" setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
    else
      printf "%s" $_gitversion
    fi
  else
    printf "%s" $_gitversion
  fi
}

build() {
  cd skdata

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

check() {
  cd skdata
  python2 setup.py test --verbose
}

package() {
  cd skdata

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install Readme as license since no license 
  install -D -m644 README.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
}

# vim:set ts=2 sw=2 et:
