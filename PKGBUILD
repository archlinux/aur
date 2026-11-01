# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-q2templates
pkgver=2026.10.0
pkgrel=2
pkgdesc='HTML templates and interactive reports for QIIME 2 visualizations'
arch=(any)
url=https://github.com/qiime2/q2templates
license=(BSD-3-Clause MIT)
depends=(python python-jinja python-pandas)
makedepends=(python-build python-installer python-setuptools python-versioningit python-wheel nodejs npm)
checkdepends=(python-pytest)
_commit=59d47eb8072d70f9e6f984dff4f052620a62a91e
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        runtime-modules.js matryoshka-vite.config.ts runtime-notices.py)
sha256sums=('abd54379f9c422e2e9a65460a339511f725c8b33570ccad376a30534ebee8682'
            '3c5e2dfe3205420c87a9551eef6e292ed0c927c1072e58a3ab3f72f6e6f6a225' '4f2885e1596469dafceb7034cd980392a2b8bf6744546e41f05c488722cd19d5' '7b7adcf9b697a79bd988ee855e5e9b91b70cd1dbd9cccdbe7123950db85a634d')

prepare() {
  cd "q2templates-$_commit"
  cp "$srcdir/"{runtime-modules.js,matryoshka-vite.config.ts} reports/matryoshka/
  npm ci --prefix reports/matryoshka --no-audit --no-fund
}

build() {
  cd "q2templates-$_commit"
  npm run build --prefix reports/matryoshka -- --config matryoshka-vite.config.ts
  (cd reports/matryoshka && python "$srcdir/runtime-notices.py")
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
  cp -r reports/matryoshka/build/third-party-licenses "$pkgdir/usr/share/licenses/$pkgname/"
}
