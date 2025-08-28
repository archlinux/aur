# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pipgrip
pkgver=0.11.0
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
sha256sums=('ca388a1f10a08045d1af89051c084340c4a7934c810db8bf1fc51cc3c7cb4cd1')

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
