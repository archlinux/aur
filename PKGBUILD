# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain-community
pkgname="python-${_pkgname}"
pkgver=0.4.2
pkgrel=2
pkgdesc="Community contributed LangChain integrations."
arch=('any')
url="https://github.com/langchain-ai/langchain/blob/master/libs/community"
license=('MIT')
depends=(
    'python'
    'python-aiohttp>=3.8.3'
    'python-aiohttp<4'
    'python-httpx-sse>=0.4'
    'python-httpx-sse<1'
    'python-langchain-classic>=1.0.7'
    'python-langchain-classic<2'
    'python-langchain-core>=1.4'
    'python-langchain-core<2'
    'python-langsmith>=0.1.125'
    'python-langsmith<1'
    'python-mypy_extensions'
    'python-numpy>=2.1'
    'python-numpy<3'
    'python-pydantic-settings>=2.10.1'
    'python-pydantic-settings<3'
    'python-requests>=2.32.5'
    'python-requests<3'
    'python-sqlalchemy>=1.4'
    'python-sqlalchemy<3'
    'python-tenacity>=8.1'
    'python-tenacity<10'
    'python-yaml>=5.3'
    'python-yaml<7'
)
optdepends=(
    'python-beautifulsoup4: HTML and web document loaders'
    'python-lxml: XML and HTML document loaders'
    'python-networkx: NetworkX graph and vector stores'
    'python-pandas: data-frame and data-warehouse integrations'
    'python-pillow: image and PDF document loaders'
    'python-pyparsing: Ontotext GraphDB query parsing'
    'python-pytorch: local and self-hosted machine-learning integrations'
    'python-pytz: timezone handling for the Arthur callback'
)
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
checkdepends=(
    'python-beautifulsoup4'
    'python-blockbuster'
    'python-cffi'
    'python-freezegun'
    'python-langchain-tests'
    'python-lark-parser'
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
_archive="${_pkgname}-libs-community-v${pkgver}"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/langchain-ai/langchain-community/archive/refs/tags/libs/community/v${pkgver}.tar.gz"
    'python-3.14-ast-constant-test.patch'
    'pytest-fixture-decorators.patch'
)
sha256sums=(
    'e611bbf6985f8ff613cfb8d2d5cd47879116054bccc69b458c2fbe8f15ebfd6e'
    '0788b182b216f2b457f4f73a1ac9b6582dac314d06b645f1ddd578ee75705e8e'
    '8595464bd24786e3ed0e7d3a6efd0e67929a1fea8911931a9f513d706c7d8e4f'
)

prepare() {
    cd "${_archive}"
    patch -Np1 -i "$srcdir/python-3.14-ast-constant-test.patch"
    # pytest 9 rejects marks on fixtures. Loader test functions are tests, not
    # fixtures; SQL tests already carry their own optional-dependency marks.
    patch -Np1 -i "$srcdir/pytest-fixture-decorators.patch"
}

build() {
    cd "${_archive}/libs/community"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_archive}/libs/community"
    local _site_packages
    _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

    rm -rf "$srcdir/test-root" "$srcdir/test-run"
    python -m installer --destdir="$srcdir/test-root" dist/*.whl
    install -d "$srcdir/test-run"
    cp -a tests pyproject.toml "$srcdir/test-run/"
    # Some upstream structure tests inspect the on-disk package tree.  Expose
    # the package installed from the wheel, never the source checkout.
    ln -s "$srcdir/test-root$_site_packages/langchain_community" \
        "$srcdir/test-run/langchain_community"

    cd "$srcdir/test-run"
    # Upstream's default `make test` target is the complete 1,000+ case unit
    # suite. The separate integration tree requires live APIs, credentials,
    # databases and vendor services, so it is not runnable in an offline build.
    # A few local-service failure paths resolve/connect to loopback, so permit
    # only loopback and this host.
    local _hostname
    _hostname="$(python -c 'import socket; print(socket.gethostname())')"
    env -u http_proxy -u https_proxy -u HTTP_PROXY -u HTTPS_PROXY \
        -u all_proxy -u ALL_PROXY \
        PYTHONPATH="$srcdir/test-root$_site_packages" \
        pytest -n "${SLURM_CPUS_PER_TASK:-4}" \
        --disable-socket --allow-unix-socket \
        --allow-hosts="localhost,127.0.0.1,::1,$_hostname" \
        tests/unit_tests
}

package() {
    cd "${_archive}/libs/community"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 ../../LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
