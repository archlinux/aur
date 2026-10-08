# Maintainer: Christian Pfeiffer <cpfeiffer+aur at rev-crew dot info>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=crossplane-gixy
_projectname=crossplane
pkgver=0.5.16
pkgrel=2
pkgdesc="Reliable and fast NGINX configuration file parser"
arch=('any')
url="https://github.com/dvershinin/crossplane"
license=('Apache-2.0')
depends=('python' 'python-simplejson')
makedepends=('python-setuptools')
checkdepends=('python-tox' 'pypy3')
provides=('crossplane')
conflicts=('crossplane')
options=('!debug')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dvershinin/$_projectname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c0037122835d0e1eead275abcc416f688986fd7028ce4a918fc28f81ff6b27da')

prepare() {
  cd "$srcdir/$_projectname-$pkgver" || exit
  sed -i 's/^envlist.*/envlist = python, pypy/' tox.ini
}

build() {
  cd "$srcdir/$_projectname-$pkgver" || exit
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_projectname-$pkgver" || exit
  python -m tox
}

package() {
  cd "$srcdir/$_projectname-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p "$pkgdir"/usr/share/{doc/"$_projectname",licenses/"$_projectname"}
  install -Dm644 AUTHORS.rst README.md "$pkgdir/usr/share/doc/$_projectname"
  install -Dm644 LICENSE NOTICE "$pkgdir/usr/share/licenses/$_projectname"
}
