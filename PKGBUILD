# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Letu Ren <fantasquex at gmail dot com>
# Contributor:: Ocelot <1112345@airmail.cc>

pkgname=python-censys
_name=censys
_srcname=censys-python
pkgver=2.2.19
pkgrel=1
pkgdesc='An easy-to-use and lightweight API wrapper for Censys APIs'
arch=('any')
url='https://censys.io'
license=('Apache-2.0')
depends=(
  'python'
  'python-argcomplete'
  'python-backoff'
  'python-requests'
  'python-rich'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
)
checkdepends=(
  'python-parameterized'
  'python-pytest'
  'python-pytest-mock'
  'python-responses'
)
provides=('censys')
conflicts=('censys')
source=("${_srcname}-${pkgver}.tar.gz::https://github.com/censys/${_srcname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4d00e1be018eed5017caf7ccc75a74aeb19847786755544a0bab223b6ab8dca9')

build() {
    cd "${_srcname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_srcname}-${pkgver}"
    local _site
    _site=$(python -c 'import site; print(site.getsitepackages()[0])')
    rm -rf tmp_install
    python -m installer --destdir=tmp_install dist/*.whl
    PYTHONPATH="tmp_install${_site}:${PWD}" \
        python -m pytest --no-header -q --override-ini='addopts=' \
        --deselect tests/cli/test_cli.py::CensysCliTest::test_default_help \
        --deselect tests/cli/test_cli.py::CensysCliTest::test_help \
        --deselect tests/cli/test_search.py::CensysCliSearchTest::test_search_help \
        --deselect tests/cli/test_view.py::CensysCliViewTest::test_search_help
}

package() {
    cd "${_srcname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    register-python-argcomplete --shell bash censys \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/censys"
    register-python-argcomplete --shell zsh censys \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_censys"
    register-python-argcomplete --shell fish censys \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/censys.fish"
}

latestver() {
    curl -fsSL "https://pypi.org/pypi/${_name}/json" | python3 -c "import sys,json; print(json.load(sys.stdin)['info']['version'])"
}
