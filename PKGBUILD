# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-htpasswd-git
pkgver=.r31.ef677a5
pkgrel=1
pkgdesc='Python 3 Library for working with htpasswd user (only basic authorization) and group files'
arch=('any')
url='https://github.com/thesharp/htpasswd'
license=('custom')
depends=('python' 'python-future')
source=('git+https://github.com/thesharp/htpasswd.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-htpasswd')
conflicts=('python-htpasswd')

pkgver() {
  cd htpasswd
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
  cd htpasswd
  python setup.py build
}

check() {
  cd htpasswd
  python setup.py test --verbose
}

package() {
  cd htpasswd

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
