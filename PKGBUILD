# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname='python-citeproc-py-styles'
pkgver=0.1.6
_pkgver=b6c4ecf2efad340107e3ce0bfe8b83b942e55579
pkgrel=1
pkgdesc='Supplementary CSL styles for citeproc-py'
url='https://github.com/inveniosoftware/citeproc-py-styles'
depends=('python' 'python-lxml' 'python-six')
checkdepends=('python-pytest')
makedepends=(
    'git'
    'python-hatchling'
    'python-build' 'python-installer'
)
license=('MIT WITH AdditionRef-CERN-waiver')
arch=('any')
source=("$pkgname::git+${url}.git#commit=$_pkgver")
declare -A _submods
_submods['citeproc_styles/styles']='csl-styles'
_cslStyleVer=872b2c8f6fda7129807cd3e4d695cf75adf3c15e # from .gitmodules
_cslStyleUrl=https://github.com/citation-style-language/styles
source+=("csl-styles::git+${_cslStyleUrl}.git#commit=$_cslStyleVer")

sha256sums=('f3f75d765021ccc8f00cf80879f0df2eb010bc3031092f895e00e89a5d3a173e'
            '2b46c749a9e176651077e8401396a1edfad45ea76f0ab17a628c55c0a0d6f668')

prepare() {
    cd "$pkgname"

    if ! sha256sum -c \
        <<< '33e2b2bffa1ad4686756beefadebd39a377e09e5ab7b03109f393edb698adbc9  .gitmodules'
    then
        msg "$pkgname/.gitmodules differs from expectation"
        msg 'Check it against the submodule list in PKGBUILD'
        exit 1
    fi

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
    test-env/bin/python -m pytest --disable-plugin-autoload \
        -o addopts='' --doctest-glob="*.rst" --doctest-modules
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"/
}
