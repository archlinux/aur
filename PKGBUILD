# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-anyascii
_name=${pkgname#python-}
pkgver=0.3.2
pkgrel=2
pkgdesc='Unicode to ASCII transliteration'
arch=('any')
url=https://anyascii.com/
license=('ISC')
depends=('python')
makedepends=('git' 'python-build' 'python-flit-core' 'python-installer')
checkdepends=('python-pytest')
source=("git+https://github.com/$_name/$_name.git#tag=$pkgver")
b2sums=('76bd68cfd817592750f686767d5b3426848f688b172520e6a4bb289987ccd480bc26504d36dfef0063580b2012a528091548236795f6476adbe68f8f20533b57')

build() {
  cd "$_name"/impl/python
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"/impl/python
  python -m pytest
}

package() {
  cd "$_name"/impl/python
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
