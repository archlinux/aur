# Maintainer: Eric Busch <me@etbus.ch>
_name=quickjs_ng
pkgname=python-quickjs-ng
pkgver=0.17.0.2
pkgrel=1
pkgdesc="Thin Python wrapper of the quickjs-ng JavaScript engine."
arch=('x86_64' 'aarch64')
url="https://github.com/genotrance/quickjs-ng"
license=('MIT')
depends=('python' 'glibc')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
# The sdist vendors the quickjs-ng engine sources (upstream-quickjs/) and
# compiles them into the _quickjs extension, so it doesn't link against
# extra/quickjs-ng. Installs as the top-level `quickjs` module.
source=("https://files.pythonhosted.org/packages/d6/a4/611b1c2e3a505dd66cc03fb6e5963f0550a09ef2bd7c51243a9237d64db8/$_name-$pkgver.tar.gz")
sha256sums=('43d2e48272208721a7aaea8e3f02d4b9318f12ef20cc4f5421b59d9a470706ef')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  rm -rf test-env
  python -m installer --destdir=test-env dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/test-env/$site_packages" python -m pytest -q tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
