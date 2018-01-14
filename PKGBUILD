# Maintainer:  jyantis <yantis@yantis.net>

pkgbase=python-blue-loader-git
pkgname=('python-blue-loader-git' 'python2-blue-loader-git')
pkgver=0.1.16.0.1.16.r0.g9914b37
pkgrel=1
arch=('any')
url='https://github.com/LedgerHQ/blue-loader'
license=('custom')
source=('git+https://github.com/LedgerHQ/blue-loader-python.git')
sha256sums=('SKIP')
makedepends=('git'
             'python'
             'python2'
             'python-setuptools'
             'python2-setuptools')

pkgver() {
  cd blue-loader-python
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
  cd blue-loader-python
  python setup.py build
  python2 setup.py build
}

package_python-blue-loader-git() {
  pkgdesc='Python tools for Ledger Blue and Nano S for PYthon 3'
  depends=('python'
           'python-hidapi'
           'python-protobuf'
           'python-crypto'
           'python-ecpy-git'
           'python-future')
  provides=('python-blue-loader')
  conflicts=('python-blue-loader')

  cd blue-loader-python

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

package_python2-blue-loader-git() {
  pkgdesc='Python tools for Ledger Blue and Nano S for Python 2'
  depends=('python2'
           'python2-hidapi'
           'python2-protobuf'
           'python2-crypto'
           'python2-ecpy-git'
           'python2-future')
  provides=('python2-blue-loader')
  conflicts=('python2-blue-loader')

  cd blue-loader-python

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}


# vim:set ts=2 sw=2 et:
