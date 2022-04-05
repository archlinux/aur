# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-single-version
_name=${pkgname#python-}
pkgver=1.5.1
pkgrel=2
pkgdesc="Small utility to define version string for Poetry-style Python project"
arch=('any')
url="https://github.com/hongquan/single-version"
license=('MIT')
depends=('python-first' 'python-importlib-metadata')
makedepends=('python-build' 'python-installer' 'python-poetry')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d0dee097581a4a9cdf1576075219369abedb67583449c6a0ae2c3f8100b9e903')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Move license to proper directory
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "${pkgdir}${site_packages}/single_version-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
