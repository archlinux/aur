# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_name=great-tables
pkgbase=python-$_name
pkgname=($pkgbase $pkgbase-docs)
pkgver=0.22.0
# setup-tools-scm doesn't get the dependencies right from the tarball sources
# https://wiki.archlinux.org/title/Talk:Python_package_guidelines#Prefer_VCS_source_for_setuptools-scm_and_friends
_tag=93fc0a08be34a233fb98333569f6d0b95d4db73c # git rev-parse "v${pkgver}"
pkgrel=1
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
    'python-babel>=2.13.1'
    'python-faicons>=0.2.2'
    'python-htmltools>=0.4.1'
    'python-importlib-metadata'
    'python-importlib_resources'
    'python-multimark>=0.1.3'
    'python-nokap>=0.1.0'
    'python-typing_extensions>=3.10.0.0'
    'python>=3.10'

    # optional [extra] feature deps (image export, css inlining)
    'python-css-inline>=0.20.2'
    'python-numpy>=1.22.4'
    'python-pandas'
    'python-pillow>=10.2.0'
    'python-polars'
    'python-selenium>=4.18.1'
)
checkdepends=(
    'chromium'
    'python-ipykernel'
    'python-pytest'
    'python-pytest-cov'
    'python-requests'
    'python-syrupy'
    'selenium-manager'
)
source=("$pkgname-$pkgver::git+https://github.com/posit-dev/great-tables.git#tag=$_tag")
b2sums=('44d6b824d95c38b83b3aa9a4efc5a05466a6833abcc8a7babb98e676cc0d49e62026c11a934eecafd0bda8aa1a6294b247918c7426a8c91e30d53b3a5bcb934d')

prepare() {
    git -C $pkgbase-$pkgver clean -dfx

    # Remove incomplete (work in progress?) documentation that prevents documentation from building
    # https://github.com/posit-dev/great-tables/issues/507
    rm -rf $srcdir/$pkgbase-$pkgver/docs/a-latex_examples

    # The gt-extras-gini example imports gt_extras, which depends on great-tables
    # itself (circular dependency). Drop the example and the "Ecosystem" section
    # of the examples page that embeds it, so the docs build without gt-extras.
    cd $srcdir/$pkgbase-$pkgver
    rm -rf docs/examples/gt-extras-gini
    sed -i '/^## Ecosystem/,$d' docs/examples/index.qmd
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
