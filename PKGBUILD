# Maintainer:  jyantis <yantis@yantis.net>

pkgbase=python-ratelim-git
pkgname=('python-ratelim-git' 'python2-ratelim-git')
pkgver=0.1.6.r15.e75c81c
pkgrel=2
arch=('any')
url='https://github.com/themiurgo/ratelim'
license=('MIT')
source=('git+https://github.com/themiurgo/ratelim.git')
sha256sums=('SKIP')
makedepends=('git'
             'python-setuptools'
             'python2-setuptools'
             'python'
             'python2'
             'python-decorator'
             'python2-decorator')

pkgver() {
  cd ratelim
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

package_python-ratelim-git() {
  pkgdesc='Ratelim is a simple Python 3 library that limits the number of times a function can be called during a time interval. It is particularly useful when using online APIs, which commonly enforce rate limits.'
  depends=('python' 'python-decorator')
  provides=('python-ratelim')
  conflicts=('python-ratelim')

  cd ratelim

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

package_python2-ratelim-git() {
  pkgdesc='Ratelim is a simple Python 2 library that limits the number of times a function can be called during a time interval. It is particularly useful when using online APIs, which commonly enforce rate limits.'
  depends=('python2' 'python2-decorator')
  provides=('python2-ratelim')
  conflicts=('python2-ratelim')

  cd ratelim

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
