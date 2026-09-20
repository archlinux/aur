# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain-classic
_pipname=${_pkgname//-/_}
pkgname="python-${_pkgname}"
pkgver=1.0.8
pkgrel=1
pkgdesc="Building applications with LLMs through composability (Legacy version)"
arch=('any')
url='https://github.com/langchain-ai/langchain/tree/master/libs/langchain'
license=('MIT')
depends=(
    'python'
    'python-langchain-core>=1.4.4'
    'python-langchain-text-splitters>=1.1.2'
    'python-langsmith>=0.1.17'
    'python-pydantic>=2.7.4'
    'python-yaml>=5.3'
    'python-requests>=2'
    'python-sqlalchemy>=1.4'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
)
checkdepends=(
    'python-cffi'
    'python-freezegun'
    'python-langchain-openai'
    'python-langchain-tests'
    'python-lark-parser'
    'python-numpy'
    'python-packaging'
    'python-pandas'
    'python-pytest'
    'python-pytest-asyncio'
    'python-pytest-cov'
    'python-pytest-mock'
    'python-pytest-socket'
    'python-pytest-xdist'
    'python-requests-mock'
    'python-responses'
    'python-syrupy'
    'python-toml'
)
optdepends=(
    'python-langchain-community: community integrations'
    'python-langchain-ollama: Ollama integration'
    'python-langchain-openai: OpenAI integration'
    'python-lark-parser: structured-query parsing'
    'python-numpy: embedding filters and numerical chains'
    'python-pandas: Pandas DataFrame output parsing'
    'python-scipy: embedding-distance evaluation'
)
# Monorepo: langchain-classic lives in libs/langchain, tagged "langchain-classic==<ver>".
# The "==" in the tag is URL-encoded as %3D%3D for the GitHub archive download.
_archive="langchain-${_pkgname}-${pkgver}"
source=(
    "${pkgname}-${pkgver}.tar.gz::${url%/tree/*}/archive/refs/tags/${_pkgname}%3D%3D${pkgver}.tar.gz"
    'langchain-openai-1.3.5-test-compat.patch'
)
sha256sums=(
    '6c681b8a830ad99ae155fb527f31f0354508cea14f08073da9f38b748a775167'
    'c004dd50ab35c9bf2b51a9b31ee0389acf8f3f77061c716b14b0f3663694963b'
)

prepare() {
    cd "${_archive}/libs/langchain"
    patch -Np1 -i "$srcdir/langchain-openai-1.3.5-test-compat.patch"
}

build() {
    cd "${_archive}/libs/langchain"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_archive}/libs/langchain"

    local _checkdir="$srcdir/check-langchain-classic"
    local _site
    rm -rf "$_checkdir"
    python -m installer --destdir="$_checkdir" dist/*.whl
    _site=$(python -c 'import site; print(site.getsitepackages()[0])')

    # Copy only test inputs/configuration beside the staged wheel so the source
    # package cannot shadow the packaged artifact.
    cp -a tests "$_checkdir/tests"
    cp pyproject.toml "$_checkdir/pyproject.toml"
    ln -s "$_checkdir$_site/langchain_classic" "$_checkdir/langchain_classic"

    cd "$_checkdir"
    PYTHONPATH="$_checkdir$_site" \
        python -m pytest -p no:randomly --import-mode=importlib \
        -n "${SLURM_CPUS_PER_TASK:-4}" \
        --disable-socket --allow-unix-socket tests/unit_tests

    # Exercise a classic LLM chain, YAML prompt loading, and the SQL-backed
    # record manager using only local deterministic resources.
    cat > prompt.yaml <<'EOF'
_type: prompt
input_variables:
  - topic
template: "Give one concise word about {topic}."
EOF
    PYTHONPATH="$_checkdir$_site" python - <<'PY'
from langchain_classic.chains import LLMChain
from langchain_classic.indexes._sql_record_manager import SQLRecordManager
from langchain_classic.prompts import load_prompt
from langchain_core.language_models.fake import FakeListLLM

prompt = load_prompt("prompt.yaml")
chain = LLMChain(
    llm=FakeListLLM(responses=["reliable"]),
    prompt=prompt,
)
result = chain.invoke({"topic": "Arch Linux packaging"})
assert result["text"] == "reliable"

manager = SQLRecordManager("documents", db_url="sqlite:///:memory:")
manager.create_schema()
manager.update(["doc-1", "doc-2"], group_ids=["manual", "manual"])
assert manager.exists(["doc-1", "missing", "doc-2"]) == [True, False, True]
manager.delete_keys(["doc-1"])
assert manager.exists(["doc-1", "doc-2"]) == [False, True]
PY
}

package() {
    cd "${_archive}/libs/langchain"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
