# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=vercel-drives
pkgname=python-$_name
pkgver=0.1.0
pkgrel=1
pkgdesc='Python SDK for Vercel Drives.'
arch=('any')
_repo='https://github.com/vercel/vercel-py'
url="$_repo/tree/main/src/$_name"
license=('MIT')
depends=('python'
         'python-vercel-internal-core'
         'python-vercel-oidc'
         'python-anyio'
         'python-httpx2'
         'python-pydantic')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-asyncio')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$_name-v$pkgver.tar.gz")
sha256sums=('0a78f2c26feb23366afc955dcaae17adf4fc8ed357ade1d3a9f2b9ac69160b3f')

prepare() {
  cd "vercel-py-$_name-v$pkgver/src/$_name"
  # Use the hatchling version shipped by Arch
  sed -i '/^requires = /s/"hatchling[<>=!~][^"]*"/"hatchling"/' pyproject.toml
}

build() {
  cd "vercel-py-$_name-v$pkgver/src/$_name"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "vercel-py-$_name-v$pkgver/src/$_name"
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "vercel-py-$_name-v$pkgver/src/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
