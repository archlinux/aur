# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-rainbow-logging-handler-git
pkgver=2.2.2.r2.gd2d8a88
pkgrel=2
pkgdesc='Ultimate Python 2 colorized logger with user-custom colors'
arch=('any')
url='https://github.com/laysakura/rainbow_logging_handler'
license=('Public Domain')
depends=('python2')
source=('git+https://github.com/laysakura/rainbow_logging_handler.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-rainbow-logging-handler')
conflicts=('python2-rainbow-logging-handler')

build() {
    cd $srcdir/rainbow_logging_handler-2.2.2
    python2 setup.py build
}

package() {
    cd $srcdir/rainbow_logging_handler-2.2.2
    python2 setup.py install --root="$pkgdir" --optimize=1 
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

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

check() {
  cd rainbow_logging_handler
  python2 setup.py test --verbose
}

package() {
  cd rainbow_logging_handler

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
