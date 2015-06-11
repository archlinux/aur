# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-verhulst-git
pkgver=0.1.0.r15.6d27c3c
pkgrel=2
pkgdesc='Python 3 library for evaluating binary logistic regressions fitted with scikit-learn. Statistical analysis and plotting routines to evaluate binary logistic regressions'
arch=('any')
url='https://github.com/rpetchler/verhulst'
license=('MIT')
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib')
source=('git+https://github.com/rpetchler/verhulst.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-verhulst')
conflicts=('python-verhulst')

pkgver() {
  cd verhulst
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  if [ -f "verhulst/__init__.py" ]; then
      printf "%s.%s" "$(grep -R "__version__ =" verhulst/__init__.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
  else
    printf "%s" $_gitversion
  fi
}

build() {
  cd verhulst
  python setup.py build
}

check() {
  cd verhulst
  python setup.py test --verbose
}

package() {
  cd verhulst

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
