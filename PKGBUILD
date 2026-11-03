# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=vercel-oidc
pkgname=python-$_name
pkgver=0.11.0
pkgrel=1
pkgdesc='OIDC helpers for Vercel Python applications.'
arch=('any')
_repo='https://github.com/vercel/vercel-py'
url="$_repo/tree/main/src/$_name"
license=('MIT')
depends=('python'
         'python-anyio'
         'python-httpx2'
         'python-vercel-headers')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-cryptography'
              'python-trio'
              'python-pyjwt')
optdepends=('python-pyjwt: verify'
            'python-cryptography: verify')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$_name-v$pkgver.tar.gz")
sha256sums=('e5056423ef2c7269237eeaf31cb797156dd048ad7d28605d14a55c6c84408646')

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
