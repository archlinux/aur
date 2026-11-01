# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=q2-quality-control
pkgver=2026.10.0
pkgrel=1
pkgdesc='QIIME 2 quality control of feature and sequence data'
arch=(any)
url=https://github.com/qiime2/q2-quality-control
license=(BSD-3-Clause)
depends=('python' 'python-qiime2>=2026.10.0' 'python-q2-types>=2026.10.0' 'python-q2templates>=2026.10.0' 'q2-feature-table>=2026.10.0' 'q2-taxa>=2026.10.0' 'python-biom-format' 'python-numpy' 'python-pandas' 'python-scipy' 'python-matplotlib' 'python-seaborn' 'blast+' 'vsearch' 'samtools' 'bowtie2' 'gfatools' 'wget' 'unzip')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-versioningit' 'python-wheel')
checkdepends=('python-pytest' 'python-scikit-bio')
_commit=eec116d4593a0cc4e1f992ecddd99ab5d808fb9b
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('b568ba7e2bd0799318318b1c985cd8a509ce34c34bdac17a2d93d9f6d6b1497c')
optdepends=('r-decontam: identify contaminant sequences with decontam' 'r-optparse: run the decontam command-line helper')
build() {
  cd "q2-quality-control-$_commit"
  python -m build --wheel --no-isolation
}

# Nine optional R scoring tests need public R dependencies whose source URLs
# are unavailable. Retain the eight Python decontam cases and all other suites.
check() {
  python -m venv --system-site-packages --without-pip "$srcdir/check-env"
  "$srcdir/check-env/bin/python" -m installer "q2-quality-control-$_commit"/dist/*.whl
  MPLBACKEND=Agg "$srcdir/check-env/bin/python" -I - --import-mode=importlib -v --pyargs \
    "q2_quality_control.tests.test_filter" \
    "q2_quality_control.tests.test_filter_pangenome" \
    "q2_quality_control.tests.test_quality_control" \
    "q2_quality_control.tests.test_decontam::TestIdentify::test_freq_prev_control_col_error_raised" \
    "q2_quality_control.tests.test_decontam::TestIdentify::test_freq_prev_control_col_indic_error_raised" \
    "q2_quality_control.tests.test_decontam::TestIdentify::test_freq_params_error_raised" \
    "q2_quality_control.tests.test_decontam::TestIdentify::test_prev_no_indic_param_error_raised" \
    "q2_quality_control.tests.test_decontam::TestIdentify::test_prev_no_col_param_error_raised" \
    "q2_quality_control.tests.test_decontam::TestIdentify::test_prev_freq_params_error_raised" \
    "q2_quality_control.tests.test_decontam::TestVizualization::test_defaults" \
    "q2_quality_control.tests.test_decontam::TestVizualization::test_defaults_no_reps" \
    "q2_quality_control.tests.test_stats" --junitxml="$srcdir/pytest-results.xml" <<'PYTEST'
from pathlib import Path
import sys
import pytest
import q2_quality_control

installed = Path(q2_quality_control.__file__).resolve().parent
assert installed.is_relative_to(Path(sys.prefix).resolve()), installed
status = pytest.main(sys.argv[1:])
for name, module in tuple(sys.modules.items()):
    if name != 'q2_quality_control' and not name.startswith('q2_quality_control.'):
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
  cd "q2-quality-control-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
