# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor:  Chris Severance aur.severach aATt spamgourmet dott com

_name=pathspec
pkgname=python38-pathspec
pkgver=0.10.2
pkgrel=1
pkgdesc='Utility library for gitignore style pattern matching of file paths'
arch=('any')
url=https://github.com/cpburnz/python-pathspec
license=('MPL2')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools' 'python38-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8f6bf73e5758fd365ef5d58ce09ac7c27d2833a8d7da51712eac6e27e35141b0')
b2sums=('10087659e7c5bc72b9de9b073282f7fadb081cc2bbe028abe802de8d06e287a77b55f621356b1f8873dfbf7dd0ee0c47ee217f00d6c40c2f20680615dfb6bda9')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  python3.8 -m unittest discover pathspec/tests
}

package() {
  cd $_name-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

check() {
 cd $_name-$pkgver
  python3.8 -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m unittest discover tests
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
