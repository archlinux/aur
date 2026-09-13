# Maintainer: Smoolak <smoolak@gmail.com>

_pkgname=udtools
pkgname="python-${_pkgname}"
pkgver=0.2.8
pkgrel=1
pkgdesc="Python tools for Universal Dependencies"
arch=('any')
url="https://github.com/UniversalDependencies/tools"
license=('GPL-2.0-or-later')
depends=(
    'python'
    'python-udapi'
    'python-regex'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
)
_archive="tools-py$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/py$pkgver.tar.gz")
sha256sums=('7ce3a2d5f7a7492c072b4cafefa2f119c9a89fd7aa5ef0284a026e73795146a3')

prepare() {
    # Upstream declares udtools/data/*.json as package data, but keeps the JSON
    # sources at the monorepo root. Put them where setuptools expects them.
    install -d "$_archive/$_pkgname/src/$_pkgname/data"
    cp "$_archive"/data/*.json "$_archive/$_pkgname/src/$_pkgname/data/"
}

build() {
    cd "$_archive/$_pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_archive/$_pkgname"

    local _site _checkroot="$srcdir/_check"
    rm -rf "$_checkroot"
    python -m installer --destdir="$_checkroot" dist/*.whl
    _site=$(python -c 'import site; print(site.getsitepackages()[0])')

    # Run upstream's pytest suite against the built wheel, not the source tree.
    PYTHONPATH="$_checkroot$_site" pytest -v tests

    # Upstream also embeds its scorer unit tests in the installed module.
    (
        cd "$_checkroot"
        PYTHONPATH="$_checkroot$_site" python -m unittest -v udtools.udeval
    )

    # Exercise both primary APIs with a valid miniature CoNLL-U treebank.
    (
        cd "$_checkroot"
        PYTHONPATH="$_checkroot$_site" python - <<'PY'
from pathlib import Path
from tempfile import TemporaryDirectory

import udtools
from udtools import Validator
from udtools.udeval import evaluate, load_conllu_file

sample = """# sent_id = smoke-1
# text = Birds fly.
1	Birds	bird	NOUN	NNS	Number=Plur	2	nsubj	_	_
2	fly	fly	VERB	VBP	Mood=Ind|Tense=Pres|VerbForm=Fin	0	root	_	SpaceAfter=No
3	.	.	PUNCT	.	_	2	punct	_	_

"""

assert udtools.__version__ == '0.2.8'
with TemporaryDirectory() as directory:
    path = Path(directory, 'sample.conllu')
    path.write_text(sample, encoding='utf-8')

    state = Validator(lang='ud', level=2, output=None).validate_files([path])
    assert state.passed(), str(state)

    treebank = load_conllu_file(path)
    scores = evaluate(treebank, treebank)
    assert scores['LAS'].f1 == 1.0
    assert scores['Tokens'].f1 == 1.0

print('udtools smoke OK: validation passed; LAS and token F1 = 1.0')
PY
    )
}

package() {
    cd "$_archive/$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
