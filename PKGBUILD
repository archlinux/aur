# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-termcolor-git
pkgver=1.1.0r4.cd49afc
pkgrel=1
pkgdesc='Termcolor Python 2 Library (improved fork)'
arch=('any')
url='https://github.com/edmund-huber/termcolor'
license=('MIT')
depends=('python2' 'python2-setuptools')
source=('git+https://github.com/edmund-huber/termcolor.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('python2-termcolor')
conflicts=('python2-termcolor')

pkgver() {
  cd termcolor

  printf "%s" "$(grep -R "Version: " PKG-INFO | awk '/Version/{i++}i==2' |awk -F: '{print $2}' | tr -d ' ' )"

  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd termcolor

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

package() {
  cd termcolor

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
