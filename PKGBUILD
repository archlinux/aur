# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Cillian Berragan <cjberragan@gmail.com>
pkgname=python-stanza
_name=${pkgname#python-}
pkgver=1.14.0
pkgrel=1
pkgdesc="Stanford NLP Python library for tokenization, sentence segmentation, NER, and parsing of many human languages"
arch=('any')
url="https://stanfordnlp.github.io/stanza"
license=('Apache-2.0')
depends=(
  'python'
  'python-emoji'
  'python-huggingface-hub'
  'python-networkx'
  'python-numpy'
  'python-packaging'
  'python-platformdirs'
  'python-protobuf'
  'python-pytorch'
  'python-requests'
  'python-tqdm'
  'python-udtools'
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
optdepends=(
  'ipython: Display interactive Semgrex visualizations'
  'python-crfsuite: Use CRFSuite-backed tokenization'
  'python-datasets: Process Hugging Face datasets'
  'python-datasketch: Deduplicate Community OSCAR corpora with MinHash'
  'python-flask: Run the browser demo server'
  'python-jieba: Use Jieba tokenization'
  'python-lxml: Convert XML-based datasets'
  'python-matplotlib: Visualize model weights'
  'python-peft>=0.6.1: Use parameter-efficient transformer fine-tuning'
  'python-scipy: Perform CEAF scoring for the Kuhn-Munkres linear assignment scheme'
  'python-spacy: Use spaCy tokenization and visualizations'
  'python-streamlit: Run the Semgrex visualization app'
  'python-tlsh: Inspect corpus similarity with TLSH'
  'python-transformers>=3.0.0: Use transformer-backed models'
  'python-wandb: Log training runs to Weights & Biases'
  'python-zstandard: Process compressed Community OSCAR corpora'
)
source=("$_name-$pkgver.tar.gz::https://github.com/stanfordnlp/stanza/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('07858f7c91fc0c6bd499d544b4e67963994a52c06a8cf189cd67d373765398ed')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages _checkdir _installed
  _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  _checkdir="$srcdir/check"
  _installed="$_checkdir$_site_packages"

  rm -rf "$_checkdir" "$srcdir/test-home"
  mkdir -p "$srcdir/test-home/out"
  python -m installer --destdir="$_checkdir" "$_name-$pkgver"/dist/*.whl

  cd "$_checkdir"

  # Upstream's complete CI suite first downloads several language models and
  # CoreNLP archives.  Run the broad model-free upstream subset against the
  # built wheel, including the new parser, scheduler, speaker and cache tests.
  STANZA_TEST_HOME="$srcdir/test-home" \
  PYTHONPATH="$_installed" \
  python -m pytest -v --import-mode=importlib \
    "$_installed/stanza/tests/common/test_chuliu_edmonds.py" \
    "$_installed/stanza/tests/common/test_common_data.py" \
    "$_installed/stanza/tests/common/test_confusion.py" \
    "$_installed/stanza/tests/common/test_constant.py" \
    "$_installed/stanza/tests/common/test_data_conversion.py" \
    "$_installed/stanza/tests/common/test_dropout.py" \
    "$_installed/stanza/tests/common/test_maxout_linear.py" \
    "$_installed/stanza/tests/common/test_relative_attn.py" \
    "$_installed/stanza/tests/common/test_short_name_to_treebank.py" \
    "$_installed/stanza/tests/common/test_utils.py" \
    "$_installed/stanza/tests/common/test_warmup_plateau_scheduler.py" \
    "$_installed/stanza/tests/depparse/test_head_constraints.py" \
    "$_installed/stanza/tests/pipeline/test_tokenize_speaker.py" \
    "$_installed/stanza/tests/resources/test_default_packages.py" \
    "$_installed/stanza/tests/resources/test_list_installed.py" \
    "$_installed/stanza/tests/resources/test_prepare_resources.py" \
    "$_installed/stanza/tests/tokenization/test_tokenize_data_augmentation.py" \
    "$_installed/stanza/tests/tokenization/test_tokenize_data_structural_features.py" \
    "$_installed/stanza/tests/tokenization/test_vocab.py" \
    "$_installed/stanza/tests/ner/test_bsf_2_beios.py" \
    "$_installed/stanza/tests/ner/test_bsf_2_iob.py" \
    "$_installed/stanza/tests/resources/test_common.py::test_assert_file_exists" \
    "$_installed/stanza/tests/resources/test_common.py::test_parse_hf_url" \
    "$_installed/stanza/tests/resources/test_common.py::test_download_file_non_hf" \
    "$_installed/stanza/tests/resources/test_common.py::test_download_file_non_hf_404" \
    "$_installed/stanza/tests/resources/test_common.py::test_download_file_hf_url_with_proxies" \
    "$_installed/stanza/tests/resources/test_common.py::test_process_pipeline_parameters" \
    "$_installed/stanza/tests/resources/test_common.py::test_unzip_blocks_relative_traversal" \
    "$_installed/stanza/tests/resources/test_common.py::test_unzip_blocks_nested_traversal" \
    "$_installed/stanza/tests/resources/test_common.py::test_unzip_blocks_absolute_path" \
    "$_installed/stanza/tests/resources/test_common.py::test_unzip_allows_well_formed_zip"

  # Exercise the public Pipeline API without external model downloads.
  STANZA_TEST_HOME="$srcdir/test-home" \
  PYTHONPATH="$_installed" \
  python - <<'PY'
import json
import os
import tempfile

import stanza

assert stanza.__version__ == "1.14.0"
with tempfile.TemporaryDirectory() as model_dir:
    with open(os.path.join(model_dir, "resources.json"), "w", encoding="utf-8") as stream:
        json.dump({}, stream)
    pipeline = stanza.Pipeline(
        lang="xx",
        model_dir=model_dir,
        processors="tokenize",
        package=None,
        download_method=None,
        allow_unknown_language=True,
        tokenize_pretokenized=True,
        use_gpu=False,
    )
    document = pipeline([["Bonjour", "Arch", "!"], ["Stanza", "fonctionne", "."]])
    assert [[word.text for word in sentence.words] for sentence in document.sentences] == [
        ["Bonjour", "Arch", "!"],
        ["Stanza", "fonctionne", "."],
    ]
PY
}

package() {
  local _site_packages
  _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # The wheel includes upstream's pytest suite, which is used in check() but is
  # not part of Stanza's public runtime API.
  rm -rf "$pkgdir$_site_packages/stanza/tests"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
