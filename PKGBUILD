# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

_pyname=acachecontrol
_upstream_name=acachecontrol
pkgname="python-${_pyname}"
pkgver=0.3.7
pkgrel=1
pkgdesc='Async CacheControl for aiohttp'
arch=('any')
license=('Apache-2.0')
url="https://github.com/MasterSergius/acachecontrol"

depends=(
  'python'
  'python-aiohttp'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
checkdepends=(
  'mypy'
  'pre-commit'
  'python-black'
  'python-isort'
  'python-flake8'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-cov'
  'python-pytest-mock'
  'python-pytest-vcr'
)

source=("${_pyname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('b76c3e56e4166a06faa7a509fd4a49d8bd3e1760a212e5133315e6446a0cb0119a20888fbd11efa12f5ed4519bdbc49a399b67aa98a05bb273b1d5f8ca76d3d7')


build() {
  cd "$_upstream_name-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_upstream_name-$pkgver"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pyname-$pkgver"-*.whl
  test-env/bin/python -m pytest -v tests
}

package() {
  cd "$_upstream_name-$pkgver"

  python -m installer --destdir="$pkgdir" "dist/$_pyname-$pkgver"-*.whl

  # Upstream does not provide a license file, so we will create one from the license text in the source code.
  #install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
