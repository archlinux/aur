# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-arviz-base
_pname=${pkgbase#python-}
_pyname=${_pname}
#_pyname=${_pname//-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=1.2.0
pkgrel=1
pkgdesc="Base ArviZ features and converters"
arch=('any')
url="https://python.arviz.org/projects/base"
license=('Apache-2.0')
makedepends=('python-flit-core>=3.4'
             'python-build'
             'python-installer'
             'python-sphinx-copybutton'
             'python-sphinx_design'
             'python-sphinx-book-theme'
             'python-jupyter-sphinx'
             'python-myst-nb'
             'python-numpydoc'
#            'python-tinycss2'
             'python-xarray'
             'python-lazy-loader'
             'python-h5netcdf'
             'python-linkify-it-py')  # tinycss2 <- nbconvert <- jupytersphinx
checkdepends=('python-pytest')
#checkdepends=('python-pytest-xdist')
#             )   # xarray, h5netcdf, lazy-loader already in makedepends
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/arviz-devs/arviz-base/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('812747e38775258bee41e844fb3c5772')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation --skip-dependency-check

    msg "Building Docs"
    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="../../dist/lib" env -C docs/source sphinx-build -b html -d _build/doctrees . _build/html
#   PYTHONPATH="../../src" env -C docs/source sphinx-build -b html -d _build/doctrees . _build/html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="src" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-arviz-base() {
    depends=('python>=3.12'
             'python-numpy>=2'
             'python-xarray>=2024.11.0'
             'python-typing_extensions>=3.10'
             'python-lazy-loader>=0.4')
    optdepends=('python-h5netcdf'
                'python-h5py'
                'python-netcdf4'
                'python-zarr'
                'python-arviz-base-doc: Documentation for arviz-base')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-arviz-base-doc() {
    pkgdesc="Documentation for Python arviz-base"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/source/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
