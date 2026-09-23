# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname='python-citeproc-py'
pkgver=0.9.0
_pkgver=adc70c3df99037fe8f49e8b40c7afd852b319bbb
pkgrel=1
pkgdesc="Citations and bibliography formatter"
url="https://github.com/citeproc-py/citeproc-py"
depends=('python' 'python-lxml')
checkdepends=('python-pytest' 'python-citeproc-py-styles')
optdepends=(
    'python-citeproc-styles: for more citation styles'
)
makedepends=(
    'git'
    'python-setuptools'
    'python-versioneer'
    'python-build' 'python-installer'
    'rnc2rng'
)
license=('BSD-2-Clause-Views')
arch=('any')
source=("$pkgname::git+${url}.git#tag=$_pkgver")

declare -A _submods
_submods['citeproc/data/schema']='csl-schema'
source+=(csl-schema::git+https://github.com/citation-style-language/schema.git)
_submods['citeproc/data/locales']='csl-locales'
source+=(csl-locales::git+https://github.com/citation-style-language/locales.git)

_testVer=5e2c0ed89b3d728376592ecac8eb21e39ced3f77 # from citeproc-test.py
_testUrl=https://github.com/citation-style-language/test-suite
_submods['tests/test-suite']='csl-tests'
source+=("csl-tests::git+${_testUrl}.git#commit=${_testVer}")

sha256sums=('5a5bc0b652c8a3f51e7078b022778be11bd5b78993629133d33d5dc28c69a1b6'
            'SKIP'
            'SKIP'
            '5189c9de1064f12163117d6f63eb87b62a0f578890590db5d5d200f5f2da0a55')

prepare() {
    cd "$pkgname"

    if ! sha256sum -c \
        <<< '304b09a991a593fc142db1932f38da252e2a8f0eef4cb5887ed9f5c6cafcb5e1  .gitmodules'
    then
        echo "$pkgname/.gitmodules differs from expectation"
        echo 'Check it against the submodule list in PKGBUILD'
        exit 1
    fi

    sed -i '/tests\/test-suite/s/^/# /' .gitignore
    git -c protocol.file.allow=always submodule add \
        ../csl-tests tests/test-suite
    git -C tests/test-suite checkout "$_testVer"

    git submodule init
    for _mod in "${_submods[@]}"; do
        git config submodule."$_mod".url "$srcdir/${_submods[$_mod]}"
    done
    # See https://bugs.archlinux.org/task/76255 for why this is safe
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -m pytest --disable-plugin-autoload tests
    test-env/bin/python tests/citeproc-test.py
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"/
}
