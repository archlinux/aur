# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-internetarchive-git
pkgver=0.8.3.r682.1c1e482
pkgrel=2
pkgdesc='A Python 2 wrapper for the various Internet Archive APIs (IA-S3, Metadata API, etc)'
arch=('any')
url='https://github.com/jjjake/ia-wrapper'
license=('AGPL3')
depends=('python2'
         'python2-setuptools'
         'python2-clint'
         'python2-six'
         'python2-yaml'
         'python2-requests'
         'python2-jsonpatch'
         'python2-pytest'
         'python2-docopt'
         'python2-args'
         'python2-jsonpointer'
        )
optdepends=('python2-ujson: faster json parsing'
            'python2-gevent: concurrent downloads'
            'cython2: speedups')
source=('git+https://github.com/jjjake/ia-wrapper.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('python2-internetarchive')
conflicts=('python2-internetarchive' 'python-internetarchive-git')

pkgver() {
  cd ia-wrapper
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
  cd ia-wrapper

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  # Patch requirments.txt from == to >=
  sed -i 's/==/>=/g' setup.py

  python2 setup.py build
}

check() {
  cd ia-wrapper
  python2 setup.py test --verbose
}

package() {
  cd ia-wrapper

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
