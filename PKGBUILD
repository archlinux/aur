# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-pybitcointools-git
pkgver=1.1.28.r209.6efa55b
pkgrel=2
pkgdesc='Python Bitcoin Tools - Simple, common-sense Bitcoin-themed Python ECC library for Python 2'
arch=('any')
url='https://github.com/vbuterin/pybitcointools'
license=('MIT')
depends=('python2'
         'python2-setuptools'
         'python2-socks'
         'python2-pyasn1'
         'python2-pyasn1-modules'
         'python2-tlslite')
source=('git+https://github.com/vbuterin/pybitcointools.git')
sha256sums=('SKIP')
makedepends=('git')
optdepends=('electrum: Electrum wallet support')
provides=('python2-pybitcointools')
conflicts=('python2-pybitcointools python2-bitcoinlib-git')

pkgver() {
  cd pybitcointools
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
  cd pybitcointools

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

package() {
  cd pybitcointools

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
}

# vim:set ts=2 sw=2 et:
