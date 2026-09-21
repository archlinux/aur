# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-rouge-score
_pkgname=rouge_score
pkgver=0.1.2
pkgrel=4
pkgdesc="Pure python implementation of ROUGE-1.5.5 (Google's ROUGE metric)"
arch=('any')
url="https://github.com/google-research/google-research/tree/master/rouge"
license=('Apache-2.0')
depends=(
    'python'
    'python-absl'
    'python-defusedxml'
    'python-nltk'
    'nltk-data'
    'python-numpy'
    'python-six'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=(
    'python-pytest'
)
# rouge_score lives in the rouge/ subdir of the google-research monorepo, which has
# no tags and is ~1.2 GB (a full git clone per build is unreasonable). Its release
# copies rouge/*.py into a rouge_score/ package. So fetch the individual package
# files straight from the repo at a pinned commit and reassemble that layout here.
_commit=5b09c22d73a9d35eb6c5d2a99b95677a45053466
_raw="https://raw.githubusercontent.com/google-research/google-research/$_commit/rouge"
source=(
    "$_pkgname-setup.py::$_raw/setup.py"
    "$_pkgname-README.md::$_raw/README.md"
    "$_pkgname-requirements.txt::$_raw/requirements.txt"
    "$_pkgname-__init__.py::$_raw/__init__.py"
    "$_pkgname-io.py::$_raw/io.py"
    "$_pkgname-rouge.py::$_raw/rouge.py"
    "$_pkgname-rouge_scorer.py::$_raw/rouge_scorer.py"
    "$_pkgname-scoring.py::$_raw/scoring.py"
    "$_pkgname-test_util.py::$_raw/test_util.py"
    "$_pkgname-tokenize.py::$_raw/tokenize.py"
    "$_pkgname-tokenizers.py::$_raw/tokenizers.py"
    "$_pkgname-io_test.py::$_raw/io_test.py"
    "$_pkgname-rouge_scorer_test.py::$_raw/rouge_scorer_test.py"
    "$_pkgname-scoring_test.py::$_raw/scoring_test.py"
    "$_pkgname-tokenize_test.py::$_raw/tokenize_test.py"
    "$_pkgname-tokenizers_test.py::$_raw/tokenizers_test.py"
    "$_pkgname-testdata-delimited.txt::$_raw/testdata/delimited.txt"
    "$_pkgname-testdata-prediction.txt::$_raw/testdata/prediction.txt"
    "$_pkgname-testdata-prediction_large.txt::$_raw/testdata/prediction_large.txt"
    "$_pkgname-testdata-target.txt::$_raw/testdata/target.txt"
    "$_pkgname-testdata-target_large.txt::$_raw/testdata/target_large.txt"
    "$_pkgname-testdata-prediction_multi.0.txt::$_raw/testdata/pyrouge_files/prediction_multi.0.txt"
    "$_pkgname-testdata-target_multi.0.txt::$_raw/testdata/pyrouge_files/target_multi.0.txt"
    'APACHE-2.0-LICENSE'
)
sha256sums=('0b8a24abf47fc4b98c73a29e624050aede74abf77b5911b039cfc48d15642966'
            '302c28d7d05ed57cc389eb42dfc4b123fad0925a775f4126b8c9dbbc9a53f668'
            '436f92e71707ed093c0e8fa4e9ad9660272878a960b36ba0125aa95947d30130'
            'f8bc222f8944b7ce2b74c2299691238649e7e82fdd287831d562e0c50bafcba1'
            '269920a4678ef8484b8583e2e56503634eaea3c34a2410b6cb4dcf52edeb90fe'
            '5ea927632b41d7cf9dc4e31e0232b901315712106f0e307d28f32aa2f2056dbe'
            'd456a6c2eeca64718c970289dff6440f785fc348730819160530066e1f3188b1'
            'b20c3a41c3d9f35f2d1f931b3c82b67e8347d536c82a422f0b7a5115137aa73c'
            '5d6c0c4284be99ea02f06ee0ef23d2f92d0ce4164e5c1a412fa78bcf7b0f991e'
            'cb8a643e2fba4e6358a773eb9d4455279ccf7212f347e7272de6949e2e81774e'
            '08e2b802f09b95b398ef6262177ccb5b5b35e670e6299a45a3a5b138792f57d2'
            '1e16b1fc64121645c2f9380a30e992cc1419d643d49e51c77f1a662b51f5bcba'
            '16dec4474f96e879eaa2d7335b66a7075a364ac49a2c128c42f932a9ae6cd3cf'
            '3121198cdf53d97c87a3cf5bcfbafb9c2f088f2760dd19765ddf27b6b6f359b8'
            '886e53459a8037f0c60079ae9d779ed610b858b30fd9984e1874024d78f64621'
            'b6d8fc53a9c1dcc143a1cd1e85519fa39576159c4f40b1751c3d9a784b67ad16'
            '9ff055693db54d17d2fa18bff819c572cf9c6372b58a02188ed01e867a94a8c9'
            '421c9e8f98c252f86c1723afb992b56b5c2d48a2c5b9c71100e75aaec3adec74'
            '801559be94a0c6110e50f08396582bd82558a6bcfb6be4456f24a5e644574c22'
            '39701c998e599ec28b58abace665601de955685d6c13600d3fd4ecad192cc947'
            'd4eb90a26ce7207218e6a892a2d01d998e7ca2e10da1138a5cc2b3d27f8b8703'
            '0b01a0024d88c5636ecb8876e9268cff52687e6019e697dce0bdca79514d4af3'
            '0f7bc3164de1eeede119441ff4241e85c16d3eb753e5c6f66006ce43e3f0372f'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

prepare() {
    # Reassemble upstream's release layout: package modules under rouge_score/,
    # with setup.py / README / requirements at the build root.
    rm -rf "$srcdir/_build"
    install -d "$srcdir/_build/rouge_score"
    local m
    for m in __init__ io rouge rouge_scorer scoring test_util tokenize tokenizers; do
        cp "$srcdir/$_pkgname-$m.py" "$srcdir/_build/rouge_score/$m.py"
    done
    cp "$srcdir/$_pkgname-setup.py"        "$srcdir/_build/setup.py"
    cp "$srcdir/$_pkgname-README.md"       "$srcdir/_build/README.md"
    cp "$srcdir/$_pkgname-requirements.txt" "$srcdir/_build/requirements.txt"
}

build() {
    cd "$srcdir/_build"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/_build"

    local _check="$srcdir/_check"
    local _site
    rm -rf "$_check" "$srcdir/_tests"
    python -m installer --destdir="$_check" dist/*.whl
    _site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

    install -d "$_check$_site/rouge_score/testdata/pyrouge_files" "$srcdir/_tests"
    local data
    for data in delimited prediction prediction_large target target_large; do
        install -m644 "$srcdir/$_pkgname-testdata-$data.txt" \
            "$_check$_site/rouge_score/testdata/$data.txt"
    done
    install -m644 "$srcdir/$_pkgname-testdata-prediction_multi.0.txt" \
        "$_check$_site/rouge_score/testdata/pyrouge_files/prediction_multi.0.txt"
    install -m644 "$srcdir/$_pkgname-testdata-target_multi.0.txt" \
        "$_check$_site/rouge_score/testdata/pyrouge_files/target_multi.0.txt"
    local test
    for test in io rouge_scorer scoring tokenize tokenizers; do
        install -m644 "$srcdir/$_pkgname-${test}_test.py" \
            "$srcdir/_tests/${test}_test.py"
    done

    cd "$srcdir/_tests"
    # Run every upstream test except the one that consumes the monorepo's 500
    # generated pyrouge fixture files; all normal and large local corpora run.
    PYTHONPATH="$_check$_site" pytest -v \
        --deselect=scoring_test.py::BootstrapAggregatorTest::testConfidenceIntervalsAgainstRouge155WithStemmingMultiLine

    PYTHONPATH="$_check$_site" python - <<'PY'
from rouge_score import rouge_scorer

scorer = rouge_scorer.RougeScorer(["rouge1", "rouge2", "rougeL"])
scores = scorer.score(
    "the cat sat on the mat",
    "the cat rested on a mat",
)
assert abs(scores["rouge1"].fmeasure - (2 / 3)) < 1e-12
assert abs(scores["rouge2"].fmeasure - 0.2) < 1e-12
assert abs(scores["rougeL"].fmeasure - (2 / 3)) < 1e-12
PY
}

package() {
    cd "$srcdir/_build"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # The rouge/ subdir ships no LICENSE; install the Apache-2.0 license under
    # which rouge_score is distributed (per setup.py header).
    install -Dm644 "$srcdir/APACHE-2.0-LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
