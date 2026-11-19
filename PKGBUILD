# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=vercel-internal-core
pkgname=python-$_name
pkgver=0.3.1
pkgrel=1
pkgdesc='Shared internal runtime for Vercel Python packages.'
arch=('any')
_repo='https://github.com/vercel/vercel-py'
url="$_repo/tree/main/src/$_name"
license=('MIT')
depends=('python'
         'python-httpx2'
         'python-anyio')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-httpx'
              'python-hypothesis'
              'python-trio')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$_name-v$pkgver.tar.gz")
sha256sums=('7a2e268465f93e80dee225101aa85866e222fd62c1ad1dc303777af28f20f22c')

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
