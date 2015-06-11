# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-rainbow-logging-handler-git
pkgver=2.2.2.r2.gd2d8a88
pkgrel=2
pkgdesc='Ultimate Python 3 colorized logger with user-custom colors'
arch=('any')
url='https://github.com/laysakura/rainbow_logging_handler'
license=('Public Domain')
depends=('python')
source=('git+https://github.com/laysakura/rainbow_logging_handler.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-rainbow-logging-handler')
conflicts=('python-rainbow-logging-handler')

build() {
    cd $srcdir/rainbow_logging_handler-2.2.2
    python setup.py build
}

package() {
    cd $srcdir/rainbow_logging_handler-2.2.2
    python setup.py install --root="$pkgdir" --optimize=1 
}


pkgver() {
  cd rainbow_logging_handler
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
  cd rainbow_logging_handler

  python setup.py build
}

# Checks fail on python 3
# check() {
#   cd rainbow_logging_handler
#   python setup.py test --verbose
# }

package() {
  cd rainbow_logging_handler

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
