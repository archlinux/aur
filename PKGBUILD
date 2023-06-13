# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=anyascii
pkgname=python-anyascii
pkgver=0.3.2
pkgrel=1
pkgdesc='Unicode to ASCII transliteration'
arch=('any')
url=https://anyascii.com/
license=('ISC')
depends=('python')
makedepends=('python-build' 'python-flit-core' 'python-installer')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9d5d32ef844fe225b8bc7cba7f950534fae4da27a9bf3a6bea2cb0ea46ce4730')
b2sums=('6e267b3b8bf9d5db3f66c1a55d73ad080d0b2e29ea7862b27387adae0fe5b79e518ff3286be805e8472c8275d2e7bda3998eebf2a04c86abbc584aa7a4735424')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  python -m pytest
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
