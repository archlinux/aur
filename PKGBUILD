# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-chess-git
pkgver=0.8.1.r967.0570f91
pkgrel=2
pkgdesc='A pure Python 3 chess library with move generation and validation and handling of common formats'
arch=('any')
url='https://github.com/niklasf/python-chess'
license=('GPL3')
depends=('python')
source=('git+https://github.com/niklasf/python-chess.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-python-chess')
conflicts=('python-python-chess' 'python2-python-chess')
optdepends=('python-gmpy: Slight speed boost on basic operations')

pkgver() {
  cd python-chess
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  if [ -f "chess/__init__.py" ]; then
    if grep --quiet "__version__" chess/__init__.py; then
      printf "%s.%s" "$(grep -R "__version__" chess/__init__.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
    fi
  else
    printf "%s" $_gitversion
  fi
}

pkgver() {
  cd python-chess
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  if [ -f "chess/__init__.py" ]; then
      printf "%s.%s" "$(grep -R "__version__ = " chess/__init__.py | awk -F\" '{print $2}')" $_gitversion | sed 's/-/./g'
  else
    printf "%s" $_gitversion
  fi
}


build() {
  cd python-chess
  python setup.py build
}

check() {
  cd python-chess
  python setup.py test --verbose
}

package() {
  cd python-chess

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
