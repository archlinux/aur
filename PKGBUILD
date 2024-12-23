# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_name=great-tables
pkgbase=python-$_name
pkgname=($pkgbase $pkgbase-docs)
pkgver=0.14.0
# setup-tools-scm doesn't get the dependencies right from the tarball sources
# https://wiki.archlinux.org/title/Talk:Python_package_guidelines#Prefer_VCS_source_for_setuptools-scm_and_friends
_tag=5913c570b9bc6fc882498755409d32472e8b9994 # git rev-parse "v${pkgver}"
pkgrel=2
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
    'quartodoc>=0.8.1'
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
b2sums=('192af743b1e9bff3a8131e552fdc12cd6ada485b6a4dd32390a0de2db94e10e27dd18c5257868449ef9f6f8bd4ac9a12f601679ad35c237b94991b408e48d94b')

prepare() {
    git -C $pkgbase-$pkgver clean -dfx

    # Remove incomplete (work in progress?) documentation that prevents documentation from building
    # https://github.com/posit-dev/great-tables/issues/507
    rm -rf $srcdir/$pkgbase-$pkgver/docs/a-latex_examples
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

    python -m installer --destdir=tmp_install dist/*.whl
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    # NOTE: This does not work with paru/yay etc because of a bug in quarto-cli
    # https://github.com/quarto-dev/quarto-cli/issues/3186
    PYTHONPATH="${PWD}/tmp_install/${site_packages}" make docs-build
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
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgbase}/html/{}" \;
}
