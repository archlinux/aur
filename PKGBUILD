# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Shane Stone <shanewstone at gmail>

pkgname=proselint
pkgver=0.10.2
pkgrel=7
pkgdesc='A linter for prose'
arch=('any')
url="https://github.com/amperser/proselint"
license=('BSD')
depends=('python-click' 'python-future' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-nose' 'python-pytest')
conflicts=('python-proselint')
replaces=('python-proselint')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('706c51c7b4546b9a0b448df42e1dc756a29c7f06b0118254c2171c183048c52b029f9d581a43fb284f54f6f999376ca5bd0ff742b241475d16604b57098be169')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  mkdir -p temp
  local sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  python setup.py install --skip-build --root=temp
  PATH="$PWD/temp/usr/bin:$PATH" PYTHONPATH="$PWD/temp/$sitepackages" pytest
}

package() {
  cd $pkgname-$pkgver
  export PYTHONHASHSEED=0
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
