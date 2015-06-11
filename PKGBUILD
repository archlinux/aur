# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-args-git
pkgver=0.1.0.r37.36c727b
pkgrel=1
pkgdesc='Argument parsing for Humans for Python 3'
arch=('any')
url='https://github.com/kennethreitz/args'
license=('BSD')
depends=('python' 'python-setuptools' 'python-nose')
source=('git+https://github.com/kennethreitz/args.git')
sha256sums=('SKIP')
makedepends=('git')
conflicts=('python-args')
provides=('python-args')

pkgver() {
  cd args
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
  cd args
  python setup.py build
}

check() {
  cd args
  python setup.py test --verbose
}

package() {
  cd args

  # We don't need anything related to git in the package
  rm -rf .git* 

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
