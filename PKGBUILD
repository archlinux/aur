# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-gdbn-git
pkgver=0.2dev.0.1.r1.g7b805fa
pkgrel=1
pkgdesc='This package contains Python 2 code for pre-trained deep neural networks. RBM pre-training is supported and backpropagation. There are a handful of possible unit types. For training, minibatched stochastic gradient descent is implemented.'
arch=('any')
url='https://github.com/dnouri/gdbn'
license=('MIT')
depends=('python2'
         'python2-gnumpy'
         'python2-npmat'
         )
source=('git+https://github.com/dnouri/gdbn.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-gdbn')
conflicts=('python2-gdbn')
optdepends=('python2-cudamat-git: Use GPU instead of CPU')

pkgver() {
  cd gdbn
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
  cd gdbn

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

check() {
  cd gdbn
  python2 setup.py test --verbose
}

package() {
  cd gdbn

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
}

# vim:set ts=2 sw=2 et:
