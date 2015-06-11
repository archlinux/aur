# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-nolearn-git
pkgver=0.6adev.0.5.r99.gfbf6f40
pkgrel=2
pkgdesc='Contains a number of wrappers around existing neural network libraries, along with a few machine learning utility modules. Most functionality is written to be compatible with the the excellent scikit-learn library.'
arch=('any')
url='https://github.com/dnouri/nolearn'
license=('MIT')
depends=('python2'
         'python2-docopt'
         'python2-gdbn'
         'python2-joblib'
         'python2-scikit-learn'
        )
source=('git+https://github.com/dnouri/nolearn.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-nolearn')
conflicts=('python2-nolearn')

pkgver() {
  cd nolearn
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
  cd nolearn

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

check() {
  cd nolearn
  python2 setup.py test --verbose
}

package() {
  cd nolearn

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
