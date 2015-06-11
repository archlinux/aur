# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-theanets-git
pkgver=0.6.0pre.r1240.77b2e11
pkgrel=2
pkgdesc='A library of neural networks in Theano for Python 2'
arch=('any')
url='https://github.com/lmjohns3/theano-nets'
license=('custom')
depends=('python2'
         'python2-theano'
         'python2-climate'
         'python2-skdata')
source=('git+https://github.com/lmjohns3/theano-nets.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-theanets')
conflicts=('python2-theanets')

pkgver() {
  cd theano-nets
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
  cd theano-nets

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

check() {
  cd theano-nets
  python2 setup.py test --verbose
}

package() {
  cd theano-nets

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
