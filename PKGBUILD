# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-isbnlib-git
pkgver=3.5.6.r476.46f95b2
pkgrel=2
pkgdesc='Python 2 library to extract, clean, transform, hyphenate and get metadata for ISBN strings (based on isbntools)'
arch=('any')
url='https://github.com/xlcnd/isbnlib'
license=('LGPL')
depends=('python2')
source=('git+https://github.com/xlcnd/isbnlib.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-isbnlib')
conflicts=('python2-isbnlib')

pkgver() {
  cd isbnlib
  printf "%s." "$(grep -R "__version__ =" isbnlib/__init__.py | awk -F\' '{print $2}')"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd isbnlib

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

check() {
  cd isbnlib
  python2 setup.py test --verbose
}

package() {
  cd isbnlib

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE-LGPL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
