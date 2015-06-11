# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-internetarchive-git
pkgver=0.8.3.r682.1c1e482
pkgrel=2
pkgdesc='A Python 3 wrapper for the various Internet Archive APIs (IA-S3, Metadata API, etc)'
arch=('any')
url='https://github.com/jjjake/ia-wrapper'
license=('AGPL3')
depends=('python'
         'python-setuptools'
         'python-clint'
         'python-six'
         'python-yaml'
         'python-requests'
         'python-jsonpatch'
         'python-pytest'
         'python-docopt'
         'python-jsonpointer'
         'python-args-git'
        )
optdepends=('python-ujson: faster json parsing'
            'python-gevent: concurrent downloads'
            'cython: speedups')
source=('git+https://github.com/jjjake/ia-wrapper.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('python-internetarchive')
conflicts=('python-internetarchive' 'python2-internetarchive-git')

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

  # Patch requirments.txt from == to >=
  sed -i 's/==/>=/g' setup.py

  python setup.py build
}

check() {
  cd ia-wrapper
  python setup.py test --verbose
}

package() {
  cd ia-wrapper

  # We don't need anything related to git in the package
  rm -rf .git* 

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
