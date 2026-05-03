# Maintainer: Christian Pfeiffer <cpfeiffer+aur at rev-crew dot info>

pkgname=crossplane-gixy
_projectname=crossplane
pkgver=0.5.16
pkgrel=1
pkgdesc="Reliable and fast NGINX configuration file parser"
arch=('any')
url="https://github.com/dvershinin/crossplane"
license=('Apache-2.0')
depends=('python' 'python-pkg_resources' 'python-simplejson' 'python-importlib-metadata')
makedepends=('python-setuptools')
checkdepends=('python-tox' 'pypy')
provides=('crossplane')
conflicts=('crossplane')
options=('!debug')

source=("https://github.com/dvershinin/$_projectname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c0037122835d0e1eead275abcc416f688986fd7028ce4a918fc28f81ff6b27da')

prepare() {
  cd "$srcdir/$_projectname-$pkgver"
  sed -i 's/^envlist.*/envlist = python, pypy/' tox.ini
}

build() {
  cd "$srcdir/$_projectname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_projectname-$pkgver"
  python -m tox
}

package() {
  cd "$srcdir/$_projectname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p "$pkgdir"/usr/share/{doc/"$_projectname",licenses/"$_projectname"}
  install -Dm644 AUTHORS.rst  README.md "$pkgdir/usr/share/doc/$_projectname"
  install -Dm644 LICENSE NOTICE "$pkgdir/usr/share/licenses/$_projectname"
}
