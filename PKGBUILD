# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=catppuccin
pkgname="python-$_pkgname"
pkgver=3.0.0
pkgrel=1
pkgdesc="Soothing pastel theme for Python"
arch=('any')
url="https://catppuccin-website.vercel.app"
license=('MIT')
depends=('python')
makedepends=(
  'python-build' 'python-installer' 'python-wheel'
  'python-hatchling'
)
checkdepends=(
  'python-pytest' 'python-pygments' 'python-rich'
  'python-matplotlib'
)
optdepends=(
  'python-pygments: For pygments integration'
  'python-rich: For rich integration'
  'python-matplotlib: For matplotlib integration'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/catppuccin/python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fc8da906f3788d5cb4dfd05aca1e37c8baba85e2a5da824a2fbaf561b3a71aff')
b2sums=('07899df5a9b664bd99a51052ed18f2d35c6807b586e5fb7c7f34b21f1013ff687363e021dc6f502d333c9896b0e5ec614044d75a0e15fe5f02b737a4ba3533dc')

prepare() {
  cd "python-$pkgver"

  mv build.py build_palette.py
}

build() {
  cd "python-$pkgver"

  export POETRY_DYNAMIC_VERSIONING_BYPASS="$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "python-$pkgver"

  # The IPython theme tests fail against IPython 9.18 (theme not registered in its new ThemeTable)
  pytest --ignore=tests/test_ipython.py
}

package() {
  cd "python-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
