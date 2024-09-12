# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_name=great-tables
pkgname="python-${_name}"
pkgver=0.10.0
_tag=3a14f2b6c08e59c442ca4f55511312888b69c860 # git rev-parse "v${pkgver}"
pkgrel=2
pkgdesc="Make awesome display tables using Python"
arch=('any')
url="https://posit-dev.github.io/great-tables/"
license=('MIT')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
depends=('ipython'
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
checkdepends=('python-ipykernel' 'python-pytest' 'selenium-manager' 'python-pytest-textual-snapshot')
source=("$pkgname-$pkgver::git+https://github.com/posit-dev/great-tables.git#tag=$_tag"
	"pytest.ini")
b2sums=('cdc33a8b91e472e223f9cb66ed1d06508465a75dde40eb5585b3134982efd15e570a159f0161a71351c69decba9d687c4b0ffee3ca8ab4f5a1403138b957605d'
        '6fc96614ad70fdb6774643e5a6bc08165cab99f5f0241c9b885fa93ba0742ff5f8224360c9914a9b8924311f3387fb6b204ec95a2be5dfb0e4dee711adf177da')

prepare() {
    cd $pkgname-$pkgver
    cp ../pytest.ini pytest.ini
}

check() {
    cd $pkgname-$pkgver

    # Skipped tests :
    #   shiny:There is no package
    #   dependencies: packages are dependencies, so this test always fails?
    pytest --ignore=tests/test_shiny.py --ignore=tests/test_dependencies.py
}

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
    cd $pkgname-$pkgver

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
