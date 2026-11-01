# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=q2-taxa
pkgver=2026.10.0
pkgrel=1
pkgdesc='QIIME 2 taxonomic analysis and interactive visualizations'
arch=(any)
url=https://github.com/qiime2/q2-taxa
license=(BSD-3-Clause Apache-2.0 MIT ISC)
depends=('python' 'python-qiime2>=2026.10.0' 'python-q2-types>=2026.10.0' 'python-q2templates>=2026.10.0' 'python-biom-format' 'python-numpy' 'python-pandas')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-versioningit' 'python-wheel' 'nodejs' 'npm')
checkdepends=('python-pytest' 'python-selenium' 'chromium')
_commit=8e3727c59f15056d004a2c9926f6deef5ce19d29
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        barplot-package-lock.json package-lock.json copy-frontend-licenses.py
        runtime-modules.js vite.config.ts
        offline_usage_tests.py preserve-first-sample.patch
        "usage-gut-table.qza::https://data.qiime2.org/usage-examples/moving-pictures/gut-table.qza"
        "usage-taxonomy.qza::https://raw.githubusercontent.com/qiime2/q2-feature-table/92201e4db69880e2741a233509e24161dfacfa8b/q2_feature_table/tests/data/moving-pics-taxonomy-gg-13-8.qza"
        "usage-sample-metadata.tsv::https://data.qiime2.org/usage-examples/moving-pictures/sample-metadata.tsv")
sha256sums=('39bf81b89ad8ea37974da8fd418037f03c45115cdd4749a0598c0430d37aca90'
            '62c681f086f200fea392621658696ea42f04a97e6ad053e6bb895c5e5535f264'
            '67afa721dc00820651e228b957bb148300549e29a83ca209611c4b6a2b6f055a'
            'fb6964131d2aa15ce2728971b31005677cc1ebb8902d785cf92af312641eb39a'
            'bd88877adbf2eb48829dbb9e5b134e63a0e26257c3cc46f21d8e0d4e7f2a26dc'
            '78e9ac294806e09d605b2f3da07e59b141b2ef65da5a272cf9da42722bbaccf4'
            '35719bbede7f621b09095c8447dd47381be3719c9224725c7cc1495bb12f5d19'
            '567e58fde2647c4eca85242502495ab7dd899b04a28a68e644e6700b18fe9ffe'
            '60a0a9455dc68cefb37025df94e027c8cef47be111ea15d2b9492fab6d68c729'
            'f70c443f09f6e5803225615950507910dc866a3e3102c13afd4317bb5ffca317'
            '9dbfbedd90776d77c431faa914d81b0d6299fff10c364216dbcd5c6df5382cc9')
noextract=('usage-gut-table.qza' 'usage-taxonomy.qza')

prepare() {
  cd "q2-taxa-$_commit"
  patch -Np1 -i "$srcdir/preserve-first-sample.patch"
  cp "$srcdir/barplot-package-lock.json" q2_taxa/assets/barplot/package-lock.json
  cp "$srcdir/package-lock.json" q2_taxa/_barplot_visualizer/package-lock.json
  cp "$srcdir/runtime-modules.js" "$srcdir/vite.config.ts" q2_taxa/_barplot_visualizer/
  npm ci --prefix q2_taxa/assets/barplot --legacy-peer-deps --no-audit --no-fund
  npm ci --prefix q2_taxa/_barplot_visualizer --legacy-peer-deps --no-audit --no-fund
}

build() {
  cd "q2-taxa-$_commit"
  npm run build --prefix q2_taxa/assets/barplot
  cp q2_taxa/assets/barplot/licenses/* q2_taxa/assets/barplot/dist/
  npm run build --prefix q2_taxa/_barplot_visualizer
  python "$srcdir/copy-frontend-licenses.py"
  python -m build --wheel --no-isolation
}

check() {
  # Upstream make test builds both frontends and runs pytest. Its separate
  # developer TypeScript checker is not part of that test target.
  python -m venv --system-site-packages --without-pip "$srcdir/check-env"
  "$srcdir/check-env/bin/python" -m installer "q2-taxa-$_commit"/dist/*.whl
  local site_packages
  site_packages=$("$srcdir/check-env/bin/python" -I -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
  install -m644 "$srcdir/offline_usage_tests.py" "$site_packages/aur_q2_usage_fixtures.py"
  Q2_TEST_FIXTURES="$srcdir" MPLBACKEND=Agg "$srcdir/check-env/bin/python" -I - --import-mode=importlib -v \
    -p aur_q2_usage_fixtures --pyargs q2_taxa --junitxml="$srcdir/pytest-results.xml" <<'PYTEST'
from pathlib import Path
import sys
import pytest
import q2_taxa

installed = Path(q2_taxa.__file__).resolve().parent
assert installed.is_relative_to(Path(sys.prefix).resolve()), installed
status = pytest.main(sys.argv[1:])
for name, module in tuple(sys.modules.items()):
    if name != 'q2_taxa' and not name.startswith('q2_taxa.'):
        continue
    origin = getattr(module, '__file__', None)
    if origin is None or 'tests' in name.split('.')[1:]:
        continue
    path = Path(origin).resolve()
    assert path.is_relative_to(installed), (name, path)
print('Installed runtime origin check passed:', installed)
raise SystemExit(status)
PYTEST
}

package() {
  cd "q2-taxa-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r q2_taxa/assets/barplot/dist/third-party-licenses "$pkgdir/usr/share/licenses/$pkgname/legacy"
  cp -r q2_taxa/_barplot_visualizer/dist/third-party-licenses "$pkgdir/usr/share/licenses/$pkgname/modern"
}
