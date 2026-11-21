# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=vercel-sandbox
pkgname=python-$_name
pkgver=1.1.0
pkgrel=1
pkgdesc='Python SDK for Vercel Sandbox.'
arch=('any')
_repo='https://github.com/vercel/vercel-py'
url="$_repo/tree/main/src/$_name"
license=('MIT')
depends=('python'
         'python-vercel-internal-core'
         'python-vercel-drives'
         'python-vercel-oidc'
         'python-anyio'
         'python-cbor2'
         'python-httpx2'
         'python-wsproto'
         'python-pydantic')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-httpx'
              'python-hypothesis'
              'python-trio')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$_name-v$pkgver.tar.gz")
sha256sums=('104c2e74740d59d3f5f5b1efdcb0816b3e0d68323c87ee4391165030a14200c3')

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
