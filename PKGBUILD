# Maintainer:  jyantis <yantis@yantis.net>

# More Info
# http://issamlaradji.blogspot.com/2014/06/week-3-gsoc-2014-extending-neural.html

pkgname=python2-scikit-learn-mlp-git
pkgver=0.17.dev0.0.4.r17943.g98ca513
pkgrel=2
pkgdesc='A set of python modules for machine learning and data mining. This version has MultilayerPerceptronClassifier support'
arch=('any')
url='https://github.com/scikit-learn/scikit-learn'
license=('BSD')
depends=('python2' 'python2-scipy')
source=('git+https://github.com/scikit-learn/scikit-learn.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools' 'cython2')
provides=('python2-scikit-learn' 'python2-scikit-learn-git')
conflicts=('python2-scikit-learn' 'python2-scikit-learn-git')

pkgver() {
  cd scikit-learn
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  if [ -f "sklearn/__init__.py" ]; then
    _version=("$(grep -R "__version__ =" sklearn/__init__.py | awk -F\' '{print $2}')")
    printf "%s.%s" $_version $_gitversion | sed 's/-/./g'
    _#version=echo $_version | sed 's/-git//g'
  else
    printf "%s" $_gitversion
  fi
}

build() {
  cd scikit-learn

  git fetch origin refs/pull/3204/head:mlp
  git checkout mlp

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  unset LDFLAGS
  python2 setup.py build
}

package() {
  cd scikit-learn

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
