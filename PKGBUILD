# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-hyperopt-sklearn-git
pkgver=0.0.1.r95.12f854c
pkgrel=1
pkgdesc='Hyperparameter Optimization for sklearn (scikit-learn)'
arch=('any')
url='https://github.com/hyperopt/hyperopt-sklearn'
license=('BSD')
depends=('python2'
         'python2-hyperopt'
         'python2-numpy'
         'python2-scipy'
         'python2-nose'
         'python2-scikit-learn'
        )
source=('git+https://github.com/hyperopt/hyperopt-sklearn.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-hyperopt-sklearn')
conflicts=('python2-hyperopt-sklearn')

pkgver() {
  cd hyperopt-sklearn
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
  cd hyperopt-sklearn

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

check() {
  cd hyperopt-sklearn
  python2 setup.py test --verbose
}

package() {
  cd hyperopt-sklearn

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
