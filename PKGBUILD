# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-pylearn2-git
pkgver=0.1dev.r7042.8bd3cc2
pkgrel=2
pkgdesc='A machine learning library for Python 3 based on Theano'
arch=(x86_64)
url='https://github.com/lisa-lab/pylearn2'
license=('custom')
depends=('python' 'python-numpy' 'cython' 'python-yaml' 'python-theano' 'python-argparse')
source=('git+https://github.com/lisa-lab/pylearn2.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-pylearn2')
conflicts=('python-pylearn2' 'python2-pylearn2')

pkgver() {
  cd pylearn2
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
  cd pylearn2
  python setup.py build
}

check() {
  cd pylearn2
  python setup.py test --verbose
}

package() {
  cd pylearn2

  # We don't need anything related to git in the package
  rm -rf .git*

  # script tries to force develop mode - force install mode by echoing install to the script
  echo "install" | python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
