# Maintainer: a821
# Contributor: lilydjwg <lilydjwg@gmail.com>

pkgname=python-http-parser-git
pkgver=0.9.0.r3.gd6ce4b5
epoch=1
pkgrel=1
pkgdesc="HTTP request/response parser for python in C"
arch=('x86_64' 'i686')
url="https://github.com/benoitc/http-parser"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools' 'cython')
checkdepends=('python-pytest')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
md5sums=(SKIP)
source=("${pkgname}::git+${url}")

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/.r/;s/-/./g'
}

build() {
  cd "$pkgname"
  cython -o http_parser/parser.c http_parser/parser.pyx
  python setup.py build
}

check() {
  cd "$pkgname"
  _pyver=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
  PYTHONPATH="$PWD/build/lib.linux-x86_64-cpython-$_pyver/" pytest testing
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
