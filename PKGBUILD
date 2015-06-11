# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-pymarc-git
pkgver=3.0.3.r283.9e77090
pkgrel=2
pkgdesc='A Python 3 library for working with bibliographic data encoded in MARC21'
arch=('any')
url='https://github.com/edsu/pymarc'
license=('BSD')
depends=('python' 'python-six')
source=('git+https://github.com/edsu/pymarc.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-pymarc')
conflicts=('python-pymarc')

pkgver() {
  cd pymarc
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
  cd pymarc
  python setup.py build
}

check() {
  cd pymarc
  python setup.py test --verbose
}

package() {
  cd pymarc

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
