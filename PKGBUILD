# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_name=great-tables
pkgbase=python-$_name
pkgname=($pkgbase $pkgbase-docs)
pkgver=0.13.0
# setup-tools-scm doesn't get the dependencies right from the tarball sources
# https://wiki.archlinux.org/title/Talk:Python_package_guidelines#Prefer_VCS_source_for_setuptools-scm_and_friends
_tag=3bafd96c87e3593f51e2344f3da4c01c4112913b # git rev-parse "v${pkgver}"
pkgrel=4
pkgdesc="Make awesome display tables using Python"
arch=('any')
url="https://posit-dev.github.io/great-tables/"
license=('MIT')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools-scm'
    'python-wheel'

    # -docs
    'jupyter-nbclient'
    'jupyter-nbformat'
    'python-pyarrow'
    'python-pydantic'
    'quarto'
    'quartodoc'
)
depends=(
    'ipython'
    'python-babel>=2.13.1'
    'python-commonmark>=0.9.1'
    'python-htmltools>=0.4.1'
    'python-importlib-metadata'
    'python-importlib_resources'
    'python-numpy>=1.22.4'
    'python-pandas'
    'python-pillow'
    'python-polars'
    'python-selenium'
    'python-typing_extensions>=3.10.0.0'
    'python>=3.9'
)
checkdepends=(
    'chromium'
    'python-ipykernel'
    'python-pytest'
    'python-pytest-cov'
    'python-pytest-textual-snapshot'
    'python-requests'
    'selenium-manager'
)
source=("$pkgname-$pkgver::git+https://github.com/posit-dev/great-tables.git#tag=$_tag")
b2sums=('6d7fcdb2175e22fe0b2d3c480f92199a2d2a590e0f0642e87c9c9aa7b2d8bcef99f8e320b0cb08494cd1721bbc025a096d2e25900bc13e59cccca39f6f8c53f3')

prepare() {
    # Remove artifacts of previous builds
    # https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
   git -C $srcdir/$pkgbase-$pkgver clean -dfx
}

check() {
    cd $srcdir/$pkgbase-$pkgver

    # Skipped tests :
    #   shiny: There is no package
    #   dependencies: packages are dependencies, so this test always fails?
    PYTHONPATH=. pytest --snapshot-update --ignore=tests/test_shiny.py --ignore=tests/test_dependencies.py
}

build() {
    cd $srcdir/$pkgbase-$pkgver
    python -m build --wheel --skip-dependency-check --no-isolation

    cd docs
    PYTHONPATH=$srcdir/$pkgbase-$pkgver quartodoc build --verbose
    PYTHONPATH=$srcdir/$pkgbase-$pkgver quarto render
}

package_python-great-tables() {
    cd $srcdir/$pkgbase-$pkgver

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-great-tables-docs() {
    pkgdesc="HTML Documentation for ${basename}"
    arch=('any')
    depends=()

    cd $srcdir/$pkgbase-$pkgver
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd docs/_site
    find . -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgbase}/html/{}" \;
}
