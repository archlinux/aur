# Maintainer:  jyantis <yantis@yantis.net>

pkgbase=python-ecpy-git
pkgname=('python-ecpy-git' 'python2-ecpy-git')
pkgver=0.8.0.r24.1d3bdd4
pkgrel=1
arch=('any')
url='https://github.com/ubinity/ECPy'
license=('custom')
source=('git+https://github.com/ubinity/ECPy.git')
sha256sums=('SKIP')
makedepends=('git'
             'python'
             'python2'
             'python-setuptools'
             'python2-setuptools')

pkgver() {
  cd ECPy
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
  cd ECPy
  python setup.py build
  python2 setup.py build
}

package_python-ecpy-git() {
  pkgdesc='Pure Python Elliptic Curve Library for Python 3'
  depends=('python' 'python-future')
  provides=('python-ecpy')
  conflicts=('python-ecpy')

  cd ECPy

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

package_python2-ecpy-git() {
  pkgdesc='Pure Python Elliptic Curve Library for Python 2'
  depends=('python2' 'python2-future')
  provides=('python2-ecpy')
  conflicts=('python2-ecpy')

  cd ECPy

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
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}


# vim:set ts=2 sw=2 et:
