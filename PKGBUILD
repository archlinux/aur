# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=q2-feature-classifier
pkgver=2026.10.0
pkgrel=1
pkgdesc='QIIME 2 taxonomic classification of biological sequences'
arch=(x86_64)
url=https://github.com/qiime2/q2-feature-classifier
license=(BSD-3-Clause)
depends=('python' 'glibc' 'python-qiime2>=2026.10.0' 'python-q2-types>=2026.10.0' 'python-biom-format' 'python-scikit-bio' 'python-joblib' 'python-numpy' 'python-pandas' 'python-scipy' 'python-scikit-learn' 'vsearch' 'blast+' 'q2-feature-table>=2026.10.0' 'q2-quality-control>=2026.10.0' 'q2-taxa>=2026.10.0')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-versioningit' 'python-wheel')
checkdepends=('python-pytest')
_commit=559c0251bf4a7c3fe7e9cc7267207cc39059c784
_alignment_commit=efd210ecdc034c2a33a0d91acf024f7de1281a14
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        "scikit-bio-alignment.pyx::https://raw.githubusercontent.com/scikit-bio/scikit-bio/$_alignment_commit/skbio/alignment/_cutils.pyx"
        "scikit-bio-LICENSE.txt::https://raw.githubusercontent.com/scikit-bio/scikit-bio/$_alignment_commit/LICENSE.txt"
        'primer-alignment-compat.patch'
        'primer_alignment.py'
        'prepare-alignment.py'
        'setup-alignment.py')
sha256sums=('fdebb27ae186b0f5e2ae240f1130e6c28d1c3f58b30f883f8b65bebf6fd62046'
            'e14c462e9cb183ea20be43c9ba757c57a2733864ceb142b9855450ca238fcdd0'
            'bd113b93ac18e79ccf11a3f69eb3047d8af6a10bb9e9215c49af4b27301c0bd6'
            'dc9d7395ec96e0dfc21c19563bc39fe3fc3d473fa0d360869537e5a1e34ffd5d'
            '764a7922c16062286b6fab5e4f5a0e736987524912fb80ffcca5228ad6d908ea'
            'da5ebecf1c55f4afb160d526fd639d46fb8f27d13061546dc0675bc11f818954'
            'ae39fc69fce8c9157fc5ef3c2dc778f0e888000c1a5ec0d23d32e8988e8becc2')

prepare() {
  cd "q2-feature-classifier-$_commit"
  patch -Np1 -i "$srcdir/primer-alignment-compat.patch"
  cp "$srcdir/primer_alignment.py" q2_feature_classifier/_primer_alignment.py
  cp "$srcdir/setup-alignment.py" setup.py
  python "$srcdir/prepare-alignment.py" "$srcdir/scikit-bio-alignment.pyx" \
    q2_feature_classifier/_primer_alignment_c.pyx
  cp "$srcdir/scikit-bio-LICENSE.txt" q2_feature_classifier/
}

build() {
  cd "q2-feature-classifier-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --system-site-packages --without-pip "$srcdir/check-env"
  "$srcdir/check-env/bin/python" -m installer "q2-feature-classifier-$_commit"/dist/*.whl
  MPLBACKEND=Agg "$srcdir/check-env/bin/python" -I - --import-mode=importlib -v \
    --pyargs q2_feature_classifier --junitxml="$srcdir/pytest-results.xml" <<'PYTEST'
from pathlib import Path
import sys
import pytest
import q2_feature_classifier

installed = Path(q2_feature_classifier.__file__).resolve().parent
assert installed.is_relative_to(Path(sys.prefix).resolve()), installed
status = pytest.main(sys.argv[1:])
for name, module in tuple(sys.modules.items()):
    if name != 'q2_feature_classifier' and not name.startswith('q2_feature_classifier.'):
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
  cd "q2-feature-classifier-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/scikit-bio-LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/scikit-bio-LICENSE.txt"
}
