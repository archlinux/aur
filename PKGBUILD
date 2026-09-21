# Maintainer: Smoolak <smoolak@gmail.com>

_pkgname=skl2onnx
pkgname=python-skl2onnx
pkgver=1.20.0
pkgrel=14
pkgdesc='Convert scikit-learn models to ONNX'
arch=('any')
url='https://github.com/onnx/sklearn-onnx'
license=('Apache-2.0')
depends=(
    'python'
    'python-numpy'
    'python-onnx'
    'python-packaging'
    'python-scikit-learn'
    'python-scipy'
    # Arch's python-onnx 1.21 imports this at runtime but does not currently
    # declare it, so keep the compatibility dependency here until it does.
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'git'
)
checkdepends=(
    'python-pytest'
    'python-pytest-xdist'
    'python-numpy'
    'python-onnxruntime-cpu'
    'python-jinja'
    'python-pandas'
)
optdepends=(
    'python-pandas: for DataFrame type inference'
    'python-jinja: for ONNX operator code generation'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/onnx/sklearn-onnx/archive/refs/tags/$pkgver.tar.gz"
    'nearest-neighbor-radius.patch::https://github.com/onnx/sklearn-onnx/commit/1c9ef2845b313919b0d756d2c85e55b476a8ed68.patch'
    'hist-gradient-boosting-float32.patch::https://github.com/onnx/sklearn-onnx/commit/3ca82079d98e74c0dabb91510e2cf1699fce5dc2.patch'
    'tuned-threshold-classifier.patch::https://github.com/onnx/sklearn-onnx/commit/dd3bec163c3d77ac0b9f7a015e69f7aa99b2b966.patch'
    'pipeline-raw-scores.patch::https://github.com/onnx/sklearn-onnx/commit/7bdfd51ac7653ae35e36781fbc1ffb5b0dd86d87.patch'
    'radius-safe-index.patch'
    'onnx-1.21-integer-tree-attributes.patch'
    'current-dependencies.patch'
    'onnxruntime-1.27-labels.patch'
)
sha256sums=(
    '80cfee91f8e545f2746c229855c5bf7c211aee374ad12b9584b6b64f38abfe1d'
    '302f423c49014b268991b8ed83a843a8830fd3efde3092e7bb7d32cdcfce8301'
    '4b4c062a491671db84eab6631ea973d4283244f8fb9f8325dfcc8021851beb10'
    '6dfb419f513b625152df6a2c2cde9d8de3e26007d76b6fb9d8e5629e49fb41e8'
    '16300e170569a1e577ad3b4c0d483fd5cda7966ac195aed49c4fc9a255c18198'
    '69655b56eefb5940487a855bfeb38929cc936bbdc0ea29971a8d4da484307487'
    '97baba298c7dc4c4029bf3a51710d166424fabb104b120d5ea7fd0b736435955'
    '1581c51ff4c2955201d23e2616d0d6dc2df1b841e542ca1aa1e3e3343a6b8254'
    '6093d5e5468122c73da3264e64851e8f3d36a834cb81625b3376291ca3912adb'
)

prepare() {
    cd "sklearn-onnx-$pkgver"

    # Backport the converter fixes already merged upstream after 1.20.0.  Git
    # can omit the rolling changelog hunk while still applying every code and
    # regression-test hunk exactly.
    local patch
    for patch in \
        nearest-neighbor-radius.patch \
        hist-gradient-boosting-float32.patch \
        tuned-threshold-classifier.patch \
        pipeline-raw-scores.patch; do
        git apply --check --exclude=CHANGELOGS.md "$srcdir/$patch"
        git apply --exclude=CHANGELOGS.md "$srcdir/$patch"
    done

    patch -Np1 --fuzz=0 -i "$srcdir/radius-safe-index.patch"
    patch -Np1 --fuzz=0 -i "$srcdir/onnx-1.21-integer-tree-attributes.patch"
    patch -Np1 --fuzz=0 -i "$srcdir/current-dependencies.patch"
    patch -Np1 --fuzz=0 -i "$srcdir/onnxruntime-1.27-labels.patch"
}

build() {
    cd "sklearn-onnx-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "sklearn-onnx-$pkgver"
    local _checkroot="$srcdir/_check" _site _locale="$srcdir/_locale"
    local _bootstrap="$srcdir/_bootstrap"
    rm -rf "$_checkroot" "$_locale" "$_bootstrap"
    python -m installer --destdir="$_checkroot" dist/*.whl
    _site=$(python -c 'import site; print(site.getsitepackages()[0])')
    cp -a tests "$_checkroot/tests"
    mkdir -p "$_locale" "$_bootstrap"

    # ONNX Runtime's StringNormalizer nodes explicitly construct the named
    # en_US.UTF-8 C++ locale.  Minimal clean chroots only ship C.UTF-8, so
    # generate the required locale privately without modifying the host.
    localedef --no-archive -i en_US -f UTF-8 "$_locale/en_US.UTF-8"

    # Python 3.14 changed multiprocessing's POSIX default to forkserver.  A
    # handful of upstream conversion tests intentionally use local callables;
    # retain their historical fork semantics in the test process only.
    cat > "$_bootstrap/sitecustomize.py" <<'PY'
import multiprocessing

try:
    multiprocessing.set_start_method("fork")
except RuntimeError:
    pass
PY

    cd "$_checkroot"
    # Exercise every offline upstream test against the installed wheel. Arch
    # now ships the CPU ONNX Runtime backend required by its inference checks.
    # The three exact TF-IDF nodes below unconditionally fetch the 20 Newsgroups
    # corpus from Figshare; no fixture or offline fallback is shipped upstream.
    LOCPATH="$_locale" LC_ALL=en_US.UTF-8 \
    PYTHONPATH="$_bootstrap:$_checkroot$_site:$_checkroot/tests" \
    PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
        pytest -ra --import-mode=importlib \
          -k 'not (test_x_issue_789 or test_x_issue_789_cdist)' \
          --deselect=tests/test_sklearn_tfidf_transformer_converter_sparse.py::TestSklearnTfidfVectorizerSparse::test_model_tfidf_transform_bug \
          --deselect=tests/test_sklearn_tfidf_vectorizer_converter_dataset.py::TestSklearnTfidfVectorizerDataSet::test_tfidf_20newsgroups \
          --deselect=tests/test_sklearn_tfidf_vectorizer_converter_dataset.py::TestSklearnTfidfVectorizerDataSet::test_tfidf_20newsgroups_nolowercase \
          tests

    # These two upstream tests each fit a 7,500-row Gaussian process (cubic
    # Cholesky cost). Run the two independent cases concurrently; they remain
    # part of the complete suite without needlessly serializing their cost.
    LOCPATH="$_locale" LC_ALL=en_US.UTF-8 \
    PYTHONPATH="$_bootstrap:$_checkroot$_site:$_checkroot/tests" \
    PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
    OPENBLAS_NUM_THREADS="${SLURM_CPUS_PER_TASK:-1}" \
    OMP_NUM_THREADS="${SLURM_CPUS_PER_TASK:-1}" \
        pytest -ra -p xdist.plugin -n 2 --dist=load --import-mode=importlib \
          tests/test_sklearn_gaussian_process_regressor.py::TestSklearnGaussianProcessRegressor::test_x_issue_789 \
          tests/test_sklearn_gaussian_process_regressor.py::TestSklearnGaussianProcessRegressor::test_x_issue_789_cdist

    PYTHONPATH="$_checkroot$_site" python - <<'PY'
import numpy as np
import onnx
from onnx.reference import ReferenceEvaluator
from sklearn.datasets import load_iris
from sklearn.linear_model import LogisticRegression
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import StandardScaler
from skl2onnx import to_onnx

x, y = load_iris(return_X_y=True)
x = x.astype(np.float32)
model = make_pipeline(StandardScaler(), LogisticRegression(max_iter=300)).fit(x, y)
converted = to_onnx(model, x[:1], options={id(model[-1]): {"zipmap": False}})
onnx.checker.check_model(converted)
labels, probabilities = ReferenceEvaluator(converted).run(None, {"X": x[:12]})
np.testing.assert_array_equal(labels, model.predict(x[:12]))
np.testing.assert_allclose(probabilities, model.predict_proba(x[:12]), rtol=1e-4, atol=1e-5)
print("scikit-learn to ONNX reference-evaluator workflow passed")
PY
}

package() {
    cd "sklearn-onnx-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
