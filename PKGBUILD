# Maintainer:  jyantis <yantis@yantis.net>

pkgname=cwrap-git
pkgver=0.0.r88.5387ade
pkgrel=2
pkgver=0.0.r1489.c522f6d
pkgdesc='Automatical generate Cython wrappers from C & C++ header files'
arch=('any')
url='https://github.com/geggo/cwrap'
license=('custom')
depends=('python2' 'llvm-libs' 'clang')
source=('git+https://github.com/geggo/cwrap.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('cwrap')
conflicts=('cwrap')

pkgver() {
  cd cwrap
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
  cd cwrap

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}


package() {
  cd cwrap

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install Readme as license since no license.
  install -D -m644 README.rst  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
