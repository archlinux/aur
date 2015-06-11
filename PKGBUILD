# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-cytoolz-git
pkgver=0.7.4dev.r172.c9f6b06
pkgrel=2
pkgdesc='Cython implementation of Toolz for Python 3. High performance functional utilities.'
arch=('any')
url='http://github.com/pytoolz/cytoolz'
license=('BSD')
depends=('python')
source=('git+http://github.com/pytoolz/cytoolz.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools'  'cython' 'python-nose')
provides=('python-cytoolz')
conflicts=('python-cytoolz')

pkgver() {
  cd cytoolz
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  if [ -f "cytoolz/_version.py" ]; then
      printf "%s.%s" "$(grep -R "__version__ =" cytoolz/_version.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
  else
    printf "%s" $_gitversion
  fi
}
build() {
  cd cytoolz

  python setup.py build
}

package() {
  cd cytoolz

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
