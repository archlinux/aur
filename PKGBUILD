# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=python-endpoints
pkgver=5.0.1
pkgrel=1
pkgdesc="Lightweight REST API framework"
arch=('any')
url="https://github.com/jaymon/endpoints"
license=('MIT')
depends=('python-decorators' 'python-datatypes')
makedepends=('python-setuptools')
optdepends=('python-jinja' 'python-tornado' 'python-websockets')
# checkdepends=(
#   'python-jinja'
#   'python-requests'
#   'python-tornado'
#   'python-testdata'
#   'python-websockets')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/e/endpoints/endpoints-$pkgver.tar.gz"
        '001-setup.py.patch')
sha256sums=('a251b9662b40a063907d627d7c66e76a12034ee424ddf64aed2a15441b5e105b'
            'a2d153ce864bada83622dd4ff8b7f7c83a04ba84c7cc8cf83707e4a420f27e23')

prepare() {
  ## setup.py installs tests directory; remove it
  patch -p1 -d "endpoints-$pkgver" < 001-setup.py.patch
}

build() {
  cd "endpoints-$pkgver"
  python setup.py build
}

## tests require a Vagrant and pyenv environment
# check() {
#   cd "endpoints-$pkgver"
#   python -m unittest
# }

package() {
  export PYTHONHASHSEED=0     ## reproducibility
  cd "endpoints-$pkgver"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
