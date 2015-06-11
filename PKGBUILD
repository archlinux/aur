# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-gnumpy-git
pkgver=0.3dev.0.2.r1.gde735a9
pkgrel=1
pkgdesc='Gnumpy is a simple Python 2 module that interfaces in a way almost identical to numpy, but does its computations on your computers GPU'
arch=('any')
url='https://github.com/dnouri/gnumpy'
license=('custom')
depends=('python2')
source=('git+https://github.com/dnouri/gnumpy.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-gnumpy' 'python2-npmat')
conflicts=('python2-gnumpy' 'python2-npmat')
optdepends=('python2-cudamat-git: Use GPU instead of CPU')

pkgver() {
  cd gnumpy
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
  cd gnumpy

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

check() {
  cd gnumpy
  python2 setup.py test --verbose
}

package() {
  cd gnumpy

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
