# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-lm-eval
_pkgname=lm_eval
pkgver=0.4.13
pkgrel=1
pkgdesc="A framework for few-shot evaluation of language models (EleutherAI lm-evaluation-harness)"
arch=('any')
url="https://github.com/EleutherAI/lm-evaluation-harness"
license=('MIT')
depends=(
    'python'
    'python-datasets'
    'python-numpy'
    'python-evaluate'
    'python-jinja'
    'python-pytablewriter'
    'python-rouge-score'
    'python-sacrebleu'
    'python-scikit-learn'
    'python-sqlitedict'
    'python-dill'
    'python-word2number'
    'python-more-itertools'
    'python-requests'
    'python-typing_extensions'
    'python-tqdm'
    'python-yaml'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
    'python-pytorch'
    'python-transformers'
)
optdepends=(
    'python-aiohttp: for API model backends'
    'python-tenacity: for API model backends'
    'python-tiktoken: for API model backends'
    'python-jsonlines: for the archiver extra'
    'python-zstandard: for the archiver extra'
    'python-transformers: for HuggingFace model support'
    'python-pytorch: for HuggingFace model support'
    'python-accelerate: for HuggingFace model support'
    'python-peft: for HuggingFace model support'
    'python-vllm: for vLLM model backend'
    'litellm: for the LiteLLM model backend'
    'python-sentencepiece: for SentencePiece tokenizers'
    'python-nltk: for the ifeval/ruler tasks'
    'python-langdetect: for the ifeval task'
    'python-immutabledict: for the ifeval task'
    'python-sympy: for the math task'
    'python-scipy: for the ruler task'
    'python-wandb: for Weights & Biases logging'
    'python-pandas: for Weights & Biases / zeno logging'
    'python-pytest: for the run_task_tests validation helper'
)
_archive="lm-evaluation-harness-$pkgver"
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'lm-eval-workflow.py'
)
sha256sums=(
    'f1903f0c1346aed93bb38fda97318f1144cbafb07441913bd8428f11b0e33957'
    '7314e82a9e876ef0d6ed7c7e796b68b44014cf1b1f55cb09e60357ef48cdc163'
)

build() {
    cd "$_archive"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_archive"

    local _check="$srcdir/_check"
    local _site
    rm -rf "$_check" "$srcdir/_suite" "$srcdir/_test-home"
    mkdir -p "$srcdir/_suite" "$srcdir/_test-home"
    python -m installer --destdir="$_check" dist/*.whl
    _site="$_check$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
    cp -a tests "$srcdir/_suite/"
    # New BBH filter regressions load task files by repository-relative path.
    # Point that path to the installed wheel, never to the source package.
    ln -s "$_site/lm_eval" "$srcdir/_suite/lm_eval"

    # Run the complete framework-neutral suite against the installed wheel.
    # The excluded upstream jobs require optional model backends or remote
    # models/datasets. Keep the TaskManager and prompt modules, removing only
    # their nodes that instantiate MMLU/AI2 ARC datasets from the Hub.
    cd "$srcdir/_suite"
    env \
        DATASETS_OFFLINE=1 \
        HF_DATASETS_OFFLINE=1 \
        HF_HUB_OFFLINE=1 \
        HOME="$srcdir/_test-home" \
        HTTP_PROXY='http://127.0.0.1:9' \
        HTTPS_PROXY='http://127.0.0.1:9' \
        NO_PROXY='' \
        PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
        PYTHONPATH="$_site:$srcdir/_suite" \
        python -P -m pytest -ra tests \
            --ignore=tests/models \
            --ignore=tests/scripts \
            --ignore=tests/test_evaluator.py \
            --ignore=tests/test_requests_caching.py \
            --ignore=tests/test_tasks.py \
            --deselect=tests/test_prompt.py::test_mmlu_prompt_rendering \
            --deselect=tests/test_task_manager.py::TestTaskManagerIntegration::test_load_tag_by_name \
            --deselect=tests/test_task_manager.py::TestTaskManagerIntegration::test_include_path_precedence \
            --deselect=tests/test_task_manager.py::TestTaskManagerLoad::test_load_tag_by_name \
            --deselect=tests/test_task_manager.py::TestTaskManagerLoad::test_include_path_precedence \
            --deselect=tests/test_task_manager.py::test_python_task_inclusion

    # Execute the installed evaluator end-to-end with an in-memory task and
    # model: build requests, run generation, aggregate exact-match, and log
    # samples without downloading a checkpoint or dataset.
    env HF_HUB_OFFLINE=1 HOME="$srcdir/_test-home" PYTHONPATH="$_site" \
        python -P "$srcdir/lm-eval-workflow.py"
}

package() {
    cd "$_archive"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
