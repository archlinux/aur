# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=vercel-oidc
pkgname=python-$_name
pkgver=0.12.0
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
sha256sums=('02f2c6b38b0323e28d1ed0ebcd8a798698203543943c171423f5a967ce17d673')

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
