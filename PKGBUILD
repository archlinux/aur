# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pipgrip
pkgver=0.10.15
pkgrel=1
pkgdesc="Lightweight pip dependency resolver with deptree preview functionality based on the PubGrub algorithm"
arch=('any')
url="https://github.com/ddelange/pipgrip"
license=('BSD 3-Clause')
depends=(
  'python-anytree'
  'python-click'
  'python-packaging'
  'python-pip'
  'python-setuptools'
  'python-wheel'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8379c55f48ac4f294db706400d79ef93cdc267e1bb3765f4c56b96c21e728dda')

prepare() {
  cd "$pkgname-$pkgver"

  # Relax requirements
  sed -i 's/setuptools_scm<7/setuptools_scm/g' setup.py
}

build() {
  cd "$pkgname-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
