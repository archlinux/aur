# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=backcall
pkgname=python38-backcall
pkgver=0.2.0
pkgrel=7
pkgdesc='Backwards compatible callback APIs'
arch=('any')
url=https://github.com/takluyver/backcall
license=('BSD')
depends=('python38')
makedepends=('python38-build' 'python38-flit-core' 'python38-installer')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5cbdbf27be5e7cfadb448baf0aa95508f91f2bbc6c6437cd9cd06e2a4c215e1e')
b2sums=('67f9ac96d26b368972a5749775a70c497b5705b37d45ba7f64c1259be776cc7f4c9d78ae51da9c1e9e46521d33bf511790675688feef88a68d25ae30cd79612d')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  python3.8 -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python tests/test_callback_prototypes.py
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -m "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
