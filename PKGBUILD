# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-termcolor-git
pkgver=1.1.0r4.cd49afc
pkgrel=1
pkgdesc='Termcolor Python 3 Library (improved fork)'
arch=('any')
url='https://github.com/edmund-huber/termcolor'
license=('MIT')
depends=('python' 'python-setuptools')
source=('git+https://github.com/edmund-huber/termcolor.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('python-termcolor')
conflicts=('python-termcolor')

pkgver() {
  cd termcolor

  printf "%s" "$(grep -R "Version: " PKG-INFO | awk '/Version/{i++}i==2' |awk -F: '{print $2}' | tr -d ' ' )"

  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd termcolor

  python setup.py build
}

package() {
  cd termcolor

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
