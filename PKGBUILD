# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-consolekit
pkgver=1.5.1
pkgrel=1
pkgdesc='Additional utilities for click'
arch=('any')
url='https://consolekit.readthedocs.io/'
license=('MIT')
depends=(
  'python'
  'python-click'
  'python-colorama'
  'python-deprecation-alias'
  'python-domdf-python-tools'
  'python-mistletoe'
  'python-typing-extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-flit-core'
)
optdepends=(
  'python-psutil: better terminal support'
)
_commit='6824cb42277c6acb46531d2076dcc065496e3d39'
source=("$pkgname::git+https://github.com/domdfcoding/consolekit#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/${pkgname#python-}-$pkgver.dist-info/licenses/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
