# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-cytoolz-git
pkgver=0.7.4dev.r172.c9f6b06
pkgrel=2
pkgdesc='Cython implementation of Toolz for Python 2. High performance functional utilities.'
arch=('any')
url='http://github.com/pytoolz/cytoolz'
license=('BSD')
depends=('python2')
source=('git+http://github.com/pytoolz/cytoolz.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools'  'cython2' 'python2-nose')
provides=('python2-cytoolz')
conflicts=('python2-cytoolz')

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

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

package() {
  cd cytoolz

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
