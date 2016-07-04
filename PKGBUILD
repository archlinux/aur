# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics-git
pkgver=1.0.dev.1865.g7fd4b44
pkgrel=1
arch=('any')
pkgdesc='General-purpose online computer algebra system featuring Mathematica-compatible syntax and functions'
url='http://www.mathics.org/'
license=('GPL3')
depends=('python2-dateutil' 'python2-ply>=3.4' 'python2-six' 'python2-sympy>=0.7.3' 'python2-django>=1.6' 'python2-colorama' 'python2-argparse' 'python2-interruptingcow')
conflicts=('mathics')
provides=('mathics')
makedepends=('python2-setuptools' 'git')
optdepends=('cython2: cython optimisations')
source=("mathics::git+https://github.com/mathics/Mathics.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf 1.0.dev%s $(git describe --always|sed 's/-/./g'|cut -c5-)
}

prepare() {
  cd "${pkgname%-git}"
  # mathics supports sympy==0.7.6 but works (with minor errors) for >=0.7.6
  sed -i 's/sympy==0.7.6/sympy>=0.7.3/' setup.py
  sed -i '66s/django >= 1.8, < 1.9/django/' setup.py
  find . -name "*.py" -exec sed -i '1s+python+python2+' {} \;
}

build() {
  cd "${pkgname%-git}"
  python2 setup.py build 
}

package() {
  cd "${pkgname%-git}"
  python2 setup.py install --root=${pkgdir}
}
