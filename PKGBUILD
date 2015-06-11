# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-chess-git
pkgver=0.8.1.r967.0570f91
pkgrel=2
pkgdesc='A pure Python 2 chess library with move generation and validation and handling of common formats'
arch=('any')
url='https://github.com/niklasf/python-chess'
license=('GPL3')
depends=('python2')
source=('git+https://github.com/niklasf/python-chess.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-python-chess')
conflicts=('python-python-chess')
optdepends=('python2-gmpy: Slight speed boost on basic operations')

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

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

check() {
  cd python-chess
  python2 setup.py test --verbose
}

package() {
  cd python-chess

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
