# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=tokenize-rt
pkgname=python38-tokenize-rt
pkgver=5.0.0
pkgrel=1
pkgdesc='Wrapper around the stdlib `tokenize` which roundtrips'
arch=('any')
url=https://github.com/asottile/tokenize-rt
license=('MIT')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools'
             'python38-wheel')
checkdepends=('python38-pytest')
source=("$url/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('d5e5dd3637615c451463d85e63b6d48670ed18de58e111625b106cfc0af2616726d2ff510412decd32db2c67dea5807d5f9b64ecfa902f56fd32b739085698c3')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  python3.8 -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -m "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/tokenize_rt-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
