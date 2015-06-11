# Maintainer: jyantis <yantis@yantis.net>

pkgname=python2-trezor-git
pkgver=0.6.5.r478.d8f3a47
_gitname=python-trezor
pkgrel=2
pkgdesc="Python library for communicating with TREZOR Bitcoin Hardware Wallet"
arch=('any')
url='https://github.com/trezor/python-trezor'
license=('GPL')
depends=('python2'
         'cython2'
         'protobuf'
         'python2-protobuf'
         'python2-mnemonic-git'
         'python2-cython-hidapi-git')
source=('git://github.com/trezor/python-trezor.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('python2-trezor')
conflicts=('python2-trezor')

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

  # patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

package() {
  cd ${_gitname}
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
