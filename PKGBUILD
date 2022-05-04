# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-editables
_name=${pkgname#python-}
pkgver=0.3
pkgrel=1
pkgdesc="A Python library for creating 'editable wheels'"
arch=('any')
url="https://github.com/pfmoore/editables"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('167524e377358ed1f1374e61c268f0d7a4bf7dbd046c656f7b410cde16161b1a')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # symlink license to proper directory
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "${site_packages}/$_name-$pkgver.dist-info/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
