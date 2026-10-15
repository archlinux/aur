# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=vercel-sandbox
pkgname=python-$_name
pkgver=0.9.1
pkgrel=1
pkgdesc='Python SDK for Vercel Sandbox.'
arch=('any')
_repo='https://github.com/vercel/vercel-py'
url="$_repo/tree/main/src/$_name"
license=('MIT')
depends=('python'
         'python-vercel-internal-core'
         'python-vercel-oidc'
         'python-anyio'
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
sha256sums=('4caaf48fc52ac0e012105a388875015d9136fd974599a9949edfc5d515c27f15')

build() {
  cd "$srcdir"/vercel-py-$_name-v$pkgver/src/$_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/vercel-py-$_name-v$pkgver/src/$_name
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/vercel-py-$_name-v$pkgver/src/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
