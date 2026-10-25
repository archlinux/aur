# Maintainer: John Ettedgui <git@johne.rojalabs.com>

pkgname=python-turbopuffer
_pyname=turbopuffer
_sdist=${_pyname//-/_}
pkgver=3.0.0
pkgrel=1
pkgdesc='Python client for the Turbopuffer vector database'
arch=('any')
url='https://github.com/turbopuffer/turbopuffer-python'
license=('MIT')
depends=(
  'python-aiohttp'
  'python-anyio'
  'python-distro'
  'python-httpx2'
  'python-orjson'
  'python-pybase64'
  'python-pydantic'
  'python-sniffio'
  'python-typing_extensions'
)
optdepends=(
  'python-urllib3: urllib3 transport'
)
makedepends=(
  'python-build'
  'python-hatch-fancy-pypi-readme'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
source=("$_sdist-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_sdist-$pkgver.tar.gz")
sha256sums=('290a94c32e9d64a80299874a0dfac3eb87a01e13f46fb36950e5b7c35c3af943')

# Honcho's Turbopuffer backend imports turbopuffer.lib.namespace.AsyncNamespace
# and turbopuffer.types.Filter/RowParam, all of which still exist in 3.x (the
# client construction and namespace API were verified against this release).
#
# Upstream declares httpx2>=2.16.0, but Arch currently ships 2.13.1 (2.16.0
# was released 2026-10-21).  2.13.1 imports and constructs the client fine, so
# no version floor is set here until the repository catches up.

build() {
  cd "$_sdist-$pkgver"
  # Upstream pins hatchling==1.26.3 in [build-system]; the current Arch
  # hatchling builds the same wheel, so skip the exact-version assertion.
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_sdist-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Upstream's tests need a live Turbopuffer API key; not run.
