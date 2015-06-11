# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-bidict-git
pkgver=0.3.2.dev.r30.f6fc702
_gitname=bidict
pkgrel=2
pkgdesc='Provides a bidirectional mapping data structure and related functionality to naturally work with one-to-one relations in Python 2'
arch=('any')
url='https://bidict.readthedocs.org/en/latest'
license=('ISC')
depends=('python2')
source=('git+https://github.com/jab/bidict.git'
        'http://opensource.org/licenses/isc-license')
sha256sums=('SKIP'
            'SKIP')
makedepends=('git')
provides=('python2-bidict')
conflicts=('python2-bidict')

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

    # patch any #!/usr/bin/python to #!/usr/bin/python2
    for file in $(find . -name '*.py' -print); do
      sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
      sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
    done

    python2 setup.py build
}

check() {
  cd "$_gitname"
  python2 setup.py test --verbose
}

package() {
    install -D -m644 isc-license "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"

    cd ${_gitname}
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
