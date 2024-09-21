# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_name=great-tables
pkgname="python-${_name}"
pkgver=0.11.1
# setup-tools-scm doesn't get the dependencies right from the tarball sources
# https://wiki.archlinux.org/title/Talk:Python_package_guidelines#Prefer_VCS_source_for_setuptools-scm_and_friends
_tag=079dc836f7e198b6879a0f99a624ea5da271fdfa # git rev-parse "v${pkgver}"
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
    'python-ipykernel'
    'python-pytest'
    'python-pytest-textual-snapshot'
    'selenium-manager'
)
source=("$pkgname-$pkgver::git+https://github.com/posit-dev/great-tables.git#tag=$_tag"
	"pytest.ini")
b2sums=('8ecdc238e3fd9c6101b1e86a3078aab3aee47dc44d2520428d86e7568e37bfa2e6a92304cded6271950e7e524f8e7fe85efbf28271e7849d49abfeefe7855c16'
        '6fc96614ad70fdb6774643e5a6bc08165cab99f5f0241c9b885fa93ba0742ff5f8224360c9914a9b8924311f3387fb6b204ec95a2be5dfb0e4dee711adf177da')

prepare() {
    cd $pkgname-$pkgver
    cp ../pytest.ini pytest.ini
}

check() {
    cd $pkgname-$pkgver

    # Skipped tests :
    #   shiny: There is no package
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
