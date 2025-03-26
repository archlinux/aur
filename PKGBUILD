# Maintainer: redponike <proton (dot) me>

pkgname=python-cobra
_pkgname=cobrapy
pkgver=0.29.1
pkgrel=1
pkgdesc="COBRApy is a package for constraint-based modeling of metabolic networks."
arch=('x86_64')
url="https://opencobra.github.io/cobrapy"
_ghurl="https://github.com/opencobra/cobrapy"
license=('GPL-2.0')
depends=('python-appdirs' 'python-diskcache' 'python-httpx' 
          'python-numpy' 'python-optlang' 'python-importlib_resources' 'python-pandas'
          'python-pydantic' 'python-rich' 'python-ruamel-yaml' 'python-swiglpk' 'libsbml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-mock')
optdepends=('python-scipy: Sparse matrix support')
source=("$_ghurl/archive/refs/tags/${pkgver}.tar.gz"
		"0001-remove-depinfo-dependency.diff"
        "0002-fix-gpr-copy-py313.diff::$_ghurl/pull/1412.diff")
sha256sums=('2c60269959e212525ca79e85d990dba48c92e30db5795446f48e777912fc92a2'
            '5628c19777fadef9cfb8773db178ad9ab34b7febf621303ca646caf32fd65b49'
            'f7997e8414ea759037675c3b13c2925b1d7f351dd1c56c3286fb45beadb8154e')


prepare() {
    cd ${_pkgname}-${pkgver}
    # Remove depinfo dependency and replace it with importlib
    patch -p1 -i "$srcdir/0001-remove-depinfo-dependency.diff"
    # Patch the GPR copy/deepcopy as it's causing issues with Python 3.13
    patch -p1 -i "$srcdir/0002-fix-gpr-copy-py313.diff"
}

build() {
    cd ${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd ${_pkgname}-${pkgver}

    # Create a virtual environment - the tests need to import the patched cobra
    python -m venv --system-site-packages test-env
    source test-env/bin/activate

    # Install the wheel we just built
    test-env/bin/pip install dist/*.whl

    # Run tests in a an isolated directory outside the source tree
    _temp_dir=$(mktemp -d)

    # Copy the tests directory
    cp -r "${srcdir}/${_pkgname}-${pkgver}/tests" "$_temp_dir/"
    cd "$_temp_dir/tests"

    # Now run the tests on the isolated env
    PYTHONPATH="$_temp_dir/tests" python -m pytest -vv --import-mode=importlib .

    # Cleanup - nice and tidy
    cd ../..
    rm -rf "$_temp_dir"
    deactivate
}

package() {
    cd ${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" --compile-bytecode=1 dist/*.whl
}
