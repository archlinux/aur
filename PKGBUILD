# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-rouge-score
_pkgname=rouge_score
pkgver=0.1.2
pkgrel=2
pkgdesc="Pure python implementation of ROUGE-1.5.5 (Google's ROUGE metric)"
arch=('any')
url="https://github.com/google-research/google-research/tree/master/rouge"
license=('Apache-2.0')
depends=(
    'python'
    'python-absl'
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
source=(
    "$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/r/rouge_score/rouge_score-$pkgver.tar.gz"
    'APACHE-2.0-LICENSE'
)
sha256sums=('c7d4da2683e68c9abf0135ef915d63a46643666f848e558a1b9f7ead17ff0f04'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    # rouge_score pulls nltk's stemmer, and nltk 3.9 eagerly loads the wordnet
    # corpus on that import, so the package cannot even be imported without the
    # nltk data (shipped by the nltk-data depend). Exercise a real score.
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "from rouge_score import rouge_scorer; s=rouge_scorer.RougeScorer(['rouge1','rougeL'], use_stemmer=True); print('rouge1', s.score('the quick brown fox','the quick brown fox')['rouge1'].fmeasure)"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Upstream sdist does not ship a LICENSE file; install the Apache-2.0
    # license under which rouge_score is distributed (per setup.py header).
    install -Dm644 "$srcdir/APACHE-2.0-LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
