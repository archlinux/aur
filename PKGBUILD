# Maintainer:  jyantis <yantis@yantis.net>
pkgname=python-sh-git
pkgver=1.11.r708.7a4e296
pkgrel=2
pkgdesc='A full-fledged subprocess interface for Python 3 that allows you to call any program as if it were a function'
arch=('any')
url='https://github.com/amoffat/sh'
license=('MIT')
depends=('python')
source=("git+https://github.com/amoffat/sh")
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-sh')
conflicts=('python-sh')

pkgver() {
  cd sh
  printf "%s.r%s.%s" "${_version}"  "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver() {
  cd sh
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  if [ -f "sh.py" ]; then
      printf "%s.%s" "$(grep -R "__version__ =" sh.py | awk -F\" '{print $2}')" $_gitversion | sed 's/-/./g'
  else
    printf "%s" $_gitversion
  fi
}
build() {
  cd sh
  python setup.py build
}

package() {
  cd sh

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
