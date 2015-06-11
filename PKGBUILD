# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-bidict-git
pkgver=0.3.2.dev.r30.f6fc702
_gitname=bidict
pkgrel=2
pkgdesc='Provides a bidirectional mapping data structure and related functionality to naturally work with one-to-one relations in Python 3'
arch=('any')
url='https://bidict.readthedocs.org/en/latest'
license=('ISC')
depends=('python')
source=('git+https://github.com/jab/bidict.git'
        'http://opensource.org/licenses/isc-license')
sha256sums=('SKIP'
            'SKIP')
makedepends=('git')
provides=('python-bidict')
conflicts=('python-bidict')

pkgver() {
  cd "$_gitname"
  set -o pipefail

  _gitversion=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

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
    cd ${_gitname}
    python2 setup.py build
}

check() {
  cd ${_gitname}
  python setup.py test --verbose
}

package() {
    install -D -m644 isc-license "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"

    cd ${_gitname}
    python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
