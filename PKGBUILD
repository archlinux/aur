# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-monary-hg
pkgver=0.3.0.r69.efc4072b9b7f
pkgrel=1
pkgdesc='Perform high-performance column queries from MongoDB for Python 2. 10x speedup over pymongo alone.'
arch=('x86_64')
url='https://bitbucket.org/djcbeach/monary'
license=('apache')
depends=('python2' 'python2-pymongo' 'python2-numpy')
source=('hg+https://bitbucket.org/djcbeach/monary')
sha256sums=('SKIP')
makedepends=('mercurial' 'python2-setuptools')
provides=('python2-monary')
conflicts=('python2-monary')

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

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

check() {
  cd monary
  python2 setup.py test --verbose
}

package() {
  cd monary

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
