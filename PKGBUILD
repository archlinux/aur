# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-xarray-datatree
_pname=${pkgbase#python-}
_pyname=${_pname/-/_}
pkgname=("python-${_pname}")
#"python-${_pyname}-doc")
pkgver=0.0.15
pkgrel=1
pkgdesc="Hierarchical tree-like data structures for xarray"
arch=('any')
url="https://xarray-datatree.readthedocs.io"
license=('Apache-2.0')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'check-manifest')
#            'python-sphinx-autosummary-accessors'
#            'python-sphinx-copybutton'
#            'python-sphinx-book-theme'
#            'python-sphinxcontrib-srclinks'
#            'python-sphinxext-opengraph'
#            'python-nbsphinx'
#            'ipython'
#            'python-xarray')
##            'ttf-roboto'
#            'python-numpydoc'
checkdepends=('python-pytest'
              'python-netcdf4'
              'python-h5netcdf'
              'python-xarray'
              'python-zarr')   # xarray already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('651a8935c8c9b94a3b8b5b1742e6012d')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   mkdir -p docs/source/_static
#   sed -i -e "/GH/s/GH/GH\%s/" docs/source/conf.py
    sed -i "s/HybridMappingProxy/FilteredMapping/g" datatree/datatree.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
#   PYTHONPATH="${srcdir}/${_pyname}-${pkgver}/build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    # E   ModuleNotFoundError: No module named 'xarray.tests'
    pytest --ignore=datatree/tests/test_datatree.py || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-xarray-datatree() {
    depends=('python>=3.9' 'python-xarray>=2023.12.0' 'python-packaging')
    optdepends=('python-netcdf4: allow file I/O'
                'python-h5netcdf: allow file I/O'
                'python-zarr: allow file I/O'
                'python-xarray-datatree-doc: Documentation for xarray datatree')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-xarray-datatree-doc() {
#    pkgdesc="Documentation for xarray datatree"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
