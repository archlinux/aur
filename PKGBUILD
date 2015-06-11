# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-monary-hg
pkgver=0.3.0.r69.efc4072b9b7f
pkgrel=1
pkgdesc='Perform high-performance column queries from MongoDB for Python 3. 10x speedup over pymongo alone.'
arch=('x86_64')
url='https://bitbucket.org/djcbeach/monary'
license=('apache')
depends=('python' 'python-pymongo' 'python-numpy')
source=('hg+https://bitbucket.org/djcbeach/monary')
sha256sums=('SKIP')
makedepends=('mercurial' 'python-setuptools')
provides=('python-monary')
conflicts=('python-monary')

pkgver() {
  cd monary
  # printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
  _hgversion=$(printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)")

  # If there is a setup.py then pull the version tag from the file
  if [ -f "setup.py" ]; then
    if grep --quiet "VERSION = " setup.py; then
      printf "%s.%s" "$(grep -R "VERSION = " setup.py | awk -F\" '{print $2}')" $_hgversion | sed 's/-/./g'
    else
      printf "%s" $_hgversion
    fi
  else
    printf "%s" $_hgversion
  fi
}

build() {
  cd monary
  python setup.py build
}

check() {
  cd monary
  python setup.py test --verbose
}

package() {
  cd monary

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
