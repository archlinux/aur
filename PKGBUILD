# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=pure_eval
pkgname=python38-pure-eval
pkgver=0.2.2
pkgrel=2
pkgdesc='Safely evaluate AST nodes without side effects'
arch=('any')
url=https://github.com/alexmojaki/pure_eval
license=('MIT')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm'
             'python38-wheel')
checkdepends=('python38-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2b45320af6dfaa1750f543d714b6d1c520a1688dec6fd24d339063ce0aaa9ac3')
b2sums=('19f86a1436e5f1a026a24f62c435e8970d84960f4cde1de80c58949b1aede6aa7562e8430e10e3f7171212c31d5699a3321fad5fb2ea1eed961a30d43a632a79')

build() {
  cd "$_name-$pkgver"
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python3.8 -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "$_name-$pkgver"
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -m "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
