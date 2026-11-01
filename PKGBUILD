# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-q2templates
pkgver=2026.10.0
pkgrel=1
pkgdesc='HTML templates and interactive reports for QIIME 2 visualizations'
arch=(any)
url=https://github.com/qiime2/q2templates
license=(BSD-3-Clause)
depends=(python python-jinja python-pandas)
makedepends=(python-build python-installer python-setuptools python-versioningit python-wheel nodejs npm)
checkdepends=(python-pytest)
_commit=59d47eb8072d70f9e6f984dff4f052620a62a91e
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('abd54379f9c422e2e9a65460a339511f725c8b33570ccad376a30534ebee8682')

prepare() {
  cd "q2templates-$_commit"
  npm ci --prefix reports/matryoshka --no-audit --no-fund
}

build() {
  cd "q2templates-$_commit"
  npm run build --prefix reports/matryoshka
  install -d q2templates/reports/built_assets/matryoshka
  cp -r reports/matryoshka/build/. q2templates/reports/built_assets/matryoshka/
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --system-site-packages --without-pip "$srcdir/check-env"
  "$srcdir/check-env/bin/python" -m installer "q2templates-$_commit"/dist/*.whl
  "$srcdir/check-env/bin/python" -I -m pytest --import-mode=importlib -v \
    "q2templates-$_commit/q2templates" --junitxml="$srcdir/pytest-results.xml"
}

package() {
  cd "q2templates-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
