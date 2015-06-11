# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-colorama-git
pkgver=0.3.3.r116.97e2635
pkgrel=2
pkgdesc='Simple cross-plaform colored terminal text in Python 3'
arch=('any')
url='https://github.com/tartley/colorama'
license=('BSD')
depends=('python' 'python-setuptools' 'python-mock')
source=('git+https://github.com/tartley/colorama.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('python-colorama')
conflicts=('python-colorama')

pkgver() {
  cd colorama
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  if [ -f "colorama/__init__.py" ]; then
      printf "%s.%s" "$(grep -R "__version__ =" colorama/__init__.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
  else
    printf "%s" $_gitversion
  fi
}

build() {
  cd colorama
  python setup.py build
}

check() {
  cd colorama
  python setup.py test --verbose
}

package() {
  cd colorama

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
