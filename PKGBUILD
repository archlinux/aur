# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-plac-git
pkgver=0.7.4.r2.bc10e66
pkgrel=1
pkgdesc='Command line parser for Python 2. Parsing the command line the easy way'
arch=('any')
url='https://github.com/kennethreitz-archive/plac'
license=('custom')
depends=('python2')
source=('git+https://github.com/kennethreitz-archive/plac.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-plac')
conflicts=('python-plac'  'python2-plac')

pkgver() {
  cd plac
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  if [ -f "plac.py" ]; then
      printf "%s.%s" "$(grep -R "__version__ =" plac.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
  else
    printf "%s" $_gitversion
  fi
}

build() {
  cd plac

  # Fix for setup.py bug
  cp README.rst README.txt

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

check() {
  cd plac
  python2 setup.py test --verbose
}

package() {
  cd plac

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Not sure of license so install readme as a license for now
  install -D -m644 README.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
