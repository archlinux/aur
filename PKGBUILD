# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-orderedmultidict-git
pkgver=.r66.af36f63
pkgrel=1
pkgdesc='Python 2 Ordered Multivalue Dictionary'
arch=('any')
url='https://github.com/gruns/orderedmultidict'
license=('custom')
depends=('python')
source=('git+https://github.com/gruns/orderedmultidict.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-orderedmultidict')
conflicts=('python-orderedmultidict')

pkgver() {
  cd orderedmultidict
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
  cd orderedmultidict
  python setup.py build
}

# check() {
#   cd orderedmultidict
#   python setup.py test --verbose
# }

package() {
  cd orderedmultidict

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
