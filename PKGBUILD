# Maintainer: jyantis <yantis@yantis.net>

pkgname=python2-mnemonic-git
pkgver=0.12.r116.648f972
_gitname=python-mnemonic
pkgrel=2
pkgdesc="Python 2 library for Mnemonic code for generating deterministic keys (Implementation of Bitcoin BIP-0039)"
arch=('any')
url='https://github.com/trezor/python-mnemonic'
license=('GPL')
depends=('python2'
         'python2-pbkdf2')
source=('git+https://github.com/trezor/python-mnemonic.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('python2-mnemonic')
conflicts=('python2-mnemonic')

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

check() {
  cd ${_gitname}
  python2 setup.py test --verbose
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
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
