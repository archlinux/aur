# Maintainer: jyantis <yantis@yantis.net>

pkgname=python-cython-hidapi-git
pkgver=0.7.99.5.r58.78722d3
_gitname=cython-hidapi
pkgrel=2
pkgdesc="A Cython interface to the HIDAPI from https://github.com/signal11/hidapi for Python 3"
arch=('i686' 'x86_64')
url='https://github.com/trezor/cython-hidapi'
license=('GPL')
depends=('python' 'libusb' 'python-setuptools' 'cython')
source=('git+https://github.com/trezor/cython-hidapi.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('python-cython-hidapi')
conflicts=('python-cython-hidapi')

pkgver() {
  cd ${_gitname}
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
    cd ${_gitname}
    git submodule init
    git submodule update
    python setup.py build
}

package() {
    cd ${_gitname}
    python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
